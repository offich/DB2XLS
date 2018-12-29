# DB2XLS

This repository allows you to print out all tables structures in MySql Database.

## Requirement

Ruby version: 2.4.3

## How To Use
1. prepare`.env` file that has what you need to use mysql client on your console.

```.env
MYSQL_USERNAME=hogepassword
MYSQL_PASSWORD=fugapassword
MYSQL_PORT=hogeport
MYSQL_DATABASE=hogedatabase
MYSQL_HOST=db
```

2. execute the command below and enter the name of the file you would like to output.
```
bundle install --path vendor/bundle
bundle exec ruby main_script.rb
```

