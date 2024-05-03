package repositories

import (
	"rent-car/initializers"
	"rent-car/models"
)

func GetAll() ([]models.Car, error) {
	var cars []models.Car
	err := initializers.
		DB.
		Order("created_at asc").
		Find(&cars).
		Error

	return cars, err
}
