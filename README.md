<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/Qoosim/Bookings_API">
    <img src="https://raw.githubusercontent.com/euqueme/toy-app/master/app/assets/images/mLogo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Bookings API Final Capstone project</h3>

  <p align="center">
    This project is part of the Microverse Ruby on Rails curriculum!
    <br />
    <a href="https://github.com/Qoosim/Bookings_API"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/Qoosim/Bookings_API/issues">Report Bug</a>
    |
    <a href="https://github.com/Bookings/Bookings_API/issues">Request Feature</a>
  </p>
</p>

<!-- About the Project -->
## 📽️ About The Project
![screenshot](app/assets/images/list_of_bikes.jpeg)

This is a bookings API which is based on an app to book an appointment to try a bike by a logged in user. Only the admin users can manage the creation, updating and destroying bikes.

### 🥡 Get Started
To get a local copy up and running follow the steps below.

### 🔰 Prerequisites

- Ruby: >= 2.6.5
- Rails: >= 6.0.3.2

### 🛠️ Setup
Install all the gems with 👇
```
  $ bundle install or bundle
```
Setup the database with 👇
```
  $ rails db:create
  $ rails db:migrate
```

### 🛏️ Usage
Start your server with 👇
```
  $ rails server or rails s
```

Install the HTTP client of your preference to use it. You can get [postman](https://www.postman.com/) installed on your system or use [httpie](https://httpie.org/)

#### ®️ Signup

Below command will create a new user in the database

```
$ http :3000/signup name=Kenny email=kenny@gmail.com password=password password_confirmation=password
```
![screenshot](app/assets/images/signup.jpeg)

#### 📲 Login

Registered users login with their email and password

```
$ http :3000/auth/login email=kenny@gmail.com password=password
```
![screenshot](app/assets/images/login.jpeg)

#### 🔧 Create Bike
To create a new bike, a user needs to be made an admin. 
To do that, open ``` rails console ``` and update the user to be made an admin like 👇
```
  $ rails c
  > made_admin = User.find_by(email: 'kenny@gmail.com')
  > made_admin.update(admin: true)
  > exit
```
![screenshot](app/assets/images/admin.jpeg)

You then login and copy the auth_token generated for you somewhere

```
$ http :3000/auth/login email=kenny@gmail.com password=password
```
![screenshot](app/assets/images/logged_in_user.jpeg)

Now you can create a new bike with your auth_token you copied(paste the auth_token in the Authorization header)

```
$ http post :3000/v1/bikes model="Vespa 350" color=black price=158000 weight=780kg engine_capacity=920cc user_id=3 \
Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1OTk0MzAwOTl9.qSmHFv4rZmAIyKNfulp6KXoBgMenNn71nPvstDcYtNY'
```

![screenshot](app/assets/images/new_bike.jpeg)

#### 📇 Bikes Index
To see the list of all the bikes, type below command. Needs no login
```
$ http :3000/v1/bikes
```

![screenshot](app/assets/images/available_bikes.jpeg)

#### 🚿 Bikes show
Below command displays a specific bike. No authentication needed

```
$ http :3000/v1/bikes/1
```

![screenshot](app/assets/images/show_bike.jpeg)

##### The Bookings API documentation was built using raddocs

### 🔬 Run tests
To run all the test cases at a go, run 👇
```
$ bundle exec rspec
```

To run only a test, run 👇
```
$ bundle exec rspec spec/folder/file
```

To update the raddocs documentation run 👇
```
$ rake docs:generate
```
- then type this url ```localhost:3000/api_docs``` in your browser to get to the raddocs documentation

### 🛠️ Built with
- The project was built using below technologies 👇
- Ruby 2.7.1
- Rails 6.0.3.2
- Rspec
- rspec_api_documentation
- raddocs
- Rubocop
- Stickler

## 👨‍💻 Author
**Qoosim AbdulGhaniyy**

- Github: [@Qoosim](https://github.com/Qoosim)
- Twitter: [@qoosim_ayinde](https://twitter.com/qoosim_ayinde)
- Linkedin: [qoosim](https://www.linkedin.com/in/qoosim)

## 🔊 Contributions, Issues & Forking
Contributions, issues and feature requests are welcome!
- Feel free to check for [issues](https://github.com/Qoosim/Bookings_API/issues) page
- For modification or improvement [Fork it](https://github.com/Qoosim/Bookings_API/fork)

## 🤝 Show Your Support

Give a ⭐️ if you like this project!

## 👏 Acknowledgements
- [Microverse](https://www.microverse.org/)
- [Heroku](https://dashboard.heroku.com/apps)
- [Austin Kabiru](https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one)
- [A D Vishnu Prasad](https://advishnuprasad.com/blog/2016/02/07/api-docs-using-rspecs/)
- [Versioning a Rails API](https://chriskottom.com/blog/2017/04/versioning-a-rails-api/)

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.
