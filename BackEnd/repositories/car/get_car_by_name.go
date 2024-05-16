package repositories

import (
	"rent-car/initializers"
	"rent-car/models"
)

func GetCarsByName(name string) ([]models.Car, error) {
	var cars []models.Car

	err := initializers.DB.Where("name_car LIKE ?", "%"+name+"%").Find(&cars).Error
	if err != nil {
		return nil, err
	}

	return cars, nil
}
