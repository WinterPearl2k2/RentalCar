package car

import (
	"net/http"
	"rent-car/initializers"
	"rent-car/models"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

func CreateCarReview(context *gin.Context) {
	token := context.GetHeader("Authorization")
	token = strings.TrimPrefix(token, "Bearer ")

	userId, err := getUserIDFromToken(token)
	if err != nil {
		context.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
		return
	}

	var body CarReviewBody
	if err := context.ShouldBindJSON(&body); err != nil {
		context.JSON(http.StatusUnprocessableEntity, gin.H{"error": err.Error()})
		return
	}

	carId, err := uuid.Parse(body.CarId)
	if err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": "Invalid car ID"})
		return
	}

	// Kiểm tra xem người dùng đã đánh giá xe này trước đó chưa
	var existingReview models.CarReview
	result := initializers.DB.Where("user_id = ? AND car_id = ?", userId, carId).First(&existingReview)
	if result.RowsAffected > 0 {
		// Nếu đã có đánh giá từ người dùng trước đó, cập nhật lại đánh giá
		existingReview.RateReview = body.RateReview
		existingReview.CommentReview = body.CommentReview

		if err := initializers.DB.Save(&existingReview).Error; err != nil {
			context.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to update car review"})
			return
		}

		context.JSON(http.StatusOK, gin.H{"message": "Car review updated successfully"})
		return
	}

	// Nếu chưa có đánh giá từ người dùng, thêm mới đánh giá
	carReview := models.CarReview{
		RateReview:    body.RateReview,
		CommentReview: body.CommentReview,
		UserId:        userId,
		CarId:         carId,
	}

	if err := initializers.DB.Create(&carReview).Error; err != nil {
		context.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to create car review"})
		return
	}

	context.JSON(http.StatusCreated, gin.H{"message": "Car review created successfully"})
}
