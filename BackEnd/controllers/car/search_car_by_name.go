package car

import (
	"net/http"
	CarRepository "rent-car/repositories/car"
	UserRepository "rent-car/repositories/users"

	"github.com/gin-gonic/gin"
)

func SearchCarByName(context *gin.Context) {
	name := context.Query("name")
	userID := context.Query("userID")

	cars, err := CarRepository.GetCarsByName(name)
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	if len(cars) == 0 {
		context.JSON(http.StatusOK, []gin.H{})
		return
	}

	var carsData []gin.H

	for _, car := range cars {
		if car.UserId.String() == userID {
			continue
		}

		user, err := UserRepository.GetUserById(car.UserId.String())
		if err != nil {
			context.JSON(http.StatusInternalServerError, gin.H{
				"error": "Cannot find user for car",
			})
			return
		}
		carData := gin.H{
			"idCar":           car.IdCar,
			"idUser":          car.UserId,
			"userName":        user.NameUser,
			"nameCar":         car.NameCar,
			"priceCar":        car.PriceCar,
			"fuelTypeCar":     car.FuelTypeCar,
			"brandCar":        car.BrandCar,
			"colorCar":        car.ColorCar,
			"descriptionCar":  car.DescriptionCar,
			"kilometersCar":   car.KilometersCar,
			"seatsCar":        car.SeatsCar,
			"transmissionCar": car.TransmissionCar,
			"addressCar":      car.AddressCar,
			"latCar":          car.LatCar,
			"longCar":         car.LongCar,
			"imagesCar":       car.ImagesCar,
			"statusCar":       car.StatusCar,
			"createAt":        car.CreatedAt,
		}
		carsData = append(carsData, carData)
	}

	context.JSON(http.StatusOK, carsData)
}
