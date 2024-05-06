package repositories

import (
	"rent-car/initializers"
	"rent-car/models"
)

func DeleteVerifyByEmail(email string) error {
	err := initializers.DB.Where("email=?", email).Delete(&models.Verification{}).Error
	return err
}
