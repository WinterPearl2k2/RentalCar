package controllers

import (
	"errors"
	"net/http"
	UserRepository "rent-car/repositories/users"

	"github.com/gin-gonic/gin"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

func ResetPasswordUser(context *gin.Context) {
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
		return
	}

	hash, err := bcrypt.GenerateFromPassword([]byte(body.Password), 10)
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": err.Error(),
		})
		return
	}
	user.PasswordUser = string(hash)

	errUpdate := UserRepository.UpdateById(user)

	if errUpdate != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": "Failed to reset password",
		})
		return
	}

	context.JSON(http.StatusOK, gin.H{
		"message": "Password reset successfully",
	})
}
