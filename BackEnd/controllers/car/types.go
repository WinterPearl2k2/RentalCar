package car

import "time"

type CarBody struct {
	NameCar         string  `binding:"required"`
	PriceCar        float64 `binding:"required"`
	FuelTypeCar     string  `binding:"required"`
	BrandCar        string  `binding:"required"`
	ColorCar        string  `binding:"required"`
	DescriptionCar  string
	KilometersCar   float64 `binding:"required"`
	SeatsCar        int     `binding:"required"`
	TransmissionCar string  `binding:"required"`
	AddressCar      string  `binding:"required"`
	LatCar          float64 `binding:"required"`
	LongCar         float64 `binding:"required"`
	ImagesCar       string
	StatusCar       string `binding:"required"`
}

type CarRent struct {
	RentalPrice float64 `binding:"required"`
	RentalDays  int     `binding:"required"`
	IdCar       string  `binding:"required"`
	StartDate   string  `binding:"required"`
	EndDate     string  `binding:"required"`
}

type DateTimeCar struct {
	StartDate time.Time `binding:"required"`
	EndDate   time.Time `binding:"required"`
}
type CarReviewBody struct {
	RateReview    float32 `json:"rateReview" binding:"required"`
	CommentReview string  `json:"commentReview"`
	CarId         string  `json:"idCar" binding:"required"`
}
type CarInfo struct {
	ReviewCount   int
	AverageRating float64
}

type Room struct {
	UserId  string
	KeyRoom string
}
