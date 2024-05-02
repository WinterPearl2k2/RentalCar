package models

import (
	"github.com/google/uuid"
)

type CarBrand struct {
	IdBrand    uuid.UUID `gorm:"primaryKey;type:uuid;default:uuid_generate_v4()"`
	ModelBrand string    `gorm:"type:nvarchar(255);notNull"`
	ModelYear  int       `gorm:"type:int;notNull"`
}
