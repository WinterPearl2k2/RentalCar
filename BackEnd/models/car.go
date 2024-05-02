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
	IdBrand         uuid.UUID        `gorm:"foreignKey:IdBrand;type:uuid;unique;notNull"`
	IdOwner         uuid.UUID        `gorm:"foreignKey:IdOwner;type:uuid;unique;notNull"`
	IdReview        uuid.UUID        `gorm:"foreignKey:IdReview;type:uuid;unique;notNull"`
	NameCar         string           `gorm:"type:nvarchar(255);notNull"`
	PriceCar        float64          `gorm:"type:float8;notNull"`
	FuelTypeCar     FuelType         `gorm:"type:text;notNull"`
	ColorCar        string           `gorm:"type:nvarchar(255)"`
	DescriptionCar  string           `gorm:"type:text"`
	KilometersCar   int              `gorm:"type:int"`
	SeatsCar        int              `gorm:"type:int"`
	TransmissionCar TransmissionType `gorm:"type:text"`
	ImagesCar       string           `gorm:"type:text"`
	StatusCar       CarStatus        `gorm:"type:text"`
	CreatedAt       time.Time        `gorm:"notNull;default:CURRENT_TIMESTAMP"`
	UpdatedAt       time.Time        `gorm:"notNull;default:CURRENT_TIMESTAMP"`

	CarBrand *CarBrand `gorm:"foreignKey:IdBrand"`
	CarReview *CarReview `gorm:"foreignKey:IdOwner"`
	CarOwner  *CarOwner `gorm:"foreignKey:IdReview"`
}
