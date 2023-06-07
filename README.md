# Little Esty Shop: https://little-shop-project.onrender.com/admin/merchants/
## Project planning tools
[ Table Diagram](https://dbdiagram.io/d/6477d230722eb774942cf7b2)
Github Project Board:  https://github.com/users/brad2412/projects/3/views/2

### Github links for all contributors
Jesse Sorman:   https://github.com/Jesse193
Amy Spears:     https://github.com/amspears007
Kailey Kaes:    https://github.com/kaileykaes
Bradley Milton: https://github.com/brad2412
Andy Weissman:  https://github.com/andyweissman6


# Discription of the project
- Can navigate pages, view merchants and items, csv data is accessible
- Utilized ActiveRecord joins, aggregates, and grouping to fulfill user story functionality
- Tried to Implement FactoryBot and Faker to support testing
- Create rake tasks to load data from CSVs into our database
- Completed the majority of user stories and all Unsplash API calls.

# Future Refactoring
- Make module for similar model methods
- Styling to optimize user experience.
- Create normalized test data across all test files
- Utilize more partials to DRY up view code

## Background and Description

"Little Esty Shop" is a group project that requires students to build a fictitious e-commerce platform where merchants and admins can manage inventory and fulfill customer invoices.

## Learning Goals
- Practice designing a normalized database schema and defining model relationships
- Utilize advanced routing techniques including namespacing to organize and group like functionality together.
- Utilize advanced active record techniques to perform complex database queries
- Practice consuming a public API while utilizing POROs as a way to apply OOP principles to organize code

## Requirements
- Must use Rails 7.0.x, Ruby 3.1.1
- Must use PostgreSQL
- All code must be tested via feature tests and model tests, respectively
- Must use GitHub branching, team code reviews via GitHub PR comments, and either GitHub Projects or a project management tool of your group's choice (Trello, Notion, etc.)
- Must include a thorough README to describe the project
   - README should include a basic description of the project, a summary of the work completed, and some ideas for a potential contributor to work on/refactor next. Also include the names and GitHub links of all student contributors on your project. 
- Must deploy completed code to the internet (using Heroku or Render)
- Continuous Integration / Continuous Deployment is not allowed
- Use of scaffolding is not allowed
- Any gems added to the project must be approved by an instructor
  - Pre-approved gems are `capybara, pry, faker, factory_bot_rails, orderly, simplecov, shoulda-matchers, launchy`

## Setup

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## Phases

1. [Database Setup](./doc/db_setup.md)
1. [User Stories](./doc/user_stories.md)
1. [Extensions](./doc/extensions.md)
1. [Evaluation](./doc/evaluation.md)
