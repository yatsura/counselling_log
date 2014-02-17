Feature: Delete client
  In order to manage clients
  As a session logging database
  Client can be removed

Background:
  Given that a organisation exists
  And that a client exists

@javascript
Scenario: Delete client
  Given that the edit client page is accessed
  When the "Delete" button is pressed
  Then the client is deleted


