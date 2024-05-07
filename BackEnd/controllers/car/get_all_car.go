package car

import (
	"net/http"

	CarRepository "rent-car/repositories/car"

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

	for _, car := range cars {
		carData := gin.H{
			"idCar":           car.IdCar,
			"idUser":          car.UserId,
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
			"addressCar":      car.AddressOwner,
			"imagesCar":       car.ImagesCar,
			"statusCar":       car.StatusCar,
			"createAt":        car.CreatedAt,
		}
		carsData = append(carsData, carData)
	}

	context.JSON(http.StatusOK, carsData)
}
