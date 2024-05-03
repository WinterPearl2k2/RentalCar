package car

import (
	"errors"
	"net/http"

	CarRepository "rent-car/repositories/car"

	"github.com/gin-gonic/gin"

	"gorm.io/gorm"
)

func GetCarById(context *gin.Context) {
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

	context.JSON(http.StatusOK, gin.H{
		"body": car,
	})
}
