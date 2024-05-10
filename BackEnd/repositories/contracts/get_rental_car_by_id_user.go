package contracts

import (
	"rent-car/initializers"
	"rent-car/models"
	"sort"
	"time"

	"github.com/google/uuid"
)

type UserRentalDto struct {
	RentalPrice float64   `gorm:"type:float8;notNull"`
	RentalDays  int       `gorm:"type:int"`
	CreatedAt   time.Time `gorm:"notNull"`
	NameUser    string    `gorm:"type:varchar(255);notNull"`
	PhoneUser   string    `gorm:"type:varchar(255);notNull"`
	StartDate   time.Time `gorm:"type:varchar(255);notNull"`
	EndDate     time.Time `gorm:"type:varchar(255);notNull"`
}

func GetRentalCarByIdUser(uuid uuid.UUID) ([]UserRentalDto, error) {
	var userDtos []UserRentalDto

	var cars []models.Car
	if err := initializers.DB.Where("user_id = ?", uuid).Find(&cars).Error; err != nil {
		return userDtos, err
	}

	for _, car := range cars {
		var carRentails []models.CarRentail
		if err := initializers.DB.Where("car_id = ?", car.IdCar).Find(&carRentails).Error; err != nil {
			return userDtos, err
		}

		for _, carRentail := range carRentails {
			user := models.User{}
			if err := initializers.DB.Where("id_user = ?", carRentail.UserId).First(&user).Error; err != nil {
				return userDtos, err
			}
			userDtos = append(userDtos, UserRentalDto{
				RentalPrice: carRentail.RentalPrice,
				RentalDays:  carRentail.RentalDays,
				CreatedAt:   carRentail.CreatedAt,
				NameUser:    user.NameUser,
				PhoneUser:   user.PhoneUser,
				StartDate:   carRentail.StartDate,
				EndDate:     carRentail.EndDate,
			})
		}
	}

	sort.SliceStable(userDtos, func(i, j int) bool {
		return CompareByCreatedAt(&userDtos[i], &userDtos[j])
	})

	return userDtos, nil
}

func CompareByCreatedAt(rental1, rental2 *UserRentalDto) bool {
	return rental1.CreatedAt.After(rental2.CreatedAt)
}
