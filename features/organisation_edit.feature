Feature: Edit a organisation
  In order to track organisation sessions
  As a session logging database
  Organisation details need to be editted

Background:
  Given that a organisation exists
  
Scenario: Edit a organisation validly
  Given that the edit "organisation" page is accessed
  When valid organisation details are entered
  And the "Update" button is pressed
  Then the "organisation" is updated

Scenario: Edit a organisation invalidly
  Given that the edit "organisation" page is accessed
  When valid organisation details are entered
  But the "Name" is blank
  And the "Update" button is pressed
  Then an error message is displayed
