package car

import (
	"errors"
	"log"
	"net/http"
	Notification "rent-car/controllers/notification"
	TokenDeviceRepository "rent-car/repositories/device_token"
	UserRepository "rent-car/repositories/users"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func HangUp(context *gin.Context) {
	var body Room
	if err := context.ShouldBindJSON(&body); err != nil {
		context.JSON(http.StatusUnprocessableEntity, gin.H{
			"message": "Invalid information",
		})
		return
	}
	log.Print(body)

	user, err := UserRepository.GetUserById(body.UserId)

	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			context.JSON(http.StatusBadRequest, gin.H{
				"message": "User not exsits",
			})
			return
		}
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": err.Error(),
		})
		log.Print("Eror line 36")
		return
	}

	deviceTokens, _ := TokenDeviceRepository.FindDeviceTokenByUserID(user.IdUser)
	var deviceTokensStr []string
	for _, deviceToken := range deviceTokens {
		deviceTokensStr = append(deviceTokensStr, deviceToken.DeviceToken)
	}

	Notification.HangUpUser(deviceTokensStr)

	context.JSON(http.StatusOK, gin.H{
		"message": "Ok",
	})
}
