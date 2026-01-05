# Set the URL of the image
$imageUrl = "https://example.com/image.jpg"

# Set the path where the image will be saved
$imagePath = "$env:USERPROFILE\Downloads\image.jpg"

# Download the image from the URL
Invoke-WebRequest -Uri $imageUrl -OutFile $imagePath

# Open the image using the default photo viewer (in fullscreen mode)
Start-Process $imagePath

# Optional: You can wait a few seconds to make sure the image opens before the script ends
Start-Sleep -Seconds 2
