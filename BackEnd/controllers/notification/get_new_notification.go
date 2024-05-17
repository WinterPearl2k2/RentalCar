package notification

import (
	"errors"
	"net/http"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"

	Middleware "rent-car/middleware"
	ContractRepository "rent-car/repositories/contracts"
)

func GetNewNotification(context *gin.Context) {
	uuid, err := Middleware.RequireAuth(context)
	if err != nil {
		context.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
		return
	}
	count, err := ContractRepository.GetQuantityNewContractById(uuid)
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

	context.JSON(http.StatusCreated, gin.H{
		"count": count,
	})
}
