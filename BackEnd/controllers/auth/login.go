package controllers

import (
	"errors"
	"log"
	"net/http"
	"rent-car/initializers"
	"rent-car/models"
	UserRepository "rent-car/repositories/users"
	"rent-car/utils"

	"github.com/gin-gonic/gin"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

func Login(context *gin.Context) {
	var body LoginBody
	if err := context.ShouldBindJSON(&body); err != nil {
		context.JSON(http.StatusUnprocessableEntity, gin.H{
			"message": "Invalid information",
		})
		return
	}

	user, err := UserRepository.GetByEmail(body.Email)

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
		log.Print("Eror line 36")
		return
	}

	if err := bcrypt.CompareHashAndPassword(
		[]byte(user.PasswordUser),
		[]byte(body.Password),
	); err != nil {
		context.JSON(http.StatusBadRequest, gin.H{
			"message": "Incorrect password",
		})
		log.Print("Eror line 43")
		return
	}

	accessToken, errAccess := utils.GenerateAccessToken(user.IdUser)
	refreshToken, errRefresh := utils.GenerateRefreshToken(user.IdUser)

	if errAccess != nil || errRefresh != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": "Status Internal ServerError",
		})
		log.Print(errAccess.Error() + errRefresh.Error())
		return
	}

	var deviceToken = models.DeviceToken{
		DeviceToken: body.DeviceToken,
		UserId:      user.IdUser,
		User:        &user,
	}
	initializers.DB.Create(&deviceToken)

	context.JSON(http.StatusOK, gin.H{
		"accessToken":  accessToken,
		"refreshToken": refreshToken,
		"userId":       user.IdUser,
	})
}
