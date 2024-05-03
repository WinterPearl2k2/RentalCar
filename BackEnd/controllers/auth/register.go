package controllers

import (
	"net/http"
	"rent-car/initializers"
	"rent-car/models"
	"strings"

	"github.com/gin-gonic/gin"
	"golang.org/x/crypto/bcrypt"
)

func RegisterUser(context *gin.Context) {
	var body RegisterBody

	if err := context.ShouldBindJSON(&body); err != nil {
		context.JSON(http.StatusUnprocessableEntity, gin.H{
			"error": err.Error(),
		})
		return
	}

	hash, err := bcrypt.GenerateFromPassword([]byte(body.Password), 10)

	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	user := models.User{
		EmailUser:    body.Email,
		NameUser:     body.Name,
		PhoneUser:    body.PhoneNumber,
		PasswordUser: string(hash),
	}

	result := initializers.DB.Create(&user)

	if result != nil {
		errorMessage := result.Error.Error()
		if strings.Contains(errorMessage, "unique constraint") {
			context.JSON(http.StatusConflict, gin.H{
				"error": "User e-mail already exsits",
			})
			return
		}

		context.JSON(http.StatusInternalServerError, gin.H{
			"error": errorMessage,
		})
		return
	}

	context.JSON(http.StatusCreated, gin.H{
		"success": "Login success",
	})
}
