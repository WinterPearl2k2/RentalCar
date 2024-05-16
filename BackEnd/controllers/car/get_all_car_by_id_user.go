package car

import (
	"net/http"
	CarRepository "rent-car/repositories/car"
	UserRepository "rent-car/repositories/users"

	"github.com/gin-gonic/gin"
)

func GetAllCarByIdUser(context *gin.Context) {
	idUser := context.Param("idUser")

	cars, err := CarRepository.GetCarsByUserID(idUser)
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	if len(cars) == 0 {
		context.JSON(http.StatusOK, []gin.H{})
		return
	}

	var carsData []gin.H

	for _, car := range cars {
		user, err := UserRepository.GetUserById(car.UserId.String())
		if err != nil {
			context.JSON(http.StatusInternalServerError, gin.H{
				"error": "Cannot find user for car",
			})
			return
		}

		// Lấy tất cả các đánh giá của xe
		reviews, err := CarRepository.GetReviewsByCarID(car.IdCar.String())
		if err != nil {
			context.JSON(http.StatusInternalServerError, gin.H{
				"error": "Cannot get reviews for car",
			})
			return
		}

		// Tính toán ReviewCount và AverageRating
		reviewCount := len(reviews)
		var totalRating float32 = 0.0
		var commentCount int = 0
		for _, review := range reviews {
			totalRating += review.RateReview
			if review.CommentReview != "" {
				commentCount++
			}
		}
		var averageRating float64
		if reviewCount > 0 {
			averageRating = float64(totalRating) / float64(reviewCount)
		}

		carData := gin.H{
			"idCar":           car.IdCar,
			"idUser":          car.UserId,
			"userName":        user.NameUser,
			"nameCar":         car.NameCar,
			"priceCar":        car.PriceCar,
			"fuelTypeCar":     car.FuelTypeCar,
			"brandCar":        car.BrandCar,
			"colorCar":        car.ColorCar,
			"descriptionCar":  car.DescriptionCar,
			"kilometersCar":   car.KilometersCar,
			"seatsCar":        car.SeatsCar,
			"transmissionCar": car.TransmissionCar,
			"addressCar":      car.AddressCar,
			"latCar":          car.LatCar,
			"longCar":         car.LongCar,
			"imagesCar":       car.ImagesCar,
			"statusCar":       car.StatusCar,
			"createAt":        car.CreatedAt,
			"reviewCount":     commentCount,
			"averageRating":   averageRating,
		}
		carsData = append(carsData, carData)
	}

	context.JSON(http.StatusOK, carsData)
}
