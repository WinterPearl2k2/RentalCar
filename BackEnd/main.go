package main

import (
	AuthController "rent-car/controllers/auth"
	"rent-car/initializers"

	"github.com/gin-gonic/gin"
)

func init() {
	initializers.LoadEnvVariables()
	initializers.ConnectToDatabase()
}

func main() {
	router := gin.Default()
	//check connect
	router.GET("/")

	//auth
	router.POST("/auth/register", AuthController.RegisterUser)

	router.Run()
}
