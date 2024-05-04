package utils

import (
	"os"
	"time"

	"github.com/golang-jwt/jwt/v4"
	"github.com/google/uuid"
)

func GenerateAccessToken(userId uuid.UUID) (string, error) {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"user_id": userId,
		"exp":     time.Now().Add(time.Second * 10).Unix(),
	})
	secret := os.Getenv("JWT_ACCESS_SECRET")
	tokenString, err := token.SignedString([]byte(secret))
	return tokenString, err
}

func GenerateRefreshToken(userId uuid.UUID) (string, error) {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"user_id": userId,
		"exp":     time.Now().Add(30 * 24 * time.Hour).Unix(),
	})
	secret := os.Getenv("JWT_REFRESH_SECRET")
	tokenString, err := token.SignedString([]byte(secret))
	return tokenString, err
}
