package notification

type NotificationData struct {
	Body        string `binding:"required"`
	Title       string `binding:"required"`
	TypeMessage int    `binding:"required"`
	CarId       string `binding:"required"`
}
