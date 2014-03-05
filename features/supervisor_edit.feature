Feature: Edit a supervisor
  In order to track supervisor sessions
  As a session logging database
  Supervisor details need to be editted

Background:
  Given that a supervisor exists
  
Scenario: Edit a supervisor validly
  Given that the edit "supervisor" page is accessed
  When valid supervisor details are entered
  And the "Update" button is pressed
  Then the "supervisor" is updated

@pdm
Scenario: Edit a supervisor invalidly
  Given that the edit "supervisor" page is accessed
  When invalid supervisor details are entered
  And the "Update" button is pressed
  Then an error message is displayed
