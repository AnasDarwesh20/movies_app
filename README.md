# movies

## About the app
This is movies suggestion app show the new movies and movies ratings .

It is includes : 
- New movies.
- Top rated movies.
- Popular movies.

You can see this 3 categories in the start screen , the recent on the top , then top rated and popular movies . 

## How does it work 
This application is developed using Flutter framework , clean architecture , bloc as a state management and Dio helper for APIs . 

You can see 3 main folders:

1- Data folder: 

  It contains :
  - the datasource to fetch the data .
  -  models to organize the data .
  -   repository to store data and send it to the another side , the domain folder . 

2- Domain folder: 

  It contains :
  - entities : it expressess the entities used in this app , like movie entity that contain all informations about a movie .
  -  repository : used to send data to usecases .
  -   usecases : it is used to order the application operations , like get movie data operation .

3- presentation folder: 

  It contains all app UI .
  - components : used in the UI.
  -  controller : it is the state management used in this app , bloc state management .
  -   screens : the all app screens . 

there is another folder called core , It contains the shared components in app , like classes , widgets and varibles .  
  
