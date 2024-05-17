package contract

import (
	"errors"
	"net/http"

	Middleware "rent-car/middleware"
	ContractRepository "rent-car/repositories/contracts"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func GetRentalCar(context *gin.Context) {
	uuid, err := Middleware.RequireAuth(context)
	if err != nil {
		context.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
		return
	}

	car_rentails, err := ContractRepository.GetRentalCarByIdUser(uuid)
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			context.JSON(http.StatusNotFound, gin.H{
				"mesaage": err.Error(),
			})
			return
		}

		context.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})

		return
	}

	context.JSON(http.StatusOK, car_rentails)
}
