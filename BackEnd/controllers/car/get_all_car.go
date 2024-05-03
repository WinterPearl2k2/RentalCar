package car

import (
	"net/http"

	"github.com/gin-gonic/gin"
	CarRepository "rent-car/repositories/car"

)

func GetAllCar(context *gin.Context) {
	cars, err := CarRepository.GetAll()

	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})

		return
	}

	context.JSON(http.StatusOK, gin.H{
		"body": cars,
	})
}

