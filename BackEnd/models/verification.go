package models

import "time"

type Verification struct {
	Email      string    `gorm:"primaryKey"`
	Code       string    `gorm:"type:varchar(255);uniqueIndex;notNull"`
	Expiration time.Time `gorm:"notNull;default:CURRENT_TIMESTAMP"`
}
