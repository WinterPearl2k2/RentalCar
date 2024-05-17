package car

import (
	"errors"
	"net/http"
	CarRepository "rent-car/repositories/car"
	"sort"

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

	sort.Slice(dates, func(i, j int) bool {
		return dates[i].StartDate.Before(dates[j].StartDate)
	})
	context.JSON(http.StatusOK, dates)
}
