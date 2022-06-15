# Clean Arch Class

A simple Flutter project, structured following the Clean Architecture and Clean Code principles.


## Features

- [x] Internacionalization
- [x] Sign in
- [x] Sign up
- [x] Http Requests to search an address
- [x] Address CRUD
- [x] Geolocation
- [x] Redirect to Google Maps and shows the best route from your current location to the selected address      

  
## Organization

#### /modules

The main features of the application, here the principle of modularization was applied, so that each module implements everything necessary for its own operation.

#### /shared

Here we'll have the fundamental functionality to all the modules, implementations like generic errors and some utilities that can be acessed to the entire application.
