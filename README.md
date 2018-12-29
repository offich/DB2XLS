# DB2XLS

This repository allows you to print out all tables structures in MySql Database.

## Requirement

Ruby version: 2.4.3

## How To Use
1. Add `.env` file like below. The names of the variables are designated.

```.env
MYSQL_USERNAME=username
MYSQL_PASSWORD=password
MYSQL_PORT=port
MYSQL_DATABASE=database
MYSQL_HOST=host
```

2. Execute the command below and enter the name of the file you would like to output.
```
bundle install --path vendor/bundle
bundle exec ruby main_script.rb {file_name}
```

3. Then all table structures in your database will be printed into the file in the output directory!!

4. Any brand new feature, pull request, or issue is welcome!