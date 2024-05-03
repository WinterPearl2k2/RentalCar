package models

import (
	"github.com/google/uuid"
)

type RentHistory struct {
	IdCar         uuid.UUID `gorm:"foreignKey:IdCar;type:uuid"`
	IdUser        uuid.UUID `gorm:"foreignKey:IdUser;type:uuid"`
	StatusHistory int       `gorm:"type:uuid"`
}
