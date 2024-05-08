package controllers

import (
	"errors"
	"net/http"
	Middleware "rent-car/middleware"
	UserRepository "rent-car/repositories/users"

	"github.com/gin-gonic/gin"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

func ChangePassword(context *gin.Context) {
	var body PasswordData
	uuid, err := Middleware.RequireAuth(context)
	if err != nil {
		context.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
		return
	}
	if err := context.ShouldBindJSON(&body); err != nil {
		context.JSON(http.StatusUnprocessableEntity, gin.H{
			"message": "Invalid information",
		})
		return
	}

	user, err := UserRepository.GetUserById(uuid.String())

	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			context.JSON(http.StatusBadRequest, gin.H{
				"message": "Incorrect User",
			})
			return
		}
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": err.Error(),
		})
		return
	}

	if errPassword := bcrypt.CompareHashAndPassword(
		[]byte(user.PasswordUser),
		[]byte(body.OldPassword),
	); errPassword != nil {
		context.JSON(http.StatusBadRequest, gin.H{
			"message": "Incorrect password",
		})
		return
	}

	hash, err := bcrypt.GenerateFromPassword([]byte(body.NewPassword), 10)

	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": err.Error(),
		})
		return
	}

	user.PasswordUser = string(hash)

	errUpdate := UserRepository.UpdateUserById(uuid.String(), user)
	if errUpdate != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": "Failed to update password",
		})
		return
	}

	context.JSON(http.StatusOK, gin.H{
		"message": "update success",
	})
}
