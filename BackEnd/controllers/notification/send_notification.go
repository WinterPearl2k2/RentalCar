package notification

import (
	"context"
	"fmt"
	"log"
	"rent-car/models"
	"strconv"

	firebase "firebase.google.com/go/v4"
	"firebase.google.com/go/v4/messaging"
	"google.golang.org/api/option"
)

func SendNotification(deviceToken []string, user models.User, notification NotificationData) {
	opt := option.WithCredentialsFile("serviceAccountKey.json")
	config := &firebase.Config{ProjectID: "rentalcar-e3d6b"}
	app, err := firebase.NewApp(context.Background(), config, opt)
	if err != nil {
		log.Fatalf("error initializing app: %v", err)
	}
	ctx := context.Background()
	client, err := app.Messaging(ctx)
	if err != nil {
		log.Fatalf("error getting Messaging client: %v\n", err)
	}

	registrationToken := deviceToken

	message := &messaging.MulticastMessage{
		Notification: &messaging.Notification{
			Body:  notification.Body,
			Title: notification.Title,
		},
		Android: &messaging.AndroidConfig{
			Priority: "high",
			Notification: &messaging.AndroidNotification{
				ChannelID: "channelId",
			},
		},
		Data: map[string]string{
			"typeMessage": strconv.Itoa(notification.TypeMessage),
			"carId":       notification.CarId,
		},
		Tokens: registrationToken,
	}

	response, err := client.SendMulticast(ctx, message)
	if err != nil {
		log.Fatalln(err)
	}

	fmt.Println("Successfully sent message:", response)
}
