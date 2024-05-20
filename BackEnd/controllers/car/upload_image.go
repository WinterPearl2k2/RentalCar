package car

import (
	"context"
	"math/rand"
	"net/http"
	"strings"

	"cloud.google.com/go/storage"
	firebase "firebase.google.com/go"
	"github.com/gin-gonic/gin"
	"google.golang.org/api/option"
)

func UploadImage(c *gin.Context) {
	file, header, err := c.Request.FormFile("file")
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "No file uploaded"})
		return
	}
	defer file.Close()

	buffer := make([]byte, header.Size)
	_, err = file.Read(buffer)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error reading file"})
		return
	}

	imageURL, err := uploadImageToFirebaseStorage(buffer)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"url": imageURL})
}

func uploadImageToFirebaseStorage(imageData []byte) (string, error) {
	opt := option.WithCredentialsFile("serviceAccountKey.json")
	app, err := firebase.NewApp(context.Background(), nil, opt)
	if err != nil {
		return "", err
	}

	client, err := app.Storage(context.Background())
	if err != nil {
		return "", err
	}

	bucketName := "rentalcar-e3d6b.appspot.com"
	bucket, err := client.Bucket(bucketName)
	if err != nil {
		return "", err
	}

	imageName := generateRandomName() + ".jpg"
	imagePath := "images/" + imageName

	wc := bucket.Object(imagePath).NewWriter(context.Background())
	wc.ContentType = "image/jpeg"
	if _, err := wc.Write(imageData); err != nil {
		return "", err
	}
	if err := wc.Close(); err != nil {
		return "", err
	}

	// Generate a download token
	obj := bucket.Object(imagePath)
	attrs, err := obj.Attrs(context.Background())
	if err != nil {
		return "", err
	}
	metadata := attrs.Metadata
	if metadata == nil {
		metadata = make(map[string]string)
	}

	// If no existing token, generate a new one
	token := generateRandomName()
	metadata["firebaseStorageDownloadTokens"] = token

	// Update the object metadata with the new token
	_, err = obj.Update(context.Background(), storage.ObjectAttrsToUpdate{
		Metadata: metadata,
	})
	if err != nil {
		return "", err
	}

	imageURL := "https://firebasestorage.googleapis.com/v0/b/" + bucketName + "/o/" + strings.Replace(imagePath, "/", "%2F", -1) + "?alt=media&token=" + token
	return imageURL, nil
}

func generateRandomName() string {
	const letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	var result strings.Builder
	for i := 0; i < 10; i++ {
		result.WriteByte(letters[rand.Intn(len(letters))])
	}
	return result.String()
}
