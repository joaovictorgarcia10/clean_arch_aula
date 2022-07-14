# Clean Arch Classroom

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

- Presentation
- Domain
- Data


<div align="center"> 
  <img src="https://github.com/joaovictorgarcia10/clean_arch_aula/blob/master/assets/images/git/data-flow.png" width="500" height="500"/>
</div>

## Preview


## Some References

- Clean Architecture: https://www.youtube.com/playlist?list=PLRpTFz5_57cvCYRhHUui2Bis-5Ybh78TS
- Firebase Integration: https://www.youtube.com/watch?v=14Ahr8S1psk&list=PLRpTFz5_57cvYvKja5Ex92aQ_HNADo4Oh&index=1&t=266s
- Geolocation: https://www.youtube.com/watch?v=TruOM8pB2_k&t=666s
- FlutterFire Documentation: https://firebase.flutter.dev/docs/overview/
- Clean Dart Documentation: https://github.com/Flutterando/Clean-Dart



