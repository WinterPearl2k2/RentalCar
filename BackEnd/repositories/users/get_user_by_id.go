package repositories

import (
	"rent-car/initializers"
	"rent-car/models"

	"github.com/google/uuid"
)

func GetUserById(uuidStr string) (models.User, error) {
	var user models.User
	uuid, errUUID := uuid.Parse(uuidStr)
	if errUUID != nil {
		return user, errUUID
	}
	err := initializers.DB.First(&user, uuid).Error
	return user, err
}
