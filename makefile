NODECHROME=5
NODEFIREFOX=1

.PHONY: default up down start stop scale

default: up

up:
    docker-compose up -d
    docker-compose scale nodechrome=$(NODECHROME) nodefirefox=$(NODEFIREFOX)

down:
    docker-compose down

start:
    docker-compose start

stop:
    docker-compose stop

# Have to restart hub due to it trying to connect to destroyed nodes
scale:
    docker-compose scale nodechrome=$(NODECHROME) nodefirefox=$(NODEFIREFOX)
    docker restart selenium_hub