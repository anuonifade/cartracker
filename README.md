# CARTRACKER

CarTracker is a car location tracking application. It enables creating car, adding location and viewing all car locations

## Technical Requirements

* Ruby version - 2.7.2
* Rails Version - 6.1.3.1
* System dependencies - Mac OS Big Sur
* Database - PostgreSQL 11.6
* Database creation - `rails db:create`
* How to run the test suite - `bundle exec rspec`

## Running the App

* Clone the App
* cd to cartracker
* Run `bundle install` to install all the required gems
* Run `rails db:create` to create both development and test databases
* Run `rails db:migrate` to run all the migration files
* Run `rails s` to run the app
* Run `rspec` to run all the api and model specs

## Using the app

### To create a new Car

POST <http://localhost:3000/api/v1/cars/>

* Request

```
  {
    "name": "Ford",
    "car_type": "Sedan",
    "car_model": "Ford E Class"
  }
```

* Response

```
  {
    "id": 2,
    "name": "Ford",
    "car_type": "Sedan",
    "car_model": "Ford E Class",
    "created_at": "2021-09-17T11:17:03.708Z",
    "updated_at": "2021-09-17T11:17:03.708Z"
  }
```

### Update car

PUT <http://localhost:3000/api/v1/cars/:id>

* Request

```
  {
    "name": "Benz",
  }
```

* Response Header 204

```
```

### View all cars

GET <http://localhost:3000/api/v1/cars/>

* Response

```
  [
    {
        "id": 1,
        "name": "Mercedes Benz",
        "car_type": "Saloon car",
        "car_model": "2009 E Class",
        "created_at": "2021-09-17T06:48:51.000Z",
        "updated_at": "2021-09-17T06:48:51.000Z"
    },
    {
        "id": 2,
        "name": "Benze",
        "car_type": "Sedan",
        "car_model": "Ford E Class",
        "created_at": "2021-09-17T11:17:03.708Z",
        "updated_at": "2021-09-17T11:24:42.427Z"
    }
  ]
```

### To register a car location

POST <http://localhost:3000/api/v1/cars/:car_id/locations>

* Request

```

  {
    "longitude": 11223.112,
    "latitude": 132344.221
  }
```

* Response

```
  {
    "id": 1,
    "longitude": 11223.112,
    "latitude": 132344.221,
    "car_id": 1,
    "created_at": "2021-09-17T06:49:43.483Z",
    "updated_at": "2021-09-17T06:49:43.483Z"
  }
```

### View all locations for a car

GET <http://localhost:3000/api/v1/cars/:car_id/locations>

```
  [
    {
      "id": 1,
      "longitude": 11223.112,
      "latitude": 132344.221,
      "car_id": 1,
      "created_at": "2021-09-17T06:49:43.483Z",
      "updated_at": "2021-09-17T06:49:43.483Z"
    }
  ]
```
