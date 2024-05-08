package middleware

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"strings"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v4"
	"github.com/google/uuid"
)

func RequireAuth(context *gin.Context) (uuid.UUID, error) {
	authorization := context.Request.Header.Get("Authorization")
	tokenString := strings.TrimPrefix(authorization, "Bearer ")

	secret := []byte(os.Getenv("JWT_ACCESS_SECRET"))
	log.Print(os.Getenv("JWT_ACCESS_SECRET"))
	log.Print(tokenString)

	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("unexpected signing method: %v", token.Header["alg"])
		}
		return secret, nil
	})

	if err != nil {
		context.JSON(http.StatusUnauthorized, gin.H{
			"message": err.Error(),
		})
		log.Print("Eror line 26")
		return uuid.UUID{}, err
	}

	claims, ok := token.Claims.(jwt.MapClaims)
	if !ok {
		context.JSON(http.StatusUnauthorized, gin.H{
			"message": "Unauthorized",
		})
		log.Print("Eror line 37")
		return uuid.UUID{}, err
	}
	exp := time.Unix(int64(claims["exp"].(float64)), 0)
	if time.Now().After(exp) {
		context.JSON(http.StatusUnauthorized, gin.H{
			"message": "Token expired",
		})
		log.Print("Eror line 45")
		return uuid.UUID{}, err
	}
	userId, err := uuid.Parse(claims["user_id"].(string))
	if err != nil {
		context.JSON(http.StatusUnauthorized, gin.H{
			"message": "Unauthorized",
		})
		log.Print("Eror line 70")
		return uuid.UUID{}, err
	}
	return userId, err
}
