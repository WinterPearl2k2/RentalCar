package controllers

import (
	"errors"
	"fmt"
	"math/rand"
	"net/http"
	"net/smtp"
	"os"
	"rent-car/initializers"
	"rent-car/models"
	UserRepository "rent-car/repositories/users"
	"time"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func ForgotPassword(context *gin.Context) {
	email := context.Param("email")

	user, err := UserRepository.GetByEmail(email)
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			context.JSON(http.StatusBadRequest, gin.H{
				"message": "Incorrect email",
			})
			return
		}
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": err.Error(),
		})
		return
	}

	// Tạo mã token
	token, err := generateRandomToken()
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": "Error generating token",
		})
		return
	}

	// Gửi mã token qua email
	err = sendTokenByEmail(user.EmailUser, token)
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": "Error sending email",
		})
		return
	}

	expiration := time.Now().Add(1 * time.Minute)
	verification := models.Verification{
		Code:       token,
		Email:      email,
		Expiration: expiration,
	}

	result := initializers.DB.Save(&verification)
	if result.Error != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": "Error sending email",
		})
		return
	}

	context.JSON(http.StatusOK, gin.H{
		"expiration": expiration,
	})
}

func VerifyCode(context *gin.Context) {
	var body CodeData
	if err := context.ShouldBindJSON(&body); err != nil {
		context.JSON(http.StatusUnprocessableEntity, gin.H{
			"message": "Invalid information",
		})
		return
	}

	verification, err := UserRepository.GetVerifyByEmail(body.Email)
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			context.JSON(http.StatusBadRequest, gin.H{
				"message": "Incorrect email",
			})
			return
		}
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": err.Error(),
		})
		return
	}

	if body.Code != verification.Code {
		context.JSON(http.StatusUnauthorized, gin.H{"message": "Verification code does not match"})
		return
	}

	if time.Now().After(verification.Expiration) {
		context.JSON(http.StatusUnauthorized, gin.H{"message": "Verification code has expired"})
		return
	}

	UserRepository.DeleteVerifyByEmail(body.Email)
	context.JSON(http.StatusOK, gin.H{
		"message": http.StatusOK,
	})
}

func generateRandomToken() (string, error) {
	rand.Seed(time.Now().UnixNano())

	token := ""
	for i := 0; i < 4; i++ {
		num := rand.Intn(10)
		token += fmt.Sprintf("%d", num)
	}

	return token, nil
}

func sendTokenByEmail(email, token string) error {
	from := os.Getenv("EMAIL")
	password := os.Getenv("PASSWORD")
	to := email
	smtpHost := "smtp.gmail.com"
	smtpPort := "587"
	auth := smtp.PlainAuth("", from, password, smtpHost)

	// Tạo thông điệp email
	msg := []byte(fmt.Sprintf("To: %s\r\n", email) +
		"Subject: Password Reset\r\n" +
		"\r\n" +
		"Your password reset code is: " + token + "\r\n" +
		"This code is valid for 1 minute.\r\n")

	// Gửi email
	err := smtp.SendMail(smtpHost+":"+smtpPort, auth, from, []string{to}, msg)
	if err != nil {
		fmt.Println("Error sending email:", err)
		return err
	}

	fmt.Println("Email sent successfully")
	return nil
}
