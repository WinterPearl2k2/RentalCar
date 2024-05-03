package main

import (
	AuthController "rent-car/controllers/auth"
	CarController "rent-car/controllers/car"
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

	//car
	router.GET("/getAllCar", CarController.GetAllCar)
	router.GET("/getCarById/:id", CarController.GetCarById)
	router.POST("/createCar", CarController.CreateCar)
	router.PUT("/updateCar/:id", CarController.UpdateCar)
	router.DELETE("/deleteCar/:id", CarController.DeleteCar)

	router.Run()
}
