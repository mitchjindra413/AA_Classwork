# 99 Cats II: Auth

**[Live Demo!][live-demo]**

Today you will add users and login capabilities to your 99Cats application.

## Learning Goals

- Be able to create a user authentication system
  - Know the user model's methods that are required for authentication
    - `reset_session_token`, `password=`, `is_password?`, `find_by_credentials`
  - Know what it means to create and destroy a session
  - Know how cookies and sessions interact in a `current_user` method
  - Know how to access the current user from within a view

## Setup

This is Part II of yesterday's project. Instead of using yesterday's code,
however, clone the starter repo (i.e., yesterday's solution) from the `Download
Project` button below and use it for your work today. This will ensure that 1)
everyone has a complete Part I to start from; 2) you and your partner have the
same codebase; and 3) you don't have to spend time today debugging code
from yesterday.

Since you will be implementing authentication, you need the `bcrypt` gem. Add it
to the top level of your __Gemfile__ and `bundle install`.

Don't forget to create your db!

## Phase IV: Users

You will start today's work by building user functionality.

### Add a `User` model

- Store the `User`'s `username` and `password_digest`.
  - Make the `username` unique.
  - As ever, toss on necessary constraints and validations.
- Also create a `session_token` column.
  - Require the session token to be present. This means you'll need a
    `before_validation` callback to set the token if it's not already set.
  - Add a unique index on `session_token`; no two users should share a session
    token.
- Write a `#password=(password)` setter method that writes the `password_digest`
  attribute with the hash of the given password.
- Write a `#is_password?(password)` method that verifies a password.
- Write a `::find_by_credentials(username, password)` method that returns the
  user with the given name if the password is correct.
- Write a private `#generate_unique_session_token` method to generate a unique
  token using `SecureRandom`.
- Write yourself a `#reset_session_token!` method. Go on, you're worth it!
- Write a private `#ensure_session_token` method that supplies a session token
  if the user does not have one.

### `UsersController`, `SessionsController`

To allow a user to sign up, write a `UsersController` with `new` and `create`
actions. Add appropriate routes.

Build a `SessionsController`:

- Add a singular `:session` resource in __routes.rb__
  - A visitor to your site implicitly has their own session (it's stored in
    their browser), so there's no need to create routes for different sessions.
    Only `new`, `create`, and `destroy` are needed.
- In `SessionsController#new`:
  - Render a form for the user to input their username and password.
- In `SessionsController#create`:
  - Verify the `user_name`/`password`.
  - Reset the `User`'s `session_token`.
  - Update the `session` hash with the new `session_token`.
  - Redirect the user to the cats index page.
- Don't worry about `SessionsController#destroy` yet; you'll get to it in the
  next section.
- Don't forget to add the corresponding views!

### Using the session

- In the `ApplicationController`, write a method `current_user` that looks up
  the user with the current session token.
  - Since all your controllers inherit from `ApplicationController`, this lets
    you use the method in any controller.
  - Methods defined on `ApplicationController` still aren't available in your
    views. You'll want to use `current_user` there too, so you need to make it a
    [`helper_method`][docs-helper_method]. Add this line to the top of
    `ApplicationController`:

    ```ruby
    helper_method :current_user
    ```

- Use `current_user` to implement `SessionsController#destroy`.
  - Call `#reset_session_token!` on `current_user` to invalidate the old token,
    but only if there is a `current_user`. Invalidating the old token guarantees
    that no one can log in with it. This is good practice in case someone has
    stolen the token.
  - Set `:session_token` to `nil` in the `session` hash.
- Edit the __application.html.erb__ layout and create a header at the top:
  - Show the `username` if the user is signed in.
  - Show a login or logout button, depending on whether a user is signed in.
- Be sure to log in a new user as soon as they sign up. Nothing is more
  frustrating than going through the whole sign-up process only to be redirected
  back to the login page. Bad form.
- At this point, you should probably factor out the login code from
  `SessionsController#create` into an `ApplicationController#login!` method
  so that you can use it in `UsersController` for this purpose.
- In the `User` and `Session` controllers, redirect a user to the cats index if
  the user tries to visit the login/sign-up pages when they're already signed
  in.
  - Use a [`before_action`] filter at the top of each controller to accomplish
    this.
  - Write the filter method in **application_controller.rb** so it can be
    accessed in both `UsersController` and `SessionsController`.
  - Name the filter `require_logged_out`. It should simply redirect a user to
    the cats index if there is a current user.
  
    > Note: If a render or redirect happens inside a `before_action` filter,
    > Rails will abandon the original request. Neither the originally targeted
    > action nor any subsequent filters will execute.

Good work! Now head to Phase V.

[live-demo]: https://ninetyninecats.herokuapp.com/
[`before_action`]: https://guides.rubyonrails.org/action_controller_overview.html#filters
[docs-helper_method]:https://api.rubyonrails.org/classes/AbstractController/Helpers/ClassMethods.html#method-i-helper_method