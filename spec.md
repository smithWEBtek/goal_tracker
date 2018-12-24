# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
      User has_many Goals | Category has_many Goals

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
      Goal belongs_to User | Task belongs_to Goal

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
      User has_many Tasks through Goals | User has_many Categories through Goals

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
      User has many Categories through Goals | Category has many Users through Goals

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
      goal.name, goal.summary

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
      User validates username, Category, Goal, and Task validates name

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
      Goal.most_recently_created, root_url

- [x] Include signup (how e.g. Devise)
      Users#create creates a user if username and password are valid (bcrypt)

- [x] Include login (how e.g. Devise)
      Sessions#create logs in user if username and password are valid (bcrypt)

- [x] Include logout (how e.g. Devise)
      Sessions#destroy logs out user

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
      OmniAuth#create creates a new user or logs in existing user based on Facebook credentials (omniauth & omniauth-facebook)

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
      users/1/tasks

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
      goals/1/tasks/new

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
      goals/1/tasks/new
      
Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
