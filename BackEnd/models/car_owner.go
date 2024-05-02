package models

import (
	"github.com/google/uuid"
)

type CarOwner struct {
	IdOwner      uuid.UUID `gorm:"primaryKey;type:uuid;default:uuid_generate_v4()"`
	IdCar        uuid.UUID `gorm:"foreignKey:IdCar;type:uuid;unique;notNull"`
	IdUser       uuid.UUID `gorm:"foreignKey:IdUser;type:uuid;unique;notNull"`
	AddressOwner string    `gorm:"type:string;notNull"`

	Car *Car  `gorm:"foreignKey:IdCar"`
	
	User *User  `gorm:"foreignKey:IdUser"`
}
