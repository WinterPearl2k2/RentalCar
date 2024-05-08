package repositories

import (
	"rent-car/initializers"
	"rent-car/models"
)

func GetByPhone(phone string) (models.User, error) {
	var user models.User
	err := initializers.DB.Where("phone_user = ?", phone).Take(&user).Error
	return user, err
}
