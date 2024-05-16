package repositories

import (
	"rent-car/initializers"
	"rent-car/models"
)

func GetReviewsByCarID(carID string) ([]models.CarReview, error) {
	var reviews []models.CarReview
	if err := initializers.DB.Where("car_id = ?", carID).Find(&reviews).Error; err != nil {
		return nil, err
	}
	return reviews, nil
}
