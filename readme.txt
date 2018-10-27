1 - Clone git repository to get all files
2 - Create a database called spending_tracker on your local machine
    - Open terminal / command line, and (in any location), type command "dropdb spending_tracker", then "createdb spending_tracker"
3 - Run spending_tracker.sql
    - In terminal / command line, in the db directory, type "psql -d spending_tracker -f spending_tracker.sql"
4 - If you wish to have some transactions, sellers and categories prepopulated, then also run seeds.rb
    - In terminal / command line, in the db directory, type "ruby seeds.rb"
    - Otherwise, you can just add transactions, sellers and categories in the web app!
5 - To open the web app, first run the app.rb file
    - In terminal / command line, in the main spending_tracker directory, type "ruby app.rb"
    - Terminal will show that sinatra is running on localhost:4567
6 - In your web browser, go to the address: "localhost:4567/"
7 - You will now be in the home page of the web app!
