# Drive API
A sample API for creating trips and adding route information

## Installation
Clone repo on local machine and step into directory and run

```
$ bundle install
```

## Tests
Basic model and Request specs have been implemented. Run tests using `rspec` command in root directory

## Reference
The API created is based on two models, Trip and Checkpoint.
Basically, a Trip is created with predetermined start and end locations, donated by [lat,lng] coordinates, this assumes that a starting "pickup" location must be given and the end location is left to business model needs. Once a Trip has been created, checkpoints can be created on this Trip where each checkpoint donates [lat,lng] with a timestamp. These checkpoints essentially form the route that the trip covers from start to end locations. Once a Trip status is updated from "ongoing" to "completed" no checkpoints can be further added and the trip status is frozen and cannot be switched to "ongoing" again.

The request specs can provide a more technical overview of the complete API implementation.

