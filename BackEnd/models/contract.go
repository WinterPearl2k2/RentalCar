package models

import (
	"time"

	"github.com/google/uuid"
)

type Contract struct {
	IdContract uuid.UUID `gorm:"primaryKey;type:uuid;default:uuid_generate_v4()"`
	IdCar      uuid.UUID `gorm:"foreignKey:IdCar;type:uuid;unique;notNull"`
	IdUser     uuid.UUID `gorm:"foreignKey:IdUser;type:uuid;unique;notNull"`
	StartTime  time.Time `gorm:"notNull;default:CURRENT_TIMESTAMP"`
	EndTime    time.Time `gorm:"notNull;default:CURRENT_TIMESTAMP"`

	Car *Car  `gorm:"foreignKey:IdBrand"`

	User *User  `gorm:"foreignKey:IdBrand"`
}
