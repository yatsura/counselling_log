Feature: Add a supervisor
  In order to track supervisor sessions
  As a session logging database
  New supervisors will need to be added

Scenario: Create a valid supervisor
  Given that the new "supervisor" page is accessed
  When valid supervisor details are entered
  And the "Create" button is pressed
  Then a new "supervisor" is created

Scenario: Create a invalid supervisor
  Given that the new "supervisor" page is accessed
  When invalid supervisor details are entered
  And the "Create" button is pressed
  Then an error message is displayed
