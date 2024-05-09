package car

import (
	"errors"
	"net/http"
	"strings"

	"rent-car/initializers"
	Middleware "rent-car/middleware"
	"rent-car/models"
	CarRepository "rent-car/repositories/car"
	UserRepository "rent-car/repositories/users"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func RentalCar(context *gin.Context) {
	var body CarRent
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

	rentalCar := models.CarRentail{
		StatusCar:   0,
		User:        &user,
		Car:         &car,
		RentalPrice: body.RentalPrice,
		RentalDays:  body.RentalDays,
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

	context.JSON(http.StatusCreated, gin.H{
		"message": "Booking success.",
	})
}
