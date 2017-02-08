# README

# Diversify Images/Idea Box

Diversify Images is a tool for anyone who wants to use a Diverse Image for their project/idea.  
Users can search images by category such as work, family, play, women, men, etc.
Images can be assigned to individual projects and units to come back to later.  

# How to install

### First: 
Pick your favorite directory, then:

`git clone https://github.com/AliSchlereth/idea_box.git`

`cd idea_box`

### Second: 
Run `bundle`. You'll need to be using Ruby 2.3.0. If you don't have that, 
and you have rvm installed, you can run:

`rvm install ruby-2.3.0` ... to get 2.3.0. 

The Gemfile should automatically switch rubies for you when you open Rales Engine

but if not, you can do `rvm use 2.3.0`.

### Third:
Now, you'll need to make sure your PostgreSQL database is running. If you've got

a small elephant at the top of your screen: great. If not, spin up your PostgreSQL app.

(If you don't have the app, go [here](http://postgresapp.com/) and follow the install instructions.)

### Fourth:
Next: run the following command in your terminal:

`rake db:create db:migrate db:test:prepare`

### Fifth: 

Run the test suite:  

Go ahead and run `rspec` - make sure all the tests pass.  
If not, you might be missing a gem or maybe you should go back and run

`rake db:test:prepare`. 


## Technical details:

A Rails app built with a PostgreSQL database. Tests written
in rspec-rails, with dummy items coming from factory girl. Coverage provided by 
simplecov.


