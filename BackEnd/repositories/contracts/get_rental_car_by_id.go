package contracts

import (
	"rent-car/initializers"
	"rent-car/models"

	"github.com/google/uuid"
)

func GetRentalCarById(uuid uuid.UUID) (models.CarRentail, error) {
	var carRentail models.CarRentail

	err := initializers.DB.First(&carRentail, "transaction = ?", uuid).Error

	return carRentail, err
}
