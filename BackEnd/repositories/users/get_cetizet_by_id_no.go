package repositories

import (
	"rent-car/initializers"
	"rent-car/models"
)

func GetCetizenByIdNo(uuidStr string, no string) bool {
	var cetizen models.CetizenId
	if err := initializers.DB.First(&cetizen, "no = ?", no).Error; err != nil {
		return false
	}
	return true
}
