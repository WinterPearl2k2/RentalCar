package repositories

import (
	"rent-car/initializers"
	"rent-car/models"
)

func GetDateTimeCarById(idCar string) ([]models.CarRentail, error) {
	var rentalCars []models.CarRentail
	err := initializers.DB.Where("car_id=? AND status_car=?", idCar, 1).Find(&rentalCars).Error
	return rentalCars, err
}
