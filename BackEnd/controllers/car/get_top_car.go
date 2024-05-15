package car

import (
	"net/http"
	"rent-car/initializers"
	"rent-car/models"
	"sort"

	"github.com/gin-gonic/gin"
)

func GetTopCar(context *gin.Context) {
	var topCars []gin.H

	type CarInfo struct {
		Car           models.Car
		ReviewCount   int
		CommentCount  int
		AverageRating float64
	}

	// Lấy tất cả các xe
	var cars []models.Car
	if err := initializers.DB.Find(&cars).Error; err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	var carInfos []CarInfo

	for _, car := range cars {
		var count int64
		if err := initializers.DB.Model(&models.CarReview{}).Where("car_id = ?", car.IdCar).Count(&count).Error; err != nil {
			context.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		var totalRating float32 = 0.0
		var numReviews int = 0
		var commentCount int = 0
		var reviews []models.CarReview
		if err := initializers.DB.Where("car_id = ?", car.IdCar).Find(&reviews).Error; err != nil {
			context.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		// Tính toán tổng số sao và số lượng đánh giá
		for _, review := range reviews {
			totalRating += review.RateReview
			numReviews++
			if review.CommentReview != "" {
				commentCount++
			}
		}

		var averageRating float64
		if numReviews > 0 {
			averageRating = float64(totalRating) / float64(numReviews)
		}

		carInfo := CarInfo{
			Car:           car,
			ReviewCount:   int(count),
			CommentCount : commentCount,
			AverageRating: averageRating,
		}

		carInfos = append(carInfos, carInfo)
	}

	// Sắp xếp danh sách các xe
	sort.Slice(carInfos, func(i, j int) bool {
		if carInfos[i].AverageRating == carInfos[j].AverageRating {
			return carInfos[i].ReviewCount > carInfos[j].ReviewCount
		}
		return carInfos[i].AverageRating > carInfos[j].AverageRating
	})

	// Chọn số lượng xe tối đa để trả về
	maxCars := 10
	if len(carInfos) < maxCars {
		maxCars = len(carInfos)
	}

	// Tạo danh sách các xe sắp xếp
	for i := 0; i < maxCars; i++ {
		carInfo := carInfos[i]

		var user models.User
		if err := initializers.DB.First(&user, "id_user = ?", carInfo.Car.UserId).Error; err != nil {
			context.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		carData := gin.H{
			"idCar":           carInfo.Car.IdCar,
			"idUser":          carInfo.Car.UserId,
			"userName":        user.NameUser,
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
			"reviewCount":     carInfo.CommentCount,
			"averageRating":   carInfo.AverageRating,
		}
		topCars = append(topCars, carData)
	}

	context.JSON(http.StatusOK, topCars)
}
