package controllers

import (
	"errors"
	"net/http"
	Middleware "rent-car/middleware"
	UserRepository "rent-car/repositories/users"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func ChangeProfile(context *gin.Context) {
	var body UserProfile
	uuid, err := Middleware.RequireAuth(context)
	if err != nil {
		context.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
		return
	}
	if err := context.ShouldBindJSON(&body); err != nil {
		context.JSON(http.StatusBadRequest, gin.H{
			"message": err.Error(),
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

	if body.Email != user.EmailUser {
		_, errInvalidEmail := UserRepository.GetByEmail(body.Email)
		if errInvalidEmail == nil {
			context.JSON(http.StatusBadRequest, gin.H{
				"message": "User email already exists.",
			})
			return
		}
	}

	if body.Phone != user.PhoneUser {
		_, errInvalidPhone := UserRepository.GetByPhone(body.Phone)
		if errInvalidPhone == nil {
			context.JSON(http.StatusBadRequest, gin.H{
				"message": "User phone number already exists.",
			})
			return
		}
	}

	user.EmailUser = body.Email
	user.PhoneUser = body.Phone
	user.NameUser = body.Name
	errUpdate := UserRepository.UpdateUserById(uuid.String(), user)
	if errUpdate != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": "Failed to update profile",
		})
		return
	}

	context.JSON(http.StatusOK, gin.H{
		"name":  user.NameUser,
		"phone": user.PhoneUser,
		"email": user.EmailUser,
	})
}
