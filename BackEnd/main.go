package main

import (
	"log"
	AuthController "rent-car/controllers/auth"
	CarController "rent-car/controllers/car"
	ContractController "rent-car/controllers/contract"
	NotificationController "rent-car/controllers/notification"
	UserController "rent-car/controllers/profile"
	"rent-car/initializers"
	"rent-car/models"
	"time"

	"github.com/gin-gonic/gin"
)

func init() {
	initializers.LoadEnvVariables()
	initializers.ConnectToDatabase()
}

func main() {
	go scheduleUpdateStatusCar()
	router := gin.Default()
	//check connect
	router.GET("/")

	//auth
	router.POST("/auth/register", AuthController.RegisterUser)
	router.PUT("/auth/logout/:deviceToken", AuthController.Logout)
	router.POST("/auth/login", AuthController.Login)
	router.POST("/auth/refreshToken", AuthController.NewToken)
	router.POST("/auth/forgotPassword/:email", AuthController.ForgotPassword)
	router.POST("/auth/verifyCode", AuthController.VerifyCode)
	router.POST("/auth/resetPassword", AuthController.ResetPasswordUser)
	router.PUT("/auth/changePassword", AuthController.ChangePassword)
	//profile
	router.GET("/profile/getUserProfile", UserController.GetUserProfile)
	router.PUT("/profile/updateUserProfile", UserController.ChangeProfile)

	//Contract
	router.GET("/getRentalCar", ContractController.GetRentalCar)
	router.DELETE("/cancelRentalCar/:id", ContractController.CancelRentalCar)
	router.GET("/getRentalContract/:offset/:filter", ContractController.GetRentalContract)
	router.PUT("/signContract/:id", ContractController.SignContract)
	router.GET("/getLeaseContract/:offset/:filter", ContractController.GetLeaseContract)

	//Notification
	router.GET("/getNotification", NotificationController.GetNewNotification)

	//car
	router.GET("/getAllCar", CarController.GetAllCar)
	router.POST("/rentalCar", CarController.RentalCar)
	router.GET("/getCarById/:id", CarController.GetCarById)
	router.POST("/createCar", CarController.CreateCar)
	router.PUT("/updateCar/:id", CarController.UpdateCar)
	router.DELETE("/deleteCar/:id", CarController.DeleteCar)
	router.GET("/getDateTimeCar/:id", CarController.GetDateTimeCar)
	router.GET("/getAllCarByIdUser/:idUser", CarController.GetAllCarByIdUser)
	router.GET("/getTopCar", CarController.GetTopCar)
	router.GET("/getSearchCar", CarController.SearchCarByName)
	router.POST("/createCarReview", CarController.CreateCarReview)
	router.GET("/getCarReview/:idCar", CarController.GetCarReview)

	router.Run()
}

// Tự động cập nhật khi qua ngày mới
func scheduleUpdateStatusCar() {
	for {
		now := time.Now()
		next := now.AddDate(0, 0, 1)

		duration := time.Until(time.Date(next.Year(), next.Month(), next.Day(), 0, 0, 0, 0, next.Location()))

		time.Sleep(duration)

		if err := initializers.DB.
			Model(&models.CarRentail{}).
			Where("end_date < ? AND status_car=?", now, 1).
			Update("status_car", 4).
			Error; err != nil {
			log.Fatalf("Error updating statusCar: %v", err)
		}
		if err := initializers.DB.
			Model(&models.CarRentail{}).
			Where("end_date < ? AND status_car!=?", now, 0).
			Update("status_car", 3).
			Error; err != nil {
			log.Fatalf("Error updating statusCar: %v", err)
		}
	}
}
