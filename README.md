# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

### App features include:
- User login and registration with basic authentication
- Admin basic authorization add/edit products and categories, as well as to access a dashboard page
- Display "sold out" items when quantity hits 0
- Users can add/remove items from their cart
- If cart is empty, user should not be able to access the cart or proceed with payment
- Users are able to checkout with secure payment


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Screenshots
![img](url)
