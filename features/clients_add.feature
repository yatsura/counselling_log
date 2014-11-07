Feature: Add a client
  In order to track client sessions
  As a session logging database
  New clients will need to be added

Background:
  Given that a organisation exists
  
Scenario: Create a valid client
  Given that the new "client" page is accessed
  When valid client details are entered
  And the "Create" button is pressed
  Then a new "client" is created

Scenario: Create a invalid client
  Given that the new "client" page is accessed
  When invalid client details are entered
  And the "Create" button is pressed
  Then an error message is displayed
