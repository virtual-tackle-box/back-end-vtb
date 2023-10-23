![Top Language](https://img.shields.io/github/languages/top/virtual-tackle-box/back-end-vtb?color=red)
![PRs Closed](https://img.shields.io/github/issues-pr-closed/virtual-tackle-box/back-end-vtb)
![RSpec Version](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![Simplecov Version](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov)
![All Contributors](https://img.shields.io/badge/contributors-2-orange.svg?style=flat)
![CircleCI Build Status](https://img.shields.io/circleci/build/github/virtual-tackle-box/back-end-vtb)

# <p align="center"> Virtual Tackle Box </p>

Looking to improve your fishing experience? Check out Virtual Tackle Box. Our app is designed with a React-Native front end and a Rails API back end to give you a seamless user experience.

Need to save the locations of your go-to fishing spots? We have a mapping feature for that. Want to document your catches? You can easily upload photos directly in the app. Keep track of your most effective lures with our digital log, so you always know what gear to use. Virtual Tackle Box transforms your fishing activities into a well-documented digital history, giving you valuable insights for future trips. Give it a try and elevate your next fishing outing.

## RESTful Endpoints

<details close>

### Create a User


```http
POST /api/v1/users
```

<details close>
<summary>  Details </summary>
<br>

  Parameters: <br>
```
CONTENT_TYPE=application/json
```

| Code | Description |
| :--- | :--- |
| 201 | Created |

Example Value:

</details>

---

### Get all Lures for a User

```http
GET /api/v1/users/:id/lures
```
<details close>
<summary>  Details </summary>
<br>
  
Parameters: <br>
```
No Parameters
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Example Value:

```json
    {
      "data": [
        {
          "id": "1",
          "type": "user",
          "attributes": {
          "email": "test2@example.com",
          "catches": [],
          "lures": [],
          "phone_number": "+17272787155"
        },
        "relationships": {}
      }
    }
  ]
}
```

</details>

---

### Get a Single Lure for a User

```http
GET /api/v1/users/:id/lures/:id
```
<details close>
<summary>  Details </summary>
<br>
    
</details>

---

### Create a User's Lure

```http
POST /api/v1/users/:id/lures
```
<details close>
<summary>  Details </summary>
<br>
    
</details>

---

### Update a User's Lure

```http
PATCH /api/v1/users/:id/lures/:id 
```
<details close>
<summary>  Details </summary>
<br>

</details>

---

### Delete a User's Lure

```http
DELETE /api/v1/users/:id/lures/:id 
```
<details close>
<summary>  Details </summary>
<br>

Parameters: <br>
```
CONTENT_TYPE=application/json
```

| Code | Description |
| :--- | :--- |
| 204 | No Content |

Example Value:

```json
""
```

</details>

---

###Create a Catch

```http
POST /api/v1/users/:id/catches 
```

<details close>
<summary>  Details </summary>
<br>

  Parameters: <br>
```
CONTENT_TYPE=application/json
```

| Code | Description |
| :--- | :--- |
| 201 | Created |

Example Value:
```json
{
  "data": {
    "id": "1",
    "type": "user",
    "attributes": {
      "email": "test@example.com",
      "catches": [
        {
          "id": 1,
          "species": "Largemouth Bass",
          "weight": 8,
          "length": 13,
          "user_id": 1,
          "created_at": "2023-10-22T03:03:10.425Z",
          "updated_at": "2023-10-22T03:03:10.425Z",
          "spot_name": "Josh’s Spot",
          "latitude": 46.805844423621096,
          "longitude": -95.84727562996598,
          "lure": "Frog",
          "cloudinary_urls": [
          "http://res.cloudinary.com/dw48ifzg4/image/upload/v1697943780/ub8iosvp5tog05zfc0t0.jpg"
          ]
        }
    }
}
```

</details>

---

## Status Codes

Virtual Tackle Box returns the following status codes in its API:

| Status Code | Description |
| :--- | :--- |
| 200 | `OK` |
| 201 | `CREATED` |
| 204 | `NO CONTENT` |
| 400 | `BAD REQUEST` |
| 404 | `NOT FOUND` |
| 422 | `UNPROCESSABLE ENTITY`
| 500 | `INTERNAL SERVER ERROR` |

## Prerequisites
Running this project requires:
- Rails 7.0.8
- ruby 3.2.2

## Installation

1. Fork and clone this repository
2. `cd` into the root directiory
3. `bundle install`
4. `rails db:{drop,create,migrate,seed}`
5. Run the test suite with `bundle exec rspec`
6. Start the local server by running `rails s`
7. Visit the app on `localhost:3000` in your web browser

## Database Schema
<img width="1045" alt="Screenshot 2023-10-22 at 3 10 28 PM" src="https://github.com/virtual-tackle-box/back-end-vtb/assets/64923238/400d2627-ec39-426c-9bb3-2c8893968acc">


## Contributors

<b>Wil Fady</b> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GitHub: <a href="https://github.com/fadwil">fadwil</a> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LinkedIn: <a href="https://www.linkedin.com/in/wilfady/">wilfady</a> <br>

<b>Daniel Gallagher</b> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GitHub: <a href="https://github.com/Daniel-Gallagher92">Daniel-Gallagher92</a> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LinkedIn: <a href="https://www.linkedin.com/in/daniel-ryan-gallagher/">Daniel Gallagher</a> <br>
