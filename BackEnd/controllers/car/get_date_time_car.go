package car

import (
	"errors"
	"net/http"
	CarRepository "rent-car/repositories/car"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func GetDateTimeCar(context *gin.Context) {
	idCar := context.Param("id")

	rentalCars, err := CarRepository.GetDateTimeCarById(idCar)

	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			context.JSON(http.StatusBadRequest, gin.H{
				"message": err.Error(),
			})
			return
		}
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": err.Error(),
		})
		return
	}

	var dates []DateTimeCar
	for _, rentalCar := range rentalCars {
		dates = append(dates, DateTimeCar{
			StartDate: rentalCar.StartDate,
			EndDate:   rentalCar.EndDate,
		})
	}
	context.JSON(http.StatusOK, dates)
}
