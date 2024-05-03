package models

import (
	"time"

	"github.com/google/uuid"
)

type CarReview struct {
	IdReview      uuid.UUID `gorm:"primaryKey;type:uuid;default:uuid_generate_v4()"`
	RateReview    float32   `gorm:"type:float8;notNull"`
	CommentReview string    `gorm:"type:text"`
	CreatedAt     time.Time `gorm:"notNull;default:CURRENT_TIMESTAMP"`
	CarId         uuid.UUID `gorm:"type:uuid;notNull"`
	Car           *Car
}
