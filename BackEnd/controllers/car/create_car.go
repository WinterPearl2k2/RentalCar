package car

import (
	"net/http"
	"rent-car/initializers"
	"rent-car/models"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

func CreateCar(context *gin.Context) {
	// Lấy người dùng từ context nếu cần
	// user := utils.GetUserFromContext(context)

	var body CarBody
	if err := context.ShouldBindJSON(&body); err != nil {
		context.JSON(http.StatusUnprocessableEntity, gin.H{"error": err.Error()})
		return
	}

	userID, err := uuid.Parse("e31a27f0-3c4f-43d2-b71c-e9bf11837f21")
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to parse userID"})
		return
	}

	car := models.Car{
		NameCar:         body.NameCar,
		PriceCar:        body.PriceCar,
		FuelTypeCar:     body.FuelTypeCar,
		BrandCar:        body.BrandCar,
		ColorCar:        body.ColorCar,
		DescriptionCar:  body.DescriptionCar,
		KilometersCar:   body.KilometersCar,
		SeatsCar:        body.SeatsCar,
		TransmissionCar: body.TransmissionCar,
		AddressOwner:    body.AddressOwner,
		ImagesCar:       body.ImagesCar,
		StatusCar:       body.StatusCar,
		UserId:          userID,
	}

	result := initializers.DB.Create(&car)

	if result.Error != nil {
		errorMessage := result.Error.Error()
		if strings.Contains(errorMessage, "unique constraint") {
			context.JSON(http.StatusConflict, gin.H{"error": "Car model already exists for this brand"})
			return
		}
		context.JSON(http.StatusInternalServerError, gin.H{"error": errorMessage})
		return
	}
	context.JSON(http.StatusCreated, gin.H{"body": car})
}
