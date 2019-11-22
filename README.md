## FoodHub
### Final Project with CraftAcademy

The application was created in November 2019, as a final project during the last 2 weeks of the Craft Academy [Full Stack Web Developer Bootcamp](https://craftacademy.se/english/). 

---
## Authors
[Becca Burns](https://github.com/beccaburns)  
[Clarissa Liljander](https://github.com/clalil)  
[Miyesier Kaerman](https://github.com/miyeaier)  
[Sverrir Steindorsson](https://github.com/shsteindorsson)  
[Yasmine Ezequiel](https://github.com/yasmineezequiel)  

---
## Deloyment URL
This application consists of a front-end Client and a back-end API.  
[Front-end Deployment](https://foodhub.recipes/) and [Front-end GitHub](https://github.com/CraftAcademy/foodhub-client)  
[Back-end Deployment](https://.herokuapp.com/) and [Back-end GitHub](https://github.com/CraftAcademy/foodhub-api)

---
## User Stories & Project Management
Our team worked agile over the two week timeline using 7 day sprints beginning with a two-day design sprint. For more information, please read our user stories and our features on our [Pivotal Tracker board](https://www.pivotaltracker.com/n/projects/2417177). 

---
## Getting Started
If you want to try out the code for yourself on your local machine:
Fork the repo, clone it down, make sure you run `yarn install`. 

### Built with the following technologies
Back-end API:
- API with [Ruby](https://www.ruby-lang.org/en/), version 2.5.1
- API with[Ruby on Rails](https://rubyonrails.org/), verion 6.0.1
- API is using [RSpec](https://rspec.info/) for automated testing

Front-end Client:
- Client with [React](https://rspec.info/)
- Client is using [Cypress](https://www.cypress.io/) for automated testing
- User generated images are stored on [Amazon webstorage](https://aws.amazon.com/)
- Client is styled using [Semantic UI React](https://react.semantic-ui.com/) and CSS.

---
### Test Coverage and Continuous Integration (CI)
[Coveralls](https://coveralls.io/)

Continuous integration is handled using [Semaphore](https://semaphoreci.com/)   

Front-end Client tests can be found in the folder `cypress` and it's sub-folders. The front-end is connected to our back-end API. You can test by forking the repository as well. Then change the url from our Heroku to `http://localhost:3000`

To run a test (you must have yarn installed), run `yarn cy:open` in your terminal.

---
## Acknowledgements
- [Rails Guides](https://guides.rubyonrails.org/index.html)
- [React Docs](https://reactjs.org/docs/getting-started.html)
- [StackOverflow](https://stackoverflow.com/)
- [Image sources](https://stock.adobe.com/)
- [Pexels](https://www.pexels.com/)

---
## Special Thanks
To our coaches and staff at [Craft Academy](https://craftacademy.se/)!

## License
This project is under the [MIT](https://opensource.org/licenses/MIT)-license