package contracts

import (
	"rent-car/initializers"
	"rent-car/models"
	"sort"

	"github.com/google/uuid"
)

func GetLeaseContractByIdUser(uuid uuid.UUID, offset int) ([]RentalContractDto, error) {
	var contracts []RentalContractDto

	var cars []models.Car
	if err := initializers.DB.Where("user_id = ?", uuid).Find(&cars).Error; err != nil {
		return contracts, err
	}

	for _, car := range cars {
		var carRentails []models.CarRentail
		if err := initializers.DB.Where("car_id = ? ANd status_car = ? OR status_car = ?", car.IdCar, 1, 4).Find(&carRentails).Error; err != nil {
			return contracts, err
		}

		for _, carRentail := range carRentails {
			user := models.User{}
			if err := initializers.DB.Where("id_user = ?", carRentail.UserId).First(&user).Error; err != nil {
				return contracts, err
			}
			contracts = append(contracts, RentalContractDto{
				NameOwner:   user.NameUser,
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
			})
		}
	}

	sort.SliceStable(contracts, func(i, j int) bool {
		return CompareByStartDate(&contracts[i], &contracts[j])
	})

	return contracts, nil
}

func CompareByStartDate(rental1, rental2 *RentalContractDto) bool {
	return rental1.StartDate.After(rental2.StartDate)
}
