package repositories

import (
	"rent-car/initializers"
	"rent-car/models"
)

func UpdateById(user models.User) error {
	err := initializers.DB.Where("id_user=?", user.IdUser).Updates(user).Error
	return err
}
