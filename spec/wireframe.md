#App Overview

I am creating an app where a user can keep track of places they have been

#User Stories 
## Users will be able to ...
 login, sign up and sign out

## As a user, I can...
CRUD places 
  - create places
  - see places
  - edit places
  - delete places


#Wireframing

## Models are User and Place

## User
### Attributes
- name
- username/email
- password (if using bcrypt, this will be 'password_digest in db)

### Associations
 has many :places
## Place

### Attributes
- user_id
- city_name
- date

### Associations
- belongs_to :user

# MVP
- Users can log in, log out, create places, see their own places, edit their own places and delete their list of places

#Stretch Goals
- add CSS for design
- add favorite features for places (food, attractions, group planning so others have editing privileges, etc)
