package repositories

import (
	"rent-car/initializers"
	"rent-car/models"

	"github.com/google/uuid"
)

func FindDeviceTokenByUserIDAndToken(userID uuid.UUID, deviceToken string) (*models.DeviceToken, error) {
	var deviceTokenRecord models.DeviceToken
	if err := initializers.DB.Where("user_id = ? AND device_token = ?", userID, deviceToken).First(&deviceTokenRecord).Error; err != nil {
		return nil, err
	}
	return &deviceTokenRecord, nil
}
