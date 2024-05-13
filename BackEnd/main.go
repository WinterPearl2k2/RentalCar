package main

import (
	AuthController "rent-car/controllers/auth"
	CarController "rent-car/controllers/car"
	ContractController "rent-car/controllers/contract"
	UserController "rent-car/controllers/profile"
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
	router.POST("/auth/login", AuthController.Login)
	router.POST("/auth/refreshToken", AuthController.NewToken)
	router.POST("/auth/forgotPassword/:email", AuthController.ForgotPassword)
	router.POST("/auth/verifyCode", AuthController.VerifyCode)
	router.POST("/auth/resetPassword", AuthController.ResetPasswordUser)
	router.PUT("/auth/changePassword", AuthController.ChangePassword)
	//profile
	router.GET("/profile/getUserProfile", UserController.GetUserProfile)
	router.PUT("/profile/updateUserProfile", UserController.ChangeProfile)

	//Test
	router.GET("/getRentalCar", ContractController.GetRentalCar)

	//car
	router.GET("/getAllCar", CarController.GetAllCar)
	router.POST("/rentalCar", CarController.RentalCar)
	router.GET("/getCarById/:id", CarController.GetCarById)
	router.POST("/createCar", CarController.CreateCar)
	router.PUT("/updateCar/:id", CarController.UpdateCar)
	router.DELETE("/deleteCar/:id", CarController.DeleteCar)

	router.GET("/getAllCarByIdUser/:idUser", CarController.GetAllCarByIdUser)

	router.GET("/getTopCar", CarController.GetTopCar)

	router.Run()
}
