Feature: Edit a session
  In order to function ethically
  As the requirements for regulator supervision
  Sessions are record

Background:
  Given that a organisation exists
  And that a client exists
  And a session exists
  
Scenario: Edit a session validly
  Given that the edit "counselling_session" page is accessed
  When valid session details are entered
  And the "Update" button is pressed
  Then the "Session" is updated

Scenario: Edit a session invalidly
  Given that the edit "counselling_session" page is accessed
  When invalid session details are entered
  And the "Update" button is pressed
  Then an error message is displayed
