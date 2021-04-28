Step 1
User Functionality

/register
/login
/logout




1. Plan TheBreakApp

User
 authentication
 email / password
 unique emails
 many combos

Combo/set
  has many moves
 
Combos
id   name     user_id
1  power_combo   1

moves
 combo_id   url
   1       airflare

Moves
move_id url

/combos/new
/combos/1 #Show
preview of playlist we plan on deploying 
only the user be able to see this its not shareable

/combos/1/moves => moves resource
  add moves
  edits moves

/register
/login
/logout

/combos/deploy=>generates and deploys static site 

notes dont forget to mount controllers
cookie is remmembered by session
helpers is a sinatra method accessible to views and controllers





Changes to Corneal
1.unlock all gem versions
2.removed thin
3.check ActiveRecord::Base.connection.migration_context.needs_migration?
4.Better respect environments



set databases need to be structured