Feature: Add a organisation
  In order to track client sessions
  As a session logging database
  New organisations will need to be added

Scenario: Create a valid organisation
  Given that the new "organisation" page is accessed
  When valid organisation details are entered
  And the "Create" button is pressed
  Then a new "organisation" is created

Scenario: Create a invalid organisation
  Given that the new "organisation" page is accessed
  When invalid organisation details are entered
  And the "Create" button is pressed
  Then an error message is displayed
