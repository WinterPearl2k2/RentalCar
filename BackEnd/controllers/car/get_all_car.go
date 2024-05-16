package car

import (
	"net/http"
	"strconv"

	CarRepository "rent-car/repositories/car"
	UserRepository "rent-car/repositories/users"

	"github.com/gin-gonic/gin"
)

func GetAllCar(context *gin.Context) {
    userID := context.Query("userID")

    // Lấy các tham số phân trang từ truy vấn URL
    pageStr := context.DefaultQuery("page", "1")
    pageSizeStr := context.DefaultQuery("pageSize", "10")

    page, err := strconv.Atoi(pageStr)
    if err != nil || page < 1 {
        context.JSON(http.StatusBadRequest, gin.H{"error": "Invalid page parameter"})
        return
    }

    pageSize, err := strconv.Atoi(pageSizeStr)
    if err != nil || pageSize < 1 {
        context.JSON(http.StatusBadRequest, gin.H{"error": "Invalid pageSize parameter"})
        return
    }

    cars, err := CarRepository.GetAll()
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
        if car.UserId.String() == userID {
            continue
        }
        user, err := UserRepository.GetUserById(car.UserId.String())
        if err != nil {
            context.JSON(http.StatusInternalServerError, gin.H{
                "error": "Cannot find user for car",
            })
            return
        }

        reviews, err := CarRepository.GetReviewsByCarID(car.IdCar.String())
        if err != nil {
            context.JSON(http.StatusInternalServerError, gin.H{
                "error": "Cannot get reviews for car",
            })
            return
        }

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

    // Xác định chỉ số bắt đầu và kết thúc cho phân trang
    start := (page - 1) * pageSize
    end := start + pageSize

    // Đảm bảo chỉ số không vượt quá phạm vi của mảng
    if start >= len(carsData) {
        context.JSON(http.StatusOK, []gin.H{})
        return
    }

    if end > len(carsData) {
        end = len(carsData)
    }

    paginatedCarsData := carsData[start:end]

    context.JSON(http.StatusOK, paginatedCarsData)
}

