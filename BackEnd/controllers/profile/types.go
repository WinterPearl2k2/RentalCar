package controllers

type UserProfile struct {
	Name  string `binding:"required"`
	Phone string `binding:"required"`
	Email string `binding:"required"`
}
