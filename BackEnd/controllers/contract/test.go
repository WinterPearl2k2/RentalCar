package contract

import (
	Notification "rent-car/controllers/notification"
	"rent-car/models"

	"github.com/gin-gonic/gin"
)

func TestNotification(context *gin.Context) {
	data := Notification.NotificationData{
		Body:        "Hi",
		Title:       "Hi",
		TypeMessage: 0,
		CarId:       "123",
	}

	user := models.User{}
	var device []string
	device = append(device, "eWv8DjDcS-CjD3yHSxOY2c:APA91bHixALVCVVfUeAbPi6oxNVQrYW_9__rBhK8o1NT1XVQwId2Jbkk1ZCjV0tLYZnixdkchOjHTVAfWlCXREy-QioaK0_3NNvNEzvIAAJbw1dSOdjthII_t0cqQ2SNzT9cqVDgqOcg")
	Notification.SendNotification(device, user, data)
}
