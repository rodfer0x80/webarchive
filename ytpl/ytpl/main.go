package main

import (
	"fmt"
	"io"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
	"strings"

	"github.com/google/uuid"
)

func refreshUserCache() string {
	tempDir := "/tmp/ytpl"
	os.MkdirAll(tempDir, 0755)
	return tempDir
}

func getVideoID(url string) string {
	videoID := strings.TrimPrefix(url, "https://www.youtube.com/watch?v=")
	videoID = strings.TrimSpace(videoID)
	return videoID
}

func buildUUIDVideoPath(tempDir string) string {
	uuid := uuid.New().String()
	videoPath := filepath.Join(tempDir, uuid+".mp4")
	return videoPath
}

func ytdlVideo(videoPath string, videoID string) {
	cmd := exec.Command("yt-dlp", "--no-playlist", "--format", "mp4", "--output", videoPath, videoID)
	cmd.Run()
}

func downloadVideo(conWrite http.ResponseWriter, request *http.Request, url string) string {
	tempDir := refreshUserCache()

	videoID := getVideoID(url)

	videoPath := buildUUIDVideoPath(tempDir)

	ytdlVideo(videoPath, videoID)

	return videoPath
}

func getVideoURL(conWrite http.ResponseWriter, request *http.Request) string {
	if request.Method == http.MethodGet {
		url := request.FormValue("url")
		return url
	}
	return ""
}

func cleanupDownload(videoPath string) {
	if err := os.Remove(videoPath); err != nil {
		fmt.Printf("Error deleting video file: %v\n", err)
	}
}

func sendVideo(conWrite http.ResponseWriter, videoPath string) {
	videoFile, _ := os.Open(videoPath)
	defer videoFile.Close()

	conWrite.Header().Set("Content-Type", "video/mp4")

	io.Copy(conWrite, videoFile)
}

func handleVideoRequest(conWrite http.ResponseWriter, request *http.Request) {
	url := getVideoURL(conWrite, request)
	if url == "" {
		return
	}

	videoPath := downloadVideo(conWrite, request, url)

	sendVideo(conWrite, videoPath)

	defer cleanupDownload(videoPath)
}

func main() {
	http.HandleFunc("/", handleVideoRequest)
	iface := "0.0.0.0"
	port := 8090
	fmt.Printf("Server is listening on port %d...\n", port)
	err := http.ListenAndServe(fmt.Sprintf("%s:%d", iface, port), nil)
	if err != nil {
		fmt.Println("Error starting server:", err)
	}
}
