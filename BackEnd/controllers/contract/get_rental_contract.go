package contract

import (
	"errors"
	"net/http"
	Middleware "rent-car/middleware"
	ContractRepository "rent-car/repositories/contracts"
	"strconv"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func GetRentalContract(context *gin.Context) {
	offset := context.Param("offset")
	uuid, err := Middleware.RequireAuth(context)
	if err != nil {
		context.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
		return
	}
	offsetInt, _ := strconv.Atoi(offset)
	contracts, err := ContractRepository.GetRentalContractById(uuid, offsetInt)
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			context.JSON(http.StatusBadRequest, gin.H{
				"message": "Unauthorize",
			})
			return
		}
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": err.Error(),
		})
		return
	}

	context.JSON(http.StatusOK, contracts)
}
