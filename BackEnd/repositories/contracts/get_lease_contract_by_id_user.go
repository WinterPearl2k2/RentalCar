package contracts

import (
	"rent-car/initializers"
	"rent-car/models"

	"github.com/google/uuid"
)

func GetLeaseContractByIdUser(uuid uuid.UUID, offset int, filter int) ([]RentalContractDto, error) {
	var contracts []RentalContractDto

	var cars []models.Car
	if err := initializers.DB.
		Where("user_id = ?", uuid).
		Find(&cars).Error; err != nil {
		return contracts, err
	}

	for _, car := range cars {
		var carRentails []models.CarRentail
		dbQuery := initializers.DB.Where("car_id = ? ANd status_car = ? OR status_car = ?", car.IdCar, 1, 3)
		if filter != -1 {
			dbQuery = dbQuery.Where("status_car=?", filter)
		}
		if err := dbQuery.
			Offset(offset).
			Limit(10).
			Order("start_date DESC, status_car ASC").
			Find(&carRentails).Error; err != nil {
			return contracts, err
		}

		for _, carRentail := range carRentails {
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
	}

	return contracts, nil
}
