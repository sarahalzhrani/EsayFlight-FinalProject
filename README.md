# FinalProject

# EsayFlight


## Description

***EsayFlight*** 
It is a App that enables the  user with special needs to see the departing flights, follow the status of the flight before its departure, identify the time of the flight, the location of the gate, and determine the service locations. And the user can ask for help before arriving at the airport,also they can ask for help to search for thier lost lauggage ..



## User Stories

- ** register:** As an user I can register up in the App so that I can start useing the App
- ** Login:** As a user I can login to the App so that I can log my exit points
- ** Logout:** As a user I can logout from the App so no one else can use it
- ** Home:** As a user I can see multiple choices so that I can choose what i want
- ** Flight:** As a user I can add flight so that I can  see my selected flight only
- ** my flight:** As a user I can see my flight only so that I can view the departing, status of flights
- ** logs flight:** As a user I can see my old flight 
- ** service:** As a user I  can see the service that found in airport so that i can kno each place 
- ** Ask for help:** As a user I can send my order of helping so that i can easily get what i need 
- ** my order:** As user I can see my order of help and I can delete it
- ** lost luggage:** As a user I can search of my lost luggage and add my contact number so that they could tell me when they found it
- ** Rent car:**  As user I can rent a car from the office rent a car before i reach so that I can save my time when i arrive
- ** Tell us your Experience:** As user I can connect with airport and send my suggestion or complaining
- ** Suggest For You:** As user I can see suggestion app for planning my vacation
- ** Maps:** As user I can see  ican see airport maps and many location in it 
- ** Adevertisement:**  As user I can see the add that many good for me so that i can choose one of them


## Backlog

User profile:
- Can login and sign up
- See flight Schedule
- Add from flight Schedule
- Add weather widget
- Add geolocation
- See airport service
- Ask for help 
- Serch for lost luggauge
- Rent car
- See airport service in location
- Connect with airport
- See airport adds

# Client / Frontend

## React Router Routes (React App)

| Component            | Permissions                | Behavior                                                                                             |
| -------------------- | -------------------------- | -----------------------------------------------------------------------------------------------------                                         
| lunchScreen          | public `<Route>`           | login and register page                                                                              |
| registerPage         | user only `<AnonRoute>`    | Signup form, link to login, navigate to homepage after signup                                        |
| LoginPage            | user only `<AnonRoute>`    | Login form, link to signup, navigate to homepage after login                                         |
| HomePage             | user only `<PrivateRoute>` | Shows all option points in  Home in App                                                              |
| Flight               | user only `<PrivateRoute>` | link to show information flight, navigate to my flight page after pressed on flight butoon           |
| Add flight           | user only `<PrivateRoute>` | link to show flight tables, navigate to  all flight page after pressed on add flight butoon          |
| Selsct one flight    | user only `<PrivateRoute>` | link to selsct one flight, navigate to  all  my flight page after pressed on add select flight butoon|
| Scanparacode         | user only `<PrivateRoute>` | link to scan parcode , navigate to  all bokkingflight page after pressed on add scan                 |
| Services             | user only `<PrivateRoute>  | link to show Services , navigate to  all services page after pressed on Services                     |
| Ask for help         | user only `<PrivateRoute>  | link to Ask for help , navigate to  Askfor help page  after pressed on  Askforhelp                   |
| lost luggage         | user only `<PrivateRoute>  | link to  lost luggage  , navigate to  lost luggage page  after pressed on lost luggage               |
| New request          | user only `<PrivateRoute>  | link to new request of lost luggage , navigate to  lost luggage page  after pressed on new           |
| Rent car             | user only `<PrivateRoute>  | link to new rent car office , navigate to  rent car page  after pressed on rent car                  |
| Tellusyourexperience | user only `<PrivateRoute>  | link to Tellusyourexperience , navigate to  Tellusyourexperience page  after pressed on Tellusyourexperience|
| Maps                 | user only `<PrivateRoute>` | link to show airport location , navigate to my maps page after pressed on maps           |
| profile              | user only `<PrivateRoute>` | link to show lelp reqest , navigate to my profile page after pressed on profile          |
| Advertisment          | user only `<PrivateRoute>`| link to show Advertisment, navigate to Advertisment page after pressed on add Advertisment          |

## Components

- lunchScreen 
- login and register page
- HomePage(contains more than page)
- MapsPage
- ProfilePage
- AdvertisementPage
- ExitPointPage
-Tabbar
- Navbar

## Services

- Auth Service
  - auth.login(user)
  - auth.signup(user)
  - auth.logout()
- Exit Point Service
  - exitPoint.list()
  - exitPoint.detail(id)
  - exitPoint.add(id)
  - exitPoint.delete(id)
- User Service
  - user.detail(id)



# Server / Backend

## Models

User model

```
{
  user: {type: String, required: true, unique: true},
  email: {type: String, required: true, unique: true},
  password: {type: String, required: true},
  favorites: [{type: Schema.Types.ObjectId,ref:'Exit'}]
  userAgreement: {type: boolean, required: true, default: false}
}
```

Exit model

```
 {
   name: {type: String, required: true},
   img: {type: String},
   aproachLat: {type: Number, required: true}
   aproachLong: {type: Number, required: true}
   aproachDescription: {type: String}
   exitLat: {type: Number, required: true}
   exitLong: {type: Number, required: true}
   exitDescription: {type: String}
   landiZoneLat: {type: Number, required: true}
   landingZoneLong: {type: Number, required: true}
   landingZoneDescription: {type: String}
   creator: {type: Schema.Types.ObjectId,ref:'User'}
   altitud: {type: number}
   
 }
```



## Links

### Trello/Kanban

[Link to your trello board](https://trello.com/b/PBqtkUFX/curasan) or picture of your physical board

### Git

The url to your repository and to your deployed project

[Client repository Link](https://github.com/screeeen/project-client)

[Server repository Link](https://github.com/screeeen/project-server)

[Deployed App Link](http://heroku.com/)

### Slides

The url to your presentation slides

[Slides Link](http://slides.com/)

Wireframe

The url to your presentation slides

[Figma Link](http://www.figma.com/file/GNvDVBD1NPTydU2PJy4DDM/dataBASE?node-id=0%3A88)

https://www.figma.com/file/GNvDVBD1NPTydU2PJy4DDM/dataBASE?node-id=0%3A88

