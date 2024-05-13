package contract

import (
	"time"

	"github.com/google/uuid"
)

type RentalContractDto struct {
	Name        string    `binding:"required"`
	Phone       string    `binding:"required"`
	Email       string    `binding:"required"`
	Transaction uuid.UUID `binding:"required"`
	StatusCar   int       `binding:"required"`
	RentalPrice float64   `binding:"required"`
	RentalDays  int       `binding:"required"`
	StartDate   time.Time `binding:"required"`
	EndDate     time.Time `binding:"required"`
	ImagesCar   string    `binding:"required"`
}
