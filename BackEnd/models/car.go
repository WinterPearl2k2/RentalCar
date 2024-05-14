package models

import (
	"time"

	"github.com/google/uuid"
)

type Car struct {
	IdCar           uuid.UUID `gorm:"primaryKey;type:uuid;default:uuid_generate_v4()"`
	NameCar         string    `gorm:"type:varchar(255);notNull"`
	PriceCar        float64   `gorm:"type:float8;notNull"`
	FuelTypeCar     string    `gorm:"type:string;notNull"`
	BrandCar        string    `gorm:"type:string;notNull"`
	ColorCar        string    `gorm:"type:varchar(255)"`
	DescriptionCar  string    `gorm:"type:text"`
	KilometersCar   float64   `gorm:"type:float8"`
	SeatsCar        int       `gorm:"type:int"`
	TransmissionCar string    `gorm:"type:text"`
	AddressCar      string    `gorm:"type:string;notNull"`
	LatCar          float64   `gorm:"type:float8;notNull"`
	LongCar         float64   `gorm:"type:float8;notNull"`
	ImagesCar       string    `gorm:"type:text"`
	StatusCar       string    `gorm:"type:string"`
	CreatedAt       time.Time `gorm:"notNull;default:CURRENT_TIMESTAMP"`
	UpdatedAt       time.Time `gorm:"notNull;default:CURRENT_TIMESTAMP"`
	UserId          uuid.UUID `gorm:"type:uuid;notNull;foreignKey:UserId"`
	ReviewId        uuid.UUID `gorm:"type:uuid;"`

	User        *User
	CarReviews  []CarReview
	CarRentails []CarRentail
}
