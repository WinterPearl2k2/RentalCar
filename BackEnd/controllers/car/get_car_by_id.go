package car

import (
	"errors"
	"net/http"

	CarRepository "rent-car/repositories/car"
	UserRepository "rent-car/repositories/users"

	"github.com/gin-gonic/gin"

	"gorm.io/gorm"
)

func GetCarById(context *gin.Context) {
	id := context.Param("id")

	car, err := CarRepository.GetById(id)
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			context.JSON(http.StatusNotFound, gin.H{
				"error": "Car not found",
			})
			return
		}
		context.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

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
	var averageRating float64 = 0.0
	if reviewCount > 0 {
		averageRating = float64(totalRating) / float64(reviewCount)
	}

	// Tạo danh sách bình luận và thông tin người bình luận
	var comments []gin.H
	for _, review := range reviews {
		if review.CommentReview != "" { // Kiểm tra nếu bình luận không rỗng
			user, err := UserRepository.GetUserById(review.UserId.String())
			if err != nil {
				context.JSON(http.StatusInternalServerError, gin.H{
					"error": "Cannot find user for comment",
				})
				return
			}
			commentData := gin.H{
				"comment":   review.CommentReview,
				"commenter": user.NameUser,
				"createdAt": review.CreatedAt,
			}
			comments = append(comments, commentData)
		}
	}

	context.JSON(http.StatusOK, gin.H{
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
		"comments":        comments,
	})
}
