package models

import (
	"time"

	"github.com/google/uuid"
)

type Contract struct {
	StartTime time.Time `gorm:"notNull;default:CURRENT_TIMESTAMP"`
	EndTime   time.Time `gorm:"notNull;default:CURRENT_TIMESTAMP"`
	UserId    uuid.UUID `gorm:"type:uuid;notNull"`
	CarId     uuid.UUID `gorm:"type:uuid;notNull"`

	Car  *Car  `gorm:"foreignKey:CarId"`
	User *User `gorm:"foreignKey:UserId"`
}
