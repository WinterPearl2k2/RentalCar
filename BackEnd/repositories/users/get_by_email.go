package repositories

import (
	"rent-car/initializers"
	"rent-car/models"
)

func GetByEmail(email string) (models.User, error) {
	var user models.User
	err := initializers.DB.Where("email_user = ?", email).Take(&user).Error
	return user, err
}
