package car

import (
	"errors"
	"net/http"

	"rent-car/initializers"
	CarRepository "rent-car/repositories/car"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func DeleteCar(context *gin.Context) {
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

	result := initializers.DB.Delete(&car)

	if result.Error != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"error": result.Error.Error(),
		})

		return
	}

	context.JSON(http.StatusOK, gin.H{"message": "Delete Success"})
}
