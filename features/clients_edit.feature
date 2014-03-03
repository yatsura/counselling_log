Feature: Edit a client
  In order to track client sessions
  As a session logging database
  Client details need to be editted

Background:
  Given that a organisation exists
  And that a client exists
  
Scenario: Edit a client validly
  Given that the edit "client" page is accessed
  When valid client details are changed
  And the "Update" button is pressed
  Then the "client" is updated

Scenario: Edit a client invalidly
  Given that the edit "client" page is accessed
  When valid client details are changed
  But the code is incorrect
  And the "Update" button is pressed
  Then an error message is displayed
