package repositories

import (
	"rent-car/initializers"
	"rent-car/models"
)

func GetCarsByUserID(userID string) ([]models.Car, error) {
	var cars []models.Car
	err := initializers.DB.Where("user_id = ?", userID).Find(&cars).Error

	return cars, err
}
