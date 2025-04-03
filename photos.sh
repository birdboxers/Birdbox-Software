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

#______FOR SPRING WORKSHOP, CUT THIS OUT_________

  if [ $? -eq 0 ]; then
    # Remove the local file if the upload is successful
    sudo rm "/home/ecoinnovate/${FILE_NAME}"
  else
    # Send an email if there is an error uploading
    echo "from your bestie, the pi" | mail -s "Pi photos not sending" birdboxers11124@gmail.com
  fi
#_______________________________________________

  # Wait for 3 minutes before running again
  sleep 180
done
