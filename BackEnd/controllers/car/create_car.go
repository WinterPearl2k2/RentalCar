package car

import (
	"errors"
	"net/http"
	"os"
	"rent-car/initializers"
	"rent-car/models"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v4"
	"github.com/google/uuid"
)

func CreateCar(context *gin.Context) {
	token := context.GetHeader("Authorization")
	token = strings.TrimPrefix(token, "Bearer ")

	userId, err := getUserIDFromToken(token)
	if err != nil {
		context.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
		return
	}

	var body CarBody
	if err := context.ShouldBindJSON(&body); err != nil {
		context.JSON(http.StatusUnprocessableEntity, gin.H{"error": err.Error()})
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
		UserId:          userId,
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

func getUserIDFromToken(tokenString string) (uuid.UUID, error) {
	secret := os.Getenv("JWT_ACCESS_SECRET")
	if secret == "" {
		return uuid.UUID{}, errors.New("JWT access secret key not found")
	}

	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		// Validate the algorithm
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, errors.New("unexpected signing method")
		}
		return []byte(secret), nil
	})

	if err != nil {
		return uuid.UUID{}, err
	}

	if claims, ok := token.Claims.(jwt.MapClaims); ok && token.Valid {
		userIdString, ok := claims["user_id"].(string)
		if !ok {
			return uuid.UUID{}, errors.New("user_id not found in token claims")
		}
		userId, err := uuid.Parse(userIdString)
		if err != nil {
			return uuid.UUID{}, errors.New("failed to parse user_id from token")
		}
		return userId, nil
	}

	return uuid.UUID{}, errors.New("invalid token")
}