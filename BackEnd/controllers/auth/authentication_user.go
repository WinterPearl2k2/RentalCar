package controllers

import (
	"net/http"
	"rent-car/initializers"
	Middleware "rent-car/middleware"
	"rent-car/models"
	"strings"
	"time"

	"github.com/gin-gonic/gin"
)

func AuthenticationUser(context *gin.Context) {
	var body UserIdentify
	if err := context.ShouldBindJSON(&body); err != nil {
		context.JSON(http.StatusUnprocessableEntity, gin.H{
			"message": "Invalid information",
		})
		return
	}
	uuid, err := Middleware.RequireAuth(context)
	if err != nil {
		context.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
		return
	}
	birth, _ := parseDateString(body.DateOfBirth)

	cetizen := models.CetizenId{
		No:            body.No,
		Fullname:      body.Fullname,
		Sex:           body.Sex,
		PlaceOfOrigin: body.PlaceOfOrigin,
		Nationality:   body.Nationality,
		DateOfBirth:   birth,
		UserId:        uuid,
	}

	result := initializers.DB.Create(&cetizen)
	if result.Error != nil {
		errorMessage := result.Error.Error()
		if strings.Contains(errorMessage, "unique constraint") {
			context.JSON(http.StatusConflict, gin.H{
				"message": errorMessage,
			})
			return
		}

		context.JSON(http.StatusInternalServerError, gin.H{
			"message": errorMessage,
		})
		return
	}

	context.JSON(http.StatusCreated, gin.H{
		"message": "Update identify success.",
	})
}

func parseDateString(dateString string) (time.Time, error) {
	layout := "2006-01-02 15:04:05.000"
	return time.Parse(layout, dateString)
}
