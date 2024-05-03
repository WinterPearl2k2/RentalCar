package models

import (
	"time"

	"github.com/google/uuid"
)

type Contract struct {
	IdUser    uuid.UUID `gorm:"foreignKey:IdUser;type:uuid"`
	IdCar     uuid.UUID `gorm:"foreignKey:IdCar;type:uuid"`
	StartTime time.Time `gorm:"notNull;default:CURRENT_TIMESTAMP"`
	EndTime   time.Time `gorm:"notNull;default:CURRENT_TIMESTAMP"`
}
