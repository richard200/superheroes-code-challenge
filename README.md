# Superheroes
Superheroes is a basic API built with ruby on rails and deployed using PostgreSql that implements associations.
The application has been built with the MVC design pattern.
## Prerequisites
In order to use this repository you will need the following:
- Operating System **(Windows `10+`, Linux `3.8+`, or MacOS X `10.7+`)**
- RAM >= 4GB
- Free Space >= 2GB
## Built With
This application has been built with the following tools:
![ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![sqlite](https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite&logoColor=white)
![ruby on rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
- **Ruby `v2.7.+`**
- **SQlite3 `v1.6`**
- **ActiveRecord `v7.0.4`**
- **Rake `v13.0.6`**
- **Puma `v6.1`**
- **rerun `v0.14`**
## Setup
You can setup this repository by following this manual
1. Clone the repository
    ```{shell}
   git clone git@github.com:richard200/superheroes-code-challenge.git
   ```
2. Ensure the ruby gems are setup in your machine
    ```{shell}
   bundle install
   ```
3. Perform any pending database migrations
   ```{shell}
   rails db:migrate
   ```
4. Seed data into the database
   ```{shell}
   rails db:seed
   ```
5. Run the application/start server
    ```{shell}
    rails s
    ```
5. Open the application from your browser
    ```
   http://localhost:3000
   ```
## Application
This application is a simple web API that allows users to:
- Create a Hero that has powers.
- View all Heroes and their powers.
- Filter heroes by id.
- Update a hero.
#### Hero table
| COLUMN      | DATA TYPE                                       | DESCRIPTION                         |
|-------------|-------------------------------------------------|-------------------------------------|
| id          | Integer                                         | Unique identifier.                  |
| name        | String                                          | The name of the hero.               |
| super_name  | String                                          | The hero's super name               |
| createdAt   | Date                                            | The date the hero was created.      |
| updatedAt   | Date                                            | The date the hero was updated.      |

#### Powers table
| COLUMN      | DATA TYPE                                       | DESCRIPTION                         |
|-------------|-------------------------------------------------|-------------------------------------|
| id          | Integer                                         | Unique identifier.                  |
| name        | String                                          | The name of the power.              |
| description | String                                          | The description of the power.       |
| createdAt   | Date                                            | The date the power was created      |
| updatedAt   | Date                                            | The date the power was updated      |

#### Hero_powers table
| COLUMN        | DATA TYPE                                       | DESCRIPTION                         |
|-------------  |-------------------------------------------------|-------------------------------------|
| id            | Integer                                         | Unique identifier.                  |
| strength      | String                                          | The hero's strenght.                |
| power_id      | Integer                                         | The FK of the powers.               |
| hero_id       | Integer                                         | The FK of the hero.                 |
| createdAt     | Date                                            | The date the association was created|
| updatedAt     | Date                                            | The date the association was updated|

### ROUTES
1. GET /heros
Return JSON data in the format below:

[  

{ "id": 1, "name": "Kamala Khan", "super_name": "Ms. Marvel" },  

{ "id": 2, "name": "Doreen Green", "super_name": "Squirrel Girl" },  

{ "id": 3, "name": "Gwen Stacy", "super_name": "Spider-Gwen" }

]
   ```
2. GET /heros/:id
If the `Hero` exists, return JSON data in the format below:


{
  "id": 1,
  "name": "Kamala Khan",
  "super_name": "Ms. Marvel",
  "powers": [
    {
      "id": 1,
      "name": "super strength",
      "description": "gives the wielder super-human strengths"
    },
    {
      "id": 2,
      "name": "flight",
      "description": "gives the wielder the ability to fly through the skies at supersonic speed"
    }
  ]
}


If the `Hero` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

{   "error": "Hero not found" }

   ```
3. GET /powers
Return JSON data in the format below:


[
  {
    "id": 1,
    "name": "super strength",
    "description": "gives the wielder super-human strengths"
  },
  {
    "id": 1,
    "name": "flight",
    "description": "gives the wielder the ability to fly through the skies at supersonic speed"
  }
]
   ```
4. GET /powers/:id
If the `Power` exists, return JSON data in the format below:

```
{
  "id": 1,
  "name": "super strength",
  "description": "gives the wielder super-human strengths"
}
```

If the `Power` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```
{
  "error": "Power not found"
}

5.  PATCH /powers/:id
This route should update an existing `Power`. It should accept an object with
the following properties in the body of the request:

```
{
  "description": "Updated description"
}
```

If the `Power` exists and is updated successfully (passes validations), update
its description and return JSON data in the format below:

```
{
  "id": 1,
  "name": "super strength",
  "description": "Updated description"
}
```

If the `Power` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```
{
  "error": "Power not found"
}
```

If the `Power` is **not** updated successfully (does not pass validations),
return the following JSON data, along with the appropriate HTTP status code:

```
{
  "errors": ["validation errors"]
}
```
6.  POST /hero_powers
This route should create a new `HeroPower` that is associated with an
existing `Power` and `Hero`. It should accept an object with the following
properties in the body of the request:

```
{
  "strength": "Average",
  "power_id": 1,
  "hero_id": 3
}
```

If the `HeroPower` is created successfully, send back a response with the data
related to the `Hero`:

```
{
  "id": 1,
  "name": "Kamala Khan",
  "super_name": "Ms. Marvel",
  "powers": [
    {
      "id": 1,
      "name": "super strength",
      "description": "gives the wielder super-human strengths"
    },
    {
      "id": 2,
      "name": "flight",
      "description": "gives the wielder the ability to fly through the skies at supersonic speed"
    }
  ]
}
```

If the `HeroPower` is **not** created successfully, return the following
JSON data, along with the appropriate HTTP status code:

```
{
  "errors": ["validation errors"]
}
```

## LICENSE
This repository is distributed under the ISC License
```

## AUTHOR
This repository is maintained by:
- [Ian Ayub](https://github.com/richard200)