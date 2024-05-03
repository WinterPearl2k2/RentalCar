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
		&models.CarBrand{},
		&models.CarReview{},
		&models.Contract{},
		&models.RentHistory{},
	)
}
