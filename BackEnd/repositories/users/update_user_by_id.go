package repositories

import (
	"rent-car/initializers"
	"rent-car/models"

	"github.com/google/uuid"
)

func UpdateUserById(uuidStr string, user models.User) error {
	uuid, errUUID := uuid.Parse(uuidStr)
	if errUUID != nil {
		return errUUID
	}
	err := initializers.DB.Where("id_user=?", uuid).Updates(user).Error
	return err
}
