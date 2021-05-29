BucketLister is a motivational Ruby on Rails app where users set goals and achieve them.

Here is how it works: Users set their goals (everybody can see them) and comment on other users' goals thus motivating them. A user can add/edit/delete their goals that they want to achieve (hence BucketLister) and add/edit/delete comments under other users' goals. They must log in to be able to do any of these and cannot add/edit/delete other users' goals and comments.

Specs:

 * Using Ruby on Rails for the project
 * Include at least one has_many relationship (User has_many Goals, User has_many Comments, Goal has_many Comments, Category has_many Goals)
 * Include at least one belongs_to relationship (Goal belongs_to User, Goal belongs_to Category, Comment belongs_to User, Comment belongs_to Category)
 * Include at least two has_many through relationships (User has_many Categories through Goals, Category has_many Users through Goals, Category has_many Comments through Goals)
 * Include at least one many-to-many relationship (User has_many Categories through Goals, Category has_many Users through Goals)
 The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
 * Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
 * Include a class level ActiveRecord scope method (in app statistics)
 * Include signup
 * Include login
 * Include logout
 * Include third party signup/login (OmniAuth through Facebook)
 Include nested resource show or index (URL e.g. users/2/recipes)
 Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
 * Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:

 * The application is pretty DRY
 * Limited logic in controllers
 * Views use helper methods if appropriate
 * Views use partials if appropriate