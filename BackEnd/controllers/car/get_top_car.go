package car

import (
	"net/http"
	"rent-car/initializers"
	"rent-car/models"

	"github.com/gin-gonic/gin"
)

func GetTopCar(context *gin.Context) {
	var topCars []gin.H

	type CarInfo struct {
		Car         models.Car
		ReviewCount int
	}

	// Lấy tất cả các xe
	var cars []models.Car
	if err := initializers.
		DB.Find(&cars).Error; err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	var carInfos []CarInfo

	for _, car := range cars {
		var count int64
		if err := initializers.
			DB.Model(&models.CarReview{}).Where("car_id = ?", car.IdCar).Count(&count).Error; err != nil {
			context.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		carInfo := CarInfo{
			Car:         car,
			ReviewCount: int(count),
		}

		carInfos = append(carInfos, carInfo)
	}

	for i := range carInfos {
		maxIndex := i
		for j := i + 1; j < len(carInfos); j++ {
			if carInfos[j].ReviewCount > carInfos[maxIndex].ReviewCount {
				maxIndex = j
			}
		}
		carInfos[i], carInfos[maxIndex] = carInfos[maxIndex], carInfos[i]
	}

	maxCars := 10
	if len(carInfos) < maxCars {
		maxCars = len(carInfos)
	}
	for i := 0; i < maxCars; i++ {
		carInfo := carInfos[i]

		var user models.User
		if err := initializers.
			DB.First(&user, "id_user = ?", carInfo.Car.UserId).Error; err != nil {
			context.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		carData := gin.H{
			"idCar":           carInfo.Car.IdCar,
			"idUser":          carInfo.Car.UserId,
			"userName":        user.NameUser,
			"idReview":        carInfo.Car.ReviewId,
			"nameCar":         carInfo.Car.NameCar,
			"priceCar":        carInfo.Car.PriceCar,
			"fuelTypeCar":     carInfo.Car.FuelTypeCar,
			"brandCar":        carInfo.Car.BrandCar,
			"colorCar":        carInfo.Car.ColorCar,
			"descriptionCar":  carInfo.Car.DescriptionCar,
			"kilometersCar":   carInfo.Car.KilometersCar,
			"seatsCar":        carInfo.Car.SeatsCar,
			"transmissionCar": carInfo.Car.TransmissionCar,
			"addressCar":      carInfo.Car.AddressCar,
			"latCar":          carInfo.Car.LatCar,
			"longCar":         carInfo.Car.LongCar,
			"imagesCar":       carInfo.Car.ImagesCar,
			"statusCar":       carInfo.Car.StatusCar,
			"createAt":        carInfo.Car.CreatedAt,
			"reviewCount":     carInfo.ReviewCount,
		}
		topCars = append(topCars, carData)
	}

	context.JSON(http.StatusOK, topCars)
}
