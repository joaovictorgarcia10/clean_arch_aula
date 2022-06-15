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

### /modules

The main features of the application, here the principle of modularization was applied, so that each module implements everything necessary for its own operation.

### /shared

Here we'll have the fundamental functionality to all the modules, implementations like shared features, generic errors and some utilities that can be acessed to the entire application.

## Layers

Each module are divided in some layers, so that each layer has its responsibility, following the Clean Architecture standard.

- Domain
- Data
- Presentation

<p float="center"> 
 <img src="https://github.com/joaovictorgarcia10/clean_arch_aula/blob/master/assets/images/data-flow.png" width="415" height="600"/>
</p>
