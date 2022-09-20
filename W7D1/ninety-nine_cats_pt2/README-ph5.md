# 99 Cats II: Auth (cont.)

**[Live Demo!][live-demo]**

## Phase V: Using `current_user` with `Cat`s and `CatRentalRequest`s

In this phase, you will use `current_user` to give `Cat`s an owner and
`CatRentalRequest`s a requester.

### Cats have an owner

- Add an `owner_id` column to `cats`. As always, index the foreign key and
  assign a `foreign_key` constraint.
- Add `owner` and `cats` associations with appropriate modifiers. (Don't forget
  `inverse_of` where needed!)
- In the `create` action of the `CatsController`, you'll need to be sure
  `owner_id` gets set to the current user's id.

  **Do not** use a form field to set `owner_id`, not even a hidden field.

  Using a hidden field does not guarantee that the value will be sent back
  unmodified. A user can always right click on the form, `inspect element`, and
  edit the value of a hidden field. Or, if they're really a `l33t h4x0r`,
  they'll just create a request manually and send you any data they want.

  In this case, if you embed a hidden tag like this:

  ```erb
  <input name="cat[owner_id]" type="hidden" value="<%= current_user.id %>">
  ```

  A malicious user could still inspect the element and modify it to the ID of
  another user. In other words, one user could maliciously create cats for other
  users.

  Never trust any data sent from the client where security is involved. You do
  not control the client, therefore you cannot trust it.

  In this case, the form submitter must be logged in or they couldn't view the
  form to begin with. You can accordingly set `cat.owner` to the `current_user`
  without relying on any form inputs.

- Since you are now using `current_user` inside `create`, use a
  [`before_action`] filter to make sure a user is logged in before granting
  access to the `new` or `create` actions.
  - Implement this similarly to the `require_logged_out` filter that you
    implemented at the end of Phase IV above.
- In the `CatsController` `edit`/`update` actions, make sure the editor owns the
  cat.
  - Use another `before_action` filter to accomplish this.
  - Instead of using `Cat.find`, try searching for the cat only among the
    `current_user`'s cats with the `User#cats` association. Remember, `has_many`
    associations are lazy-loading and behave like scopes when you tack query
    methods on the end. Doing this gives the added security benefit of not even
    loading the cat if it doesn't belong to the user.
  - Do a `redirect_to` in the filter if the user is not authorized.

  **N.B.:** It is insufficient to protect only the `edit` endpoint; you must
  also protect `update`. A malicious user could make a `PUT` request directly to
  `/cats/123` using [Postman] or a similar tool and update the cat anyway. In
  fact, protecting `edit` doesn't really do much when it comes to security. You
  do it for good UX: a non-malicious user who accidentally tries to edit another
  person's cat gets feedback that they're not allowed to.

- Do likewise for `CatRentalRequestsController`: only the cat owner should be
  able to approve/deny.
- On the cat show page, don't show the approve/deny buttons unless the user owns
  the cat.

### CatRentalRequests have a requester

- Add a `requester_id` column to `CatRentalRequest` to record the ID of the
  **requester** (not to be confused with the cat **owner**).
  - The column should have an index and `foreign_key` constraint.
  - Set up the `belongs_to` and `has_many` associations between
    `CatRentalRequest` and `User`.
- Be sure to assign the `current_user` as the requester in the
  `CatRentalRequestController`'s `create` action. Again, don't trust any form
  inputs.
- Using a `before_action` filter, ensure that there is a current user before
  granting access to the `new` or `create` actions.
- Display the requesting user's `username` next to each rental request on the
  cat show page.

## Bonus: Optimizing

- When you display the requesting user for each rental request, does this
  generate an `N+1` query? Use `includes` to fix it.

## What you've learned

Congratulations! In this practice you learned how to implement a user
authentication system. To do this, you created a `User` model with the methods
necessary for authentication, built a `SessionsController` for creating and
destroying a session, and learned how to implement and use a `current_user`
method.

[live-demo]: https://ninetyninecats.herokuapp.com/
[`before_action`]: https://guides.rubyonrails.org/action_controller_overview.html#filters
[Postman]: https://www.getpostman.com/