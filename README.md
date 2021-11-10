# README

### Description
This application implements a simple message board in which users can create and manage posts and associated comment threads.

### Development Environment
This application was developed using Ruby on Rails. Please ensure you have the following versions of Ruby and the Rails gem installed  on your system.
* Ruby 2.7.0
* Rails 6.1.4.1


From within the top level project directory, run the following to fetch and install application dependencies:

    bundle install

### Database Setup

Once all of the application dependencies have been installed, the database can be setup with the following commands:

    bundle exec rake db:create
    bundle exec rake db:schema:load

If for some reason the database was not prperly initialized using the schema loading command, database migrations can be run to recreate the schema with the following command:

    bundle exec rake db:migrate

At this point, the database should be ready for use.  The following command can be used to populate the database with demo data if desired:

    bundle exec rake db:seed

### Running the application

Once the database is setup, the application can be run with the following command:

    rails server

Visit http://localhost:3000/ in a browser to begin using the application.

### Usage Notes

In order to create posts and comments, an email address associated to an existing user in the database must be provided.  Currently there is no mechanism for logging in as a specific user or creating new users. So the demo seed data includes 5 demo users that have a standard email address format. The following email addresses can be used for emulating multiple user interactions if the database seed has been run.

    demo1@bb.biz
    demo2@bb.biz
    demo3@bb.biz
    demo4@bb.biz
    demo5@bb.biz

If you do not want to run the database seed, another option would be to create a user manually via the rails console after the database has been setup.
