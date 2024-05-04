package controllers

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"rent-car/utils"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v4"
	"github.com/google/uuid"
)

func NewToken(context *gin.Context) {
	var refreshToken RefreshToken

	if err := context.ShouldBindJSON(&refreshToken); err != nil {
		context.JSON(http.StatusUnprocessableEntity, gin.H{
			"message": "Invalid information",
		})
		return
	}
	log.Print(refreshToken.RefreshToken)
	secret := []byte(os.Getenv("JWT_REFRESH_SECRET"))

	token, err := jwt.Parse(refreshToken.RefreshToken, func(token *jwt.Token) (interface{}, error) {
		_, ok := token.Method.(*jwt.SigningMethodHMAC)
		if !ok {
			return nil, fmt.Errorf("unexpected signing method: %v", token.Header["alg"])
		}
		return secret, nil
	})

	if err != nil || !token.Valid {
		context.JSON(http.StatusUnauthorized, gin.H{
			"message": "Token expired",
		})
		log.Print("Eror line 45")
		return
	}

	claims, ok := token.Claims.(jwt.MapClaims)
	//Check lỗi khi lấy token
	if !ok || !token.Valid {
		context.JSON(http.StatusUnauthorized, gin.H{
			"message": "Unauthorized",
		})
		log.Print("Eror line 53")
		return
	}
	exp := time.Unix(int64(claims["exp"].(float64)), 0)
	if time.Now().After(exp) {
		context.JSON(http.StatusUnauthorized, gin.H{
			"message": "Token expired",
		})
		log.Print("Eror line 61")
		return
	}

	userId, err := uuid.Parse(claims["user_id"].(string))
	if err != nil {
		context.JSON(http.StatusUnauthorized, gin.H{
			"message": "Unauthorized",
		})
		log.Print("Eror line 70")
		return
	}

	newAccessToken, errAccess := utils.GenerateAccessToken(userId)
	newFefreshToken, errRefresh := utils.GenerateRefreshToken(userId)

	if errAccess != nil || errRefresh != nil {
		context.JSON(http.StatusInternalServerError, gin.H{
			"message": "Status Internal ServerError",
		})
		log.Print(errAccess.Error() + errRefresh.Error())
		return
	}

	context.JSON(http.StatusOK, gin.H{
		"accessToken":  newAccessToken,
		"refreshToken": newFefreshToken,
	})
}
