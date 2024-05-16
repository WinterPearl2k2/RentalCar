package repositories

import (
	"rent-car/initializers"
	"rent-car/models"

	"github.com/google/uuid"
)

func FindDeviceTokenByUserID(userID uuid.UUID) ([]models.DeviceToken, error) {
	var deviceTokenRecord []models.DeviceToken
	if err := initializers.DB.Where("user_id = ?", userID).Find(&deviceTokenRecord).Error; err != nil {
		return nil, err
	}
	return deviceTokenRecord, nil
}
