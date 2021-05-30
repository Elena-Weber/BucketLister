Specs:

 * Using Ruby on Rails for the project
 * Include at least one has_many relationship (User has_many Goals, User has_many Comments, Goal has_many Comments, Category has_many Goals)
 * Include at least one belongs_to relationship (Goal belongs_to User, Goal belongs_to Category, Comment belongs_to User, Comment belongs_to Category)
 * Include at least two has_many through relationships (User has_many Categories through Goals, Category has_many Users through Goals, Category has_many Comments through Goals)
 * Include at least one many-to-many relationship (User has_many Categories through Goals, Category has_many Users through Goals)
 * The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user
 * Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
 * Include a class level ActiveRecord scope method
 * Include signup
 * Include login
 * Include logout
 * Include third party signup/login (OmniAuth through Facebook)
 * Include nested resource show or index
 * Include nested resource "new" form
 * Include form display of validation errors
 * Implement Search function

Confirm:

 * The application is pretty DRY
 * Limited logic in controllers
 * Views use helper methods if appropriate
 * Views use partials if appropriate