# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example. Baisc http authentication is implemented through out all the admin controllers. Users can sign up account and login with their email address, while their password is hashed and stored in the databse by bcrypt.

This application also utilizes Stripe API to provide quasi-realistic transaction experience to users.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
- Bcrypt

## Testing Dependencies

- Cypress
- Rspec

## Screenshots

Home Page
![Home Page](https://github.com/kowo0403hk/Jungle/blob/master/docs/01_Jungle_Home.png?raw=true)

Http Authentication
![http authentication](https://github.com/kowo0403hk/Jungle/blob/master/docs/02_Jungle_http_authentication_for_admin.png?raw=true)

Admin Pages
![Admin Dashboard](https://github.com/kowo0403hk/Jungle/blob/master/docs/03_Jungle_admin_dashboard.png?raw=true)
![Admin Product List](https://github.com/kowo0403hk/Jungle/blob/master/docs/04_Jungle_admin_product_list.png?raw=true)
![Admin add new products](https://github.com/kowo0403hk/Jungle/blob/master/docs/05_Jungle_admin_add_new_product.png?raw=true)
![Admin Categories](https://github.com/kowo0403hk/Jungle/blob/master/docs/06_Jungle_admin_categories.png?raw=true)

Products
![Products](https://github.com/kowo0403hk/Jungle/blob/master/docs/07_Jungle_products_on_home_page.png?raw=true)
![Product Details](https://github.com/kowo0403hk/Jungle/blob/master/docs/08_Jungle_product_details.png?raw=true)

Cart
![Cart details](https://github.com/kowo0403hk/Jungle/blob/master/docs/09_Jungle_cart_details.png?raw=true)
![Stripe API](https://github.com/kowo0403hk/Jungle/blob/master/docs/10_Jungle_Stripe_API.png?raw=true)
![After Payment](https://github.com/kowo0403hk/Jungle/blob/master/docs/11_Jungle_order_detail_after_payment.png?raw=true)
![Empty Cart](https://github.com/kowo0403hk/Jungle/blob/master/docs/12_Jungle_empty_cart.png?raw=true)

User registration and login
![User Registration](https://github.com/kowo0403hk/Jungle/blob/master/docs/13_Jungle_user_registration.png?raw=true)
![Before Login - Nav](https://github.com/kowo0403hk/Jungle/blob/master/docs/14_Jungle_pre_user_login_nav_bar.png?raw=true)
![After Login - Nav](https://github.com/kowo0403hk/Jungle/blob/master/docs/15_Jungle_post_user_login_nav_bar.png?raw=true)
