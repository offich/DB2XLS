# DB2CSV

This repository allows you to print out all tables structures in MySql Database.
Make sure you have ruby 2.4.3 version in your local environment.

## How To Use
1. prepare`.env` file that has what you need to use mysql client on your console. (For example, `username` and `password`) 

```.env
MYSQL_USERNAME=hogepassword
MYSQL_PASSWORD=fugapassword
MYSQL_PORT=hogeport
MYSQL_DATABASE=hogedatabase
```

2. execute the command below and enter the name of the file you would like to output.
```
bundle install --path vendor/bundle
bundle exec ruby main_script.rb
```

