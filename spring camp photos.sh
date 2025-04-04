#this is the final final ONLY file we now use since we downgraded pis!
#!/bin/bash

while true; do
  TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')
  MODEL_NAME="model_insertmodelnumber"
  FILE_NAME="${TIMESTAMP}_${MODEL_NAME}.jpg"
  ALBUM_PATH="Birdbox v1:album/Birdbox_InsertImplementationLocation"

  # Check if album exists, and create it if not
  rclone mkdir "${ALBUM_PATH}"

  # Capture image
  sudo libcamera-still -o "/home/ecoinnovate/${FILE_NAME}"

  # Copy image to album
  rclone copy "/home/ecoinnovate/${FILE_NAME}" "${ALBUM_PATH}"

  # Wait for 3 minutes before running again
  sleep 180
done
