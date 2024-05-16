package car

import (
	"net/http"
	"rent-car/initializers"
	"rent-car/models"
	"strings"

	"github.com/gin-gonic/gin"
)

func GetCarReview(context *gin.Context) {
	carID := context.Param("idCar")
	token := context.GetHeader("Authorization")
	token = strings.TrimPrefix(token, "Bearer ")

	userId, err := getUserIDFromToken(token)
	if err != nil {
		context.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
		return
	}

	var carReview models.CarReview
	result := initializers.DB.Where("user_id = ? AND car_id = ?", userId, carID).First(&carReview)
	if result.RowsAffected == 0 {
		context.JSON(http.StatusOK, gin.H{
			"idCar":         "",
			"rateReview":    3,
			"commentReview": ""})
		return
	}

	context.JSON(http.StatusOK, gin.H{
		"idCar":         carReview.CarId,
		"rateReview":    carReview.RateReview,
		"commentReview": carReview.CommentReview,
	})
}
