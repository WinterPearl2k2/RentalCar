package repositories

import (
	"rent-car/initializers"
	"rent-car/models"
)

func GetById(id string) (models.Car, error) {
	var car models.Car
	err := initializers.DB.Where("id_car = ?", id).Take(&car).Error

	return car, err
}
