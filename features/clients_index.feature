Feature: Client index
  In order to access clients
  As a session logging database
  A client index is generated

Background:
  Given that a organisation exists
  And that a client exists

Scenario: View client
  Given that the index client page is accessed
  When the page is viewed
  Then a table of "clients" details are visible

Scenario: Client sessions
  Given that the index client page is accessed
  When the "Sessions" link is clicked
  Then the "Sessions" page is displayed

Scenario: Edit client
  Given that the index client page is accessed
  When the "Edit" link is clicked
  Then the "Edit Client" page is displayed

