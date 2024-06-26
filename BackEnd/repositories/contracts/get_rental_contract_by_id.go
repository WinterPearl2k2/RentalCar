package contracts

import (
	"rent-car/initializers"
	"rent-car/models"
	"time"

	"github.com/google/uuid"
)

type RentalContractDto struct {
	NameOwner   string    `binding:"required"`
	NameUser    string    `binding:"required"`
	NameCar     string    `binding:"required"`
	Phone       string    `binding:"required"`
	Email       string    `binding:"required"`
	Transaction uuid.UUID `binding:"required"`
	StatusCar   int       `binding:"required"`
	RentalPrice float64   `binding:"required"`
	RentalDays  int       `binding:"required"`
	StartDate   time.Time `binding:"required"`
	EndDate     time.Time `binding:"required"`
	ImagesCar   string    `binding:"required"`
	IdCar       string    `binding:"required"`
}

func GetRentalContractById(uuid uuid.UUID, offset int, filter int) ([]RentalContractDto, error) {
	var contracts []RentalContractDto
	var carRentails []models.CarRentail
	dbQuery := initializers.DB.Where("user_id=?", uuid)
	if filter != -1 {
		dbQuery = dbQuery.Where("status_car=?", filter)
	}
	err := dbQuery.
		Offset(offset).
		Limit(10).
		Order("start_date DESC, status_car ASC").
		Find(&carRentails).Error
	for _, carRentail := range carRentails {
		car := models.Car{}
		if err := initializers.DB.
			Where("id_car = ?", carRentail.CarId).
			First(&car).Error; err != nil {
			return contracts, err
		}
		user := models.User{}
		if err := initializers.DB.
			Where("id_user = ?", carRentail.UserId).
			First(&user).Error; err != nil {
			return contracts, err
		}
		userOwner := models.User{}
		if err := initializers.DB.
			Where("id_user = ?", car.UserId).
			First(&userOwner).Error; err != nil {
			return contracts, err
		}
		contracts = append(contracts, RentalContractDto{
			NameOwner:   userOwner.NameUser,
			NameUser:    user.NameUser,
			Phone:       user.PhoneUser,
			Email:       user.EmailUser,
			Transaction: carRentail.Transaction,
			StatusCar:   carRentail.StatusCar,
			RentalPrice: carRentail.RentalPrice,
			RentalDays:  carRentail.RentalDays,
			StartDate:   carRentail.StartDate,
			EndDate:     carRentail.EndDate,
			ImagesCar:   car.ImagesCar,
			NameCar:     car.NameCar,
			IdCar:       car.IdCar.String(),
		})
	}
	return contracts, err
}
