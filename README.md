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

### Get all Lures for a User

```http
GET /api/v1/users/:id/lures
```

### Get a Single Lure for a User

```http
GET /api/v1/users/:id/lures/:id
```

### Create a User's Lure

```http
POST /api/v1/users/:id/lures
```

### Update a User's Lure

```http
PATCH /api/v1/users/:id/lures/:id 
```

### Delete a User's Lure

```http
DELETE /api/v1/users/:id/lures/:id 
```
</details>

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
