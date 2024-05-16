package models

import (
	"time"

	"github.com/google/uuid"
)

type CarReview struct {
	RateReview    float32   `gorm:"type:float8;notNull"`
	CommentReview string    `gorm:"type:text"`
	CreatedAt     time.Time `gorm:"notNull;default:CURRENT_TIMESTAMP"`
	UserId        uuid.UUID `gorm:"type:uuid;primaryKey"`
	CarId         uuid.UUID `gorm:"type:uuid;primaryKey"`

	Car  *Car  `gorm:"foreignKey:CarId"`
	User *User `gorm:"foreignKey:UserId"`
}
