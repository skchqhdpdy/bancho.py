sudo rm -r /swapfile
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon --show
free -h
#echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab #부팅 시 스왑 자동 활성화 설정