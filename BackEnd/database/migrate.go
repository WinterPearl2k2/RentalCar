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
		&models.User{},
		&models.Car{},
		&models.Contract{},
		&models.RentHistory{},
		&models.CarBrand{},
		&models.CarReview{},
	)
}
