Feature: Add a session
  In order to function ethically
  As the requirements for regulator supervision
  Sessions are record

Background:
  Given that a organisation exists
  And that a client exists

Scenario: Create a valid session
  Given that the new session page for the client is accessed
  When valid session details are entered
  And the "Create" button is pressed
  Then a new session is created

Scenario: Create a invalid client
  Given that the new session page for the client is accessed
  When invalid session details are entered
  And the "Create" button is pressed
  Then an error message is displayed
