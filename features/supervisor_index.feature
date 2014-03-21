Feature: Supervisor index
  In order to access supervisors
  As a session logging database
  A supervisor index is generated

Background:
  Given that a supervisor exists

Scenario: View supervisor
  Given that the index "supervisor" page is accessed
  When the page is viewed
  Then a table of "supervisors" details are visible

Scenario: Supervisor sessions
  Given that the index "supervisor" page is accessed
  When the "Sessions" link is clicked
  Then the "Sessions" page is displayed

Scenario: Edit supervisor
  Given that the index "supervisor" page is accessed
  When the "Show" link is clicked
  Then the "Supervisor" page is displayed

