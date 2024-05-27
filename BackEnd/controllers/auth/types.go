package controllers

type RegisterBody struct {
	Name        string `binding:"required"`
	PhoneNumber string `binding:"required"`
	Email       string `binding:"required"`
	Password    string `binding:"required"`
}

type LoginBody struct {
	Email       string `binding:"required"`
	Password    string `binding:"required"`
	DeviceToken string `binding:"required"`
}

type ResetPassword struct {
	Email    string `binding:"required"`
	Password string `binding:"required"`
}

type RefreshToken struct {
	RefreshToken string `binding:"required"`
}

type EmailVerify struct {
	Email string `binding:"required"`
}

type CodeData struct {
	Code  string `binding:"required"`
	Email string `binding:"required"`
}

type PasswordData struct {
	OldPassword string `binding:"required"`
	NewPassword string `binding:"required"`
}

type UserIdentify struct {
	No            string `binding:"required"`
	Fullname      string `binding:"required"`
	DateOfBirth   string `binding:"required"`
	Sex           string `binding:"required"`
	PlaceOfOrigin string `binding:"required"`
	Nationality   string `binding:"required"`
}
