package utils

import (
	"rent-car/models"

	"github.com/gin-gonic/gin"
)

func GetUserFromContext(context *gin.Context) models.User {
	maybeUser, _ := context.Get("user")
	return maybeUser.(models.User)
}
