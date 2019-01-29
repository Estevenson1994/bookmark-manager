#Bookmark Manager#


Anyone needing to setup the database from scratch will need to do the following things:

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Create the test database using the psql command CREATE DATABASE bookmark_manager_test;
3. Connect to the database using the pqsl command \c bookmark_manager or \c  bookmark_manager_test;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql

### User stories ###
As a user
I would like to see a list of bookmarks

|object|message|
|:----:|:-----:|
|list  |show   |
