package models

import "github.com/google/uuid"

type CarRentail struct {
	StatusCar   int       `gorm:"type:int"`
	RentalPrice float64   `gorm:"type:float8;notNull"`
	RentalDays  int       `gorm:"type:int"`
	UserId      uuid.UUID `gorm:"type:uuid;notNull"`
	CarId       uuid.UUID `gorm:"type:uuid;notNull"`
	Car         *Car      `gorm:"foreignKey:CarId"`
	User        *User     `gorm:"foreignKey:UserId"`
}
