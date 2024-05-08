package repositories

import (
	"rent-car/initializers"
	"rent-car/models"

	"github.com/google/uuid"
)

func GetUserByID(userID  uuid.UUID) (models.User, error) {
	var user models.User
	err := initializers.DB.First(&user, userID).Error
	return user, err
}
