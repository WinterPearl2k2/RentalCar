package controllers

import (
	"log"
	"net/http"
	"rent-car/initializers"
	Middleware "rent-car/middleware"
	TokenDeviceRepository "rent-car/repositories/device_token"
	UserRepository "rent-car/repositories/users"

	"github.com/gin-gonic/gin"
)

func Logout(context *gin.Context) {
	deviceToken := context.Param("deviceToken")
	uuid, err := Middleware.RequireAuth(context)
	if err != nil {
		context.JSON(http.StatusUnauthorized, gin.H{"message": "Unauthorized"})
		return
	}

	user, _ := UserRepository.GetUserById(uuid.String())
	token, _ := TokenDeviceRepository.FindDeviceTokenByUserIDAndToken(uuid, deviceToken)
	initializers.DB.Where("user_id=? AND device_token=?", uuid, deviceToken).Delete(token)

	log.Print(user)
	if err := initializers.DB.Save(&user).Error; err != nil {
		log.Println("Error updating user:", err)
		context.JSON(http.StatusInternalServerError, gin.H{"message": "Internal Server Error"})
		return
	}

	log.Print(user)

	context.JSON(http.StatusOK, gin.H{
		"message": "OK",
	})
}
