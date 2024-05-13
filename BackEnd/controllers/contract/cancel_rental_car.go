package contract

import (
	"errors"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"gorm.io/gorm"

	"rent-car/initializers"
	ContractsRepository "rent-car/repositories/contracts"
)

func CancelRentalCar(context *gin.Context) {
	idRentalCar := context.Param("id")
	id, _ := uuid.Parse(idRentalCar)

	rentalCar, err := ContractsRepository.GetRentalCarById(id)
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			context.JSON(http.StatusNotFound, gin.H{
				"message": "Contract not found",
			})

			return
		}

		context.JSON(http.StatusInternalServerError, gin.H{
			"message": err.Error(),
		})

		return
	}
	rentalCar.StatusCar = 2

	errUpdate := initializers.DB.Where("transaction=?", id).Updates(rentalCar).Error
	if errUpdate != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": "Error for cancel",
		})
		return
	}

	context.JSON(http.StatusOK, gin.H{
		"message": "Ok",
	})
}
