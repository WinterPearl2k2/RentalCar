package contracts

import (
	"log"
	"rent-car/initializers"
	"rent-car/models"

	"github.com/google/uuid"
)

func GetQuantityNewContractById(uuid uuid.UUID) (int, error) {
	var count = 0
	var cars []models.Car
	if err := initializers.DB.Where("user_id = ?", uuid).Find(&cars).Error; err != nil {
		return count, err
	}

	var carRentails []models.CarRentail
	var user models.User
	initializers.DB.First(&user, uuid)
	if err := initializers.DB.Where("user_id = ?", uuid).Find(&carRentails).Error; err != nil {
		return count, err
	}

	for _, carRentail := range carRentails {
		if carRentail.IsReaded && (carRentail.StatusCar == 1 || carRentail.StatusCar == 3) {
			count++
		}
	}

	for _, car := range cars {
		var carRentails []models.CarRentail
		if err := initializers.DB.Where("car_id = ? ANd status_car = ?", car.IdCar, 0).Find(&carRentails).Error; err != nil {
			return count, err
		}

		for _, carRentail := range carRentails {
			if carRentail.IsReaded {
				count++
			}
		}
	}

	log.Print(count)

	return count, nil
}
