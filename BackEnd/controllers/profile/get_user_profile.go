package controllers

import (
	"errors"
	"net/http"
	UserRepository "rent-car/repositories/users"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func GetUserProfile(context *gin.Context) {
	uuid := context.Param("uuid")

	user, err := UserRepository.GetUserById(uuid)
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

	context.JSON(http.StatusOK, gin.H{
		"name":  user.NameUser,
		"email": user.EmailUser,
		"phone": user.PhoneUser,
	})
}
