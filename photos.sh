#this is the final final ONLY file we now use since we downgraded pis!
#!/bin/bash

TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')
MODEL_NAME="version_na"
FILE_NAME="${TIMESTAMP}_${MODEL_NAME}.jpg"
ALBUM_PATH="Birdbox v1:album/BEI: Backyard Experimental Implementation"

# Check if album exists, and create it if not
rclone mkdir "${ALBUM_PATH}"

# Capture image
sudo libcamera-still -o "${FILE_NAME}"

# Copy image to album
rclone copy "/home/ecoinnovate//${FILE_NAME}" "${ALBUM_PATH}"

if [ $? -eq 0 ]; then
  # Remove the local file if the upload is successful
  sudo rm "/home/birdbox/${FILE_NAME}"
else
  # Send an email if there is an error uploading
  echo "from your bestie, the pi" | mail -s "Pi photos not sending" birdboxer@example.com
fi

# Wait for 3 minutes before running again
sleep 180
#!/bin/bash

 TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')
  MODEL_NAME="version_na"
  FILE_NAME="${TIMESTAMP}_${MODEL_NAME}.jpg"
  sudo libcamera-still -o "${FILE_NAME}"
  rclone copy "/home/birdbox/${FILE_NAME}" "Birdbox v1:album/BEI: Backyard Experimental Implementation"
  if [ $? -eq 0 ]; then
    sudo rm "/home/birdbox/${FILE_NAME}"
  else
    echo "from your bestie, the pi" | mail -s "Pi photos not sending" birdboxers11124@gmail.com
  fi

  sleep 180
done

