#this is the final final ONLY file we now use since we downgraded pis!
#!/bin/bash

 TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')
  MODEL_NAME="version_na"
  FILE_NAME="${TIMESTAMP}_${MODEL_NAME}.jpg"
  sudo libcamera-still -o "${FILE_NAME}"
  rclone copy "/home/birdbox/${FILE_NAME}" "Birdbox v1:album/Birdbox Version 1 >
  if [ $? -eq 0 ]; then
    sudo rm "/home/birdbox/${FILE_NAME}"
  else
    echo "from your bestie, the pi" | mail -s "Pi photos not sending" birdboxer>
  fi

  sleep 180
done
