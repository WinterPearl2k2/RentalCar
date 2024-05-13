package contract

import (
	"errors"
	"log"
	"net/http"
	Middleware "rent-car/middleware"
	ContractRepository "rent-car/repositories/contracts"
	"strconv"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func GetLeaseContract(context *gin.Context) {
	offset := context.Param("offset")
	filter := context.Param("filter")
	uuid, err := Middleware.RequireAuth(context)
	if err != nil {
		context.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
		return
	}
	offsetInt, _ := strconv.Atoi(offset)
	filterInt, _ := strconv.Atoi(filter)
	contracts, err := ContractRepository.GetLeaseContractByIdUser(uuid, offsetInt, filterInt)
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
	log.Print(contracts)
	context.JSON(http.StatusOK, contracts)
}
