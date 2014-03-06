Feature: Delete supervisor
  In order to manage supervisors
  As a session logging database
  Supervisor can be removed

Background:
  Given that a organisation exists
  And that a supervisor exists

@javascript
Scenario: Delete supervisor
  Given that the edit "supervisor" page is accessed
  When the "Delete" button is pressed
  Then the "supervisor" is disabled


