package controllers

import (
	"net/http"
	Middleware "rent-car/middleware"
	UserRepository "rent-car/repositories/users"

	"github.com/gin-gonic/gin"
)

func CheckValidResume(context *gin.Context) {
	no := context.Param("no")
	uuid, err := Middleware.RequireAuth(context)
	if err != nil {
		context.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
		return
	}

	isAuthen := UserRepository.GetCetizenByIdNo(uuid.String(), no)
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
