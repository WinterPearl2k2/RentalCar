package controllers

type RegisterBody struct {
	Name        string `binding:"required"`
	PhoneNumber string `binding:"required"`
	Email       string `binding:"required"`
	Password    string `binding:"required"`
}

type LoginBody struct {
	Email    string `binding:"required"`
	Password string `binding:"required"`
}

type RefreshToken struct {
	RefreshToken string `binding:"required"`
}
