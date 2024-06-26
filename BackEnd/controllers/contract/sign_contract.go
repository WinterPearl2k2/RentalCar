package contract

import (
	"errors"
	"log"
	"net/http"
	"time"

	Notification "rent-car/controllers/notification"
	"rent-car/initializers"
	ContractsRepository "rent-car/repositories/contracts"
	TokenDeviceRepository "rent-car/repositories/device_token"
	UserRepository "rent-car/repositories/users"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"gorm.io/gorm"
)

func SignContract(context *gin.Context) {
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

	now := time.Now().AddDate(0, 0, -1)
	log.Print(now)
	if now.After(rentalCar.StartDate) {
		log.Print("39")
		context.JSON(http.StatusBadRequest, gin.H{
			"message": "The contract has passed the current date and cannot be signed.",
		})
		return
	}
	var count int64
	errorFind := initializers.DB.
		Model(rentalCar).
		Where("(start_date <= ? AND end_date >= ?) AND (start_date <= ? AND end_date >= ?) AND transaction != ? AND status_car = ? AND user_id = ?",
			rentalCar.StartDate,
			rentalCar.StartDate,
			rentalCar.EndDate,
			rentalCar.EndDate,
			rentalCar.Transaction, 1,
			rentalCar.UserId).
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
	rentalCar.CreatedAt = time.Now()
	rentalCar.IsReaded = true

	errUpdate := initializers.DB.Where("transaction=?", id).Updates(&rentalCar).Error
	if errUpdate != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": "Error for Sign",
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
				endTime + ", has been signed.",
			TypeMessage: 0,
			CarId:       rentalCar.CarId.String(),
		}
		Notification.SendNotification(deviceTokensStr, ownerUser, notification)
	}

	context.JSON(http.StatusOK, gin.H{
		"message": "Ok",
	})
}
