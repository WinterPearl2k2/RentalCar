package contract

import (
	"errors"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"gorm.io/gorm"

	Notification "rent-car/controllers/notification"
	"rent-car/initializers"
	ContractsRepository "rent-car/repositories/contracts"
	TokenDeviceRepository "rent-car/repositories/device_token"
	UserRepository "rent-car/repositories/users"
)

func CancelRentalCar(context *gin.Context) {
	idRentalCar := context.Param("id")
	id, _ := uuid.Parse(idRentalCar)

	rentalCar, err := ContractsRepository.GetRentalCarById(id)
	ownerUser, _ := UserRepository.GetUserById(rentalCar.UserId.String())
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
	rentalCar.CreatedAt = time.Now()

	errUpdate := initializers.DB.Where("transaction=?", id).Updates(rentalCar).Error
	if errUpdate != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": "Error for cancel",
		})
		return
	}

	deviceTokens, _ := TokenDeviceRepository.FindDeviceTokenByUserID(ownerUser.IdUser)
	var deviceTokensStr []string
	for _, deviceToken := range deviceTokens {
		deviceTokensStr = append(deviceTokensStr, deviceToken.DeviceToken)
	}
	if len(deviceTokens) > 0 {
		startTime := rentalCar.StartDate.Format("02/01/2006")
		endTime := rentalCar.EndDate.Format("02/01/2006")
		notification := Notification.NotificationData{
			Title: "Contract Rejected",
			Body: "The contract for renting car from " +
				startTime + ", to " +
				endTime + ", has been rejected.",
			TypeMessage: 0,
			CarId:       rentalCar.CarId.String(),
		}
		Notification.SendNotification(deviceTokensStr, ownerUser, notification)
	}

	context.JSON(http.StatusOK, gin.H{
		"message": "Ok",
	})
}
