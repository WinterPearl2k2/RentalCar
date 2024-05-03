package car

type CarBody struct {
	NameCar         string  `binding:"required"`
	PriceCar        float64 `binding:"required"`
	FuelTypeCar     string  `binding:"required"`
	BrandCar        string  `binding:"required"`
	ColorCar        string  `binding:"required"`
	DescriptionCar  string
	KilometersCar   int    `binding:"required"`
	SeatsCar        int    `binding:"required"`
	TransmissionCar string `binding:"required"`
	AddressOwner    string `binding:"required"`
	ImagesCar       string `binding:"required"`
	StatusCar       string `binding:"required"`
}
