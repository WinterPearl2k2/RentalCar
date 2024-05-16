package car

import (
	"errors"
	"log"
	"net/http"
	"strings"
	"time"

	Notification "rent-car/controllers/notification"
	"rent-car/initializers"
	Middleware "rent-car/middleware"
	"rent-car/models"
	CarRepository "rent-car/repositories/car"
	TokenDeviceRepository "rent-car/repositories/device_token"
	UserRepository "rent-car/repositories/users"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func RentalCar(context *gin.Context) {
	var body CarRent
	log.Print(body)
	if err := context.ShouldBindJSON(&body); err != nil {
		context.JSON(http.StatusUnprocessableEntity, gin.H{
			"message": "Invalid information",
		})
		return
	}
	uuid, err := Middleware.RequireAuth(context)
	if err != nil {
		context.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
		return
	}
	// uuid := "417511f4-6546-40cf-8528-35fda4f43591"

	user, err := UserRepository.GetUserById(uuid.String())
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			context.JSON(http.StatusBadRequest, gin.H{
				"message": "Incorrect User",
			})
			return
		}
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": err.Error(),
		})
		return
	}

	car, err := CarRepository.GetById(body.IdCar)

	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			context.JSON(http.StatusNotFound, gin.H{
				"message": "Car not found",
			})

			return
		}

		context.JSON(http.StatusInternalServerError, gin.H{
			"message": err.Error(),
		})

		return
	}

	startDate, _ := parseDateString(body.StartDate)
	endDate, _ := parseDateString(body.EndDate)

	rentalCar := models.CarRentail{
		StatusCar:   0,
		User:        &user,
		Car:         &car,
		RentalPrice: body.RentalPrice,
		RentalDays:  body.RentalDays,
		StartDate:   startDate,
		EndDate:     endDate,
	}

	result := initializers.DB.Create(&rentalCar)
	if result.Error != nil {
		errorMessage := result.Error.Error()
		if strings.Contains(errorMessage, "unique constraint") {
			context.JSON(http.StatusConflict, gin.H{
				"message": errorMessage,
			})
			return
		}

		context.JSON(http.StatusInternalServerError, gin.H{
			"message": errorMessage,
		})
		return
	}
	user.CarRentails = append(user.CarRentails, rentalCar)
	resultUser := initializers.DB.Save(&user)
	if result.Error != nil {
		errorMessage := resultUser.Error.Error()
		if strings.Contains(errorMessage, "unique constraint") {
			context.JSON(http.StatusConflict, gin.H{
				"message": errorMessage,
			})
			return
		}

		context.JSON(http.StatusInternalServerError, gin.H{
			"message": errorMessage,
		})
		return
	}
	notification := models.NotificationUser{
		CarRentail:  &rentalCar,
		UserId:      user.IdUser,
		Transaction: rentalCar.Transaction,
		User:        &user,
	}
	initializers.DB.Create(&notification)

	ownerUser, _ := UserRepository.GetUserById(car.UserId.String())
	deviceTokens, _ := TokenDeviceRepository.FindDeviceTokenByUserID(ownerUser.IdUser)
	var deviceTokensStr []string
	for _, deviceToken := range deviceTokens {
		deviceTokensStr = append(deviceTokensStr, deviceToken.DeviceToken)
	}
	if len(deviceTokens) > 0 {
		startTime := startDate.Format("02/01/2006")
		endTime := endDate.Format("02/01/2006")
		notification := Notification.NotificationData{
			Title: "Rental request from a customer",
			Body: "Customer " +
				user.NameUser +
				" wants to rent " +
				car.NameCar +
				" car from " +
				startTime +
				" to " +
				endTime + ".",
			TypeMessage: 0,
			CarId:       car.IdCar.String(),
		}
		Notification.SendNotification(deviceTokensStr, user, notification)
	}

	context.JSON(http.StatusCreated, gin.H{
		"message": "Booking success.",
	})
}

func parseDateString(dateString string) (time.Time, error) {
	layout := "2006-01-02 15:04:05.000"
	return time.Parse(layout, dateString)
}
