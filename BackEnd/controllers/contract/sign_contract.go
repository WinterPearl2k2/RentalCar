package contract

import (
	"errors"
	"log"
	"net/http"
	"time"

	"rent-car/initializers"
	ContractsRepository "rent-car/repositories/contracts"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"gorm.io/gorm"
)

func SignContract(context *gin.Context) {
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
	now := time.Now()
	if now.After(rentalCar.StartDate) {
		log.Print("39")
		context.JSON(http.StatusBadRequest, gin.H{
			"message": "The contract has passed the current date and cannot be signed.",
		})
	}
	var count int64
	errorFind := initializers.DB.
		Model(rentalCar).
		Where("start_date <= ? AND end_date >= ? AND transaction != ?", rentalCar.StartDate, rentalCar.EndDate, rentalCar.Transaction).
		Count(&count).Error
	log.Print(count)
	if errorFind != nil || count > 0 {
		log.Print("50")
		context.JSON(http.StatusBadRequest, gin.H{
			"message": "The request is rejected, there is already a contract signed for these dates.",
		})
		return
	}
	rentalCar.StatusCar = 1

	errUpdate := initializers.DB.Where("transaction=?", id).Updates(&rentalCar).Error
	if errUpdate != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": "Error for Sign",
		})
		return
	}

	context.JSON(http.StatusOK, gin.H{
		"message": "Ok",
	})
}
