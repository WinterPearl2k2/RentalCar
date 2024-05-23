package controllers

import (
	"errors"
	"log"
	"net/http"
	Middleware "rent-car/middleware"
	UserRepository "rent-car/repositories/users"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func GetUserProfile(context *gin.Context) {
	uuid, err := Middleware.RequireAuth(context)
	if err != nil {
		context.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
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

	isAuthen := UserRepository.GetCetizenById(uuid.String())

	log.Print(isAuthen)

	context.JSON(http.StatusOK, gin.H{
		"name":           user.NameUser,
		"email":          user.EmailUser,
		"phone":          user.PhoneUser,
		"authentication": isAuthen,
	})
}
