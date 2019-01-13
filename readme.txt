Please note, the following setup steps are verified on MacOS - some commands may differ for other environments.

1 - Clone git repository to get all files
2 - Create a database called spending_tracker on your local machine...
    - Open terminal / command line, and (in any location), type command "dropdb spending_tracker", then "createdb spending_tracker"
3 - In terminal / command line, navigate to the cloned project repository
4 - Run spending_tracker.sql...
    - In terminal / command line, in the db directory, type "psql -d spending_tracker -f spending_tracker.sql"
5 - If you wish to have some transactions, sellers and categories prepopulated, then also run seeds.rb...
    - In terminal / command line, in the db directory, type "ruby seeds.rb"
    - Otherwise, you can just add transactions, sellers and categories in the web app!
6 - To open the web app, first run the app.rb file...
    - In terminal / command line, in the main spending_tracker directory, type "ruby app.rb"
    - Terminal will show that sinatra is running on localhost:4567
7 - In your web browser, go to the address: "localhost:4567/"
8 - You will now be in the home page of the web app!

############
DEPENDENCIES
############

The following tools must be installed in order to open this project:

1 - Ruby - Available from https://www.ruby-lang.org/en/

2 - PostgreSQL - Installers available here https://www.enterprisedb.com/downloads/postgres-postgresql-downloads

3 - Sinatra - Sinatra is a Ruby package (called a "gem"). With Ruby downloaded, run the following in terminal / command line: "gem install sinatra"
