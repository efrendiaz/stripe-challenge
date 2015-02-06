# Ruby on Rails Challenge

Please complete this challenge in order to be considered for the Ruby on Rails position. This challenge will demonstrate your abilities with the framework, test-driven development, interfacing with APIs, and your knack for solving problems and following directions. This should take no more than 1-2 hours at most to complete.

# Description

We will be creating models that interface with [Stripe's API](https://stripe.com/docs/api). A [Stripe account](https://dashboard.stripe.com/register) is required in order to work with their API (it's free). Alright, let's get started!

# Problem

We currently have a `Customer` model that needs to have payment support added to it using Stripe. There needs to be the ability to 

- Add a credit card to a `Customer`
- Update the `Customer`'s credit card if it changes
- Remove the `Customer`'s credit card
- Charge a `Customer`'s credit card 

Please have RSpec tests written to support your solution. You are not required to write any views or controllers.

# Submission

Commit your solution and generate a patch file with

```
$ git diff --no-prefix master > solution.patch
```

Send the generated patch file to **challenge@funnelthecake.com** with the subject line: **Rails Challenge**. In the body of the email, please explain your thought process and why you chose to solve it the way you did. Please do not submit a pull request!
