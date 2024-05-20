package car

import (
	"fmt"
	"math"
	"net/http"
	"sort"
	"strconv"

	CarRepository "rent-car/repositories/car"
	UserRepository "rent-car/repositories/users"

	"github.com/gin-gonic/gin"
)

// haversine calculates the great-circle distance between two points
// on the Earth's surface given their latitude and longitude in degrees.
func haversine(lat1, lon1, lat2, lon2 float64) float64 {
	const R = 6371 // Radius of the Earth in kilometers
	lat1Rad := lat1 * math.Pi / 180
	lon1Rad := lon1 * math.Pi / 180
	lat2Rad := lat2 * math.Pi / 180
	lon2Rad := lon2 * math.Pi / 180
	dlat := lat2Rad - lat1Rad
	dlon := lon2Rad - lon1Rad

	a := math.Sin(dlat/2)*math.Sin(dlat/2) + math.Cos(lat1Rad)*math.Cos(lat2Rad)*math.Sin(dlon/2)*math.Sin(dlon/2)
	c := 2 * math.Atan2(math.Sqrt(a), math.Sqrt(1-a))
	return R * c * 1000
}

func GetAllCar(context *gin.Context) {
	userID := context.Query("userID")
	latitude := context.DefaultQuery("latitude", "0")
	longitude := context.DefaultQuery("longitude", "0")

	lat, err := strconv.ParseFloat(latitude, 64)
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": "Invalid latitude parameter"})
		return
	}
	lon, err := strconv.ParseFloat(longitude, 64)
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": "Invalid longitude parameter"})
		return
	}

	// Debugging prints
	fmt.Printf("Request coordinates: lat=%f, lon=%f\n", lat, lon)

	// Pagination parameters
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

	// Fetch all cars
	cars, err := CarRepository.GetAll()
	if err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
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
			context.JSON(http.StatusInternalServerError, gin.H{"error": "Cannot find user for car"})
			return
		}

		reviews, err := CarRepository.GetReviewsByCarID(car.IdCar.String())
		if err != nil {
			context.JSON(http.StatusInternalServerError, gin.H{"error": "Cannot get reviews for car"})
			return
		}

		reviewCount := len(reviews)
		var totalRating float32
		var commentCount int
		for _, review := range reviews {
			totalRating += review.RateReview
			if review.CommentReview != "" {
				commentCount++
			}
		}

		averageRating := float64(0)
		if reviewCount > 0 {
			averageRating = float64(totalRating) / float64(reviewCount)
		}

		// Default to a large distance if coordinates are invalid
		distance := math.MaxFloat64
		if car.LatCar != 0 && car.LongCar != 0 {
			distance = haversine(lat, lon, car.LatCar, car.LongCar)
		}

		// Debugging prints
		//fmt.Printf("Car: %s, Coordinates: lat=%f, lon=%f, Distance: %f\n", car.NameCar, car.LatCar, car.LongCar, distance)

		if distance <= 20000 {
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
				"distanceCar":     distance,
			}
			carsData = append(carsData, carData)
		}
	}
	// Sort cars by distance
	sort.SliceStable(carsData, func(i, j int) bool {
		return carsData[i]["distanceCar"].(float64) < carsData[j]["distanceCar"].(float64)
	})

	// Pagination logic
	start := (page - 1) * pageSize
	end := start + pageSize

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
