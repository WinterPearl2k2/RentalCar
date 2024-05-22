package repositories

import (
	"rent-car/initializers"
	"rent-car/models"

	"github.com/google/uuid"
)

func GetCetizenById(uuidStr string) bool {
	var cetizen models.CetizenId
	uuid, errUUID := uuid.Parse(uuidStr)
	if errUUID != nil {
		return false
	}
	if err := initializers.DB.First(&cetizen, uuid).Error; err != nil {
		return false
	}
	return true
}
