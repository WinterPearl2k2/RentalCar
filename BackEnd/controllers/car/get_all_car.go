package car

import (
	"net/http"

	CarRepository "rent-car/repositories/car"
	UserRepository "rent-car/repositories/users"

	"github.com/gin-gonic/gin"
)

func GetAllCar(context *gin.Context) {
	cars, err := CarRepository.GetAll()
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	var carsData []gin.H

	if len(cars) == 0 {
		context.JSON(http.StatusOK, []gin.H{})
		return
	}

	for _, car := range cars {
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
			"idReview":        car.ReviewId,
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
