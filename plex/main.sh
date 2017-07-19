#!/bin/bash

echo -ne 'Copying Configs:                                                  (0%)\r'

mkdir -p ~/radarr/config/
cp -n $PWD/radarr/config/nzbdrone.db ~/radarr/config/

echo -ne 'Copying Configs:                 ##########                       (33%)\r'

mkdir -p ~/sonarr/config/
cp -n $PWD/sonarr/config/nzbdrone.db ~/sonarr/config/

echo -ne 'Copying Configs:                 ####################             (66%)\r'

mkdir -p ~/requests/config/
cp -n $PWD/requests/config/Ombi.sqlite ~/requests/config/

echo -ne 'Copying Configs:                 ##############################   (100%)\r'
echo -ne '\n'

docker-compose up -d 2> /dev/null

echo -ne 'Waiting for containers to start:                                  (0%)\r'
sleep 6
echo -ne 'Waiting for containers to start: ###                              (10%)\r'
sleep 6
echo -ne 'Waiting for containers to start: ######                           (20%)\r'
sleep 6
echo -ne 'Waiting for containers to start: #########                        (30%)\r'
sleep 6
echo -ne 'Waiting for containers to start: ############                     (40%)\r'
sleep 6
echo -ne 'Waiting for containers to start: ###############                  (50%)\r'
sleep 6
echo -ne 'Waiting for containers to start: ##################               (60%)\r'
sleep 6
echo -ne 'Waiting for containers to start: #####################            (70%)\r'
sleep 6
echo -ne 'Waiting for containers to start: ########################         (80%)\r'
sleep 6
echo -ne 'Waiting for containers to start: ###########################      (90%)\r'
sleep 6
echo -ne 'Waiting for containers to start: ##############################   (100%)\r'
echo -ne '\n'

curl -s 'localhost:8181/welcome' > /dev/null
echo -ne 'Initialising configs:                                             (0%)\r'
sleep 1s
echo -ne 'Initialising configs:            ###############                  (50%)\r'
sleep 1s
echo -ne 'Initialising configs:            ##############################   (100%)\r'
echo -ne '\n'


echo -ne 'Updating configs:                                                 (0%)\r'   

docker stop organizr > /dev/null
sleep 1s
cp $PWD/organizr/config/default ~/organizr/config/nginx/site-confs/
docker start organizr > /dev/null

echo -ne 'Updating configs:                ##############################   (100%)\r'
echo -ne '\n'

echo "Setup Finished!"
