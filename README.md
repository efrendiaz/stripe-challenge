# Ruby on Rails Challenge

Please complete this challenge in order to be considered for the Ruby on Rails position. This challenge will demonstrate your abilities with the framework, test-driven development, interfacing with APIs, and your knack for solving problems and following directions. This should take no more than 1-2 hours at most to complete.

# Submission

Create a new branch `solution` and commit your code there. When finished, while in the `solution` branch, generate a patch file with

```
$ git diff --no-prefix master > solution.patch
```

Then use [this form](https://funnelcake.wufoo.com/forms/z18q3clo1f3emhl/) to submit your solution. *Please do not submit a pull request!*

# Description

We will be creating models that interface with [Stripe's API](https://stripe.com/docs/api). A [Stripe account](https://dashboard.stripe.com/register) is required in order to work with their API (it's free). Alright, let's get started!

# Problem

We currently have a `Customer` model that needs to have payment support added to it using Stripe. There needs to be the ability to 

- Add a credit card to a `Customer`
- Update the `Customer`'s existing credit card (i.e. fix expiration)
- Remove the `Customer`'s credit card
- Charge a `Customer`'s credit card 

Please have RSpec tests written to support your solution. You are not required to write any views or controllers.
