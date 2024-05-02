package models

import (
	"time"

	"github.com/google/uuid"
)

type Contract struct {
	IdContract uuid.UUID `gorm:"primaryKey;type:uuid;default:uuid_generate_v4()"`
	StartTime  time.Time `gorm:"notNull;default:CURRENT_TIMESTAMP"`
	EndTime    time.Time `gorm:"notNull;default:CURRENT_TIMESTAMP"`

	Car  *Car  `gorm:"foreignKey:IdCar"`
	User *User `gorm:"foreignKey:IdUser"`
}
