# WorkFoodBalance
YB Hackathon 2021

Start our mobile app by scanning the following QR Code or go to https://elcademo.azurewebsites.net/
:tada:

<img src="qr-code.png" width="300" />


## Dev
Start local server

    docker-compose build
    docker-compose run --rm --service-ports ruby_dev


## Prod
Build

    parcel build index.html
