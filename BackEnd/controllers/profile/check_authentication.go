package controllers

import (
	"net/http"
	Middleware "rent-car/middleware"
	UserRepository "rent-car/repositories/users"

	"github.com/gin-gonic/gin"
)

func CheckAuthentication(context *gin.Context) {
	uuid, err := Middleware.RequireAuth(context)
	if err != nil {
		context.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
		return
	}

	isAuthen := UserRepository.GetCetizenById(uuid.String())
	if isAuthen {
		context.JSON(http.StatusBadRequest, gin.H{
			"message": "This ID card already exists.",
		})
		return
	}

	context.JSON(http.StatusOK, gin.H{
		"message": "ok",
	})
}
