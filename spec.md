# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
        Used ActiveRecord CRUD commands to interact with database
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
        Models: Slug, Amount, Ingredient, Recipe, User
- [x] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts)
        User has many Recipes
- [x] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User)
        Recipe belongs to User
        Amount belongs to Recipe
        Amount belongs to Ingredient
- [x] Include user accounts
        Users can sign up for a new account and log in to an existing account
- [x] Ensure that users can't modify content created by other users
        If a user tries to edit another users recipe they will be returned to their own show page.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
        A recipe can be created, viewed, edited and deleted by its user
- [x] Include user input validations
        A new user cannot sign up with an existing username. When a user logs in their username and password are checked against the database.
- [ ] Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
