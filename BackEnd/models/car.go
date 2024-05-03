package models

import (
	"time"

	"github.com/google/uuid"
)

type FuelType string

const (
	FuelTypeGasoline FuelType = "Gasoline"
	FuelTypeDiesel   FuelType = "Diesel"
	FuelTypeElectric FuelType = "Electric"
	FuelTypeHybrid   FuelType = "Hybrid"
)

type TransmissionType string

const (
	TransmissionAutomatic TransmissionType = "Automatic"
	TransmissionManual    TransmissionType = "Manual"
)

type CarStatus string

const (
	CarStatusAvailable CarStatus = "Available"
	CarStatusSold      CarStatus = "Sold"
)

type Car struct {
	IdCar           uuid.UUID        `gorm:"primaryKey;type:uuid;default:uuid_generate_v4()"`
	NameCar         string           `gorm:"type:varchar(255);notNull"`
	PriceCar        float64          `gorm:"type:float8;notNull"`
	FuelTypeCar     FuelType         `gorm:"type:text;notNull"`
	ColorCar        string           `gorm:"type:varchar(255)"`
	DescriptionCar  string           `gorm:"type:text"`
	KilometersCar   int              `gorm:"type:int"`
	SeatsCar        int              `gorm:"type:int"`
	TransmissionCar TransmissionType `gorm:"type:text"`
	AddressOwner    string           `gorm:"type:string;notNull"`
	ImagesCar       string           `gorm:"type:text"`
	StatusCar       CarStatus        `gorm:"type:text"`
	CreatedAt       time.Time        `gorm:"notNull;default:CURRENT_TIMESTAMP"`
	UpdatedAt       time.Time        `gorm:"notNull;default:CURRENT_TIMESTAMP"`
	UserId          uuid.UUID        `gorm:"type:uuid;notNull"`
	BrandId         uuid.UUID        `gorm:"type:uuid;notNull"`
	ReivewId        uuid.UUID        `gorm:"type:uuid;notNull"`

	User       *User
	CarReviews []CarReview
	CarBrand   *CarBrand `gorm:"foreignKey:BrandId"`
}
