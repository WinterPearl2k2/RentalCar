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
