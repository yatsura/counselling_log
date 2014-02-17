Feature: Delete session
  In order to function ethically
  As a database
  Sessions can be deleted if entered in error

Background:
  Given that a organisation exists
  And that a client exists
  And a session exists
  
Scenario: Delete
  Given that the edit session page is accessed
  When the "Delete" button is pressed
  Then the session is delete

