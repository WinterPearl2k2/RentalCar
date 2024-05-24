package main

import (
	"rent-car/initializers"
	"rent-car/models"
)

func init() {
	initializers.LoadEnvVariables()
	initializers.ConnectToDatabase()
}

func main() {
	initializers.DB.AutoMigrate(
		&models.CetizenId{},
		&models.User{},
		&models.Car{},
		&models.CarReview{},
		&models.Verification{},
		&models.CarRentail{},
		&models.DeviceToken{},
	)
}
