package repositories

import (
	"rent-car/initializers"
	"rent-car/models"
)

func GetVerifyByEmail(email string) (models.Verification, error) {
	var verification models.Verification
	err := initializers.DB.Where("email=?", email).Take(&verification).Error
	return verification, err
}
