package car

import (
	"errors"
	"net/http"
	"strings"

	"rent-car/initializers"
	"rent-car/models"
	CarRepository "rent-car/repositories/car"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func UpdateCar(context *gin.Context) {
	var body CarBody
	if err := context.ShouldBindJSON(&body); err != nil {
		context.JSON(http.StatusUnprocessableEntity, gin.H{
			"error": err.Error(),
		})

		return
	}

	id := context.Param("id")

	car, err := CarRepository.GetById(id)

	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			context.JSON(http.StatusNotFound, gin.H{
				"error": "Car not found",
			})

			return
		}

		context.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})

		return
	}

	result := initializers.DB.Model(&car).Updates(models.Car{
		NameCar:         body.NameCar,
		PriceCar:        body.PriceCar,
		FuelTypeCar:     body.FuelTypeCar,
		BrandCar:        body.BrandCar,
		ColorCar:        body.ColorCar,
		DescriptionCar:  body.DescriptionCar,
		KilometersCar:   body.KilometersCar,
		SeatsCar:        body.SeatsCar,
		TransmissionCar: body.TransmissionCar,
		AddressOwner:    body.AddressOwner,
		ImagesCar:       body.ImagesCar,
		StatusCar:       body.StatusCar,
	})

	if result.Error != nil {
		errorMessage := result.Error.Error()
		if strings.Contains(errorMessage, "unique constraint") {
			context.JSON(http.StatusConflict, gin.H{
				"error": "Car model already exists for this brand",
			})

			return
		}

		context.JSON(http.StatusInternalServerError, gin.H{
			"error": errorMessage,
		})

		return
	}

	context.JSON(http.StatusCreated, gin.H{
		"body": car,
	})
}
