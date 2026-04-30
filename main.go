package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()
	router.GET("/hello", hello)
	router.GET("/whatup", whatup)

	router.Run()
}

func hello(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{"name": "2Pac Shakur"})
}

func whatup(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{"name": "2Pac Shakur", "message": "Thug life!!"})
}
