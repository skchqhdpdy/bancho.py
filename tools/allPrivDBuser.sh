source .env #.env에서 변수 읽기
CONTAINER_NAME=$(docker ps --filter "ancestor=mysql" --format "{{.Names}}") #MySQL 컨테이너 이름 자동으로 찾기

if [ -z "$CONTAINER_NAME" ]; then
  echo "[ERROR] MySQL 컨테이너를 찾을 수 없습니다."
  exit
fi

docker exec -i $CONTAINER_NAME mysql -u root -p$DB_ROOT_PASS <<EOF
GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

echo "[INFO] $DB_USER 에게 권한 부여 완료."