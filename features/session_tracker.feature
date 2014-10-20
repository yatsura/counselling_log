Feature: Add a session
  In order to function ethically
  As the requirements for regulator supervision
  Supervision is required at intervals

Background:
  Given that a organisation exists
  And that a client exists

Scenario: First counselling session
  Given that the new "counselling_session" page for the client is accessed
  When valid session details for the client are entered
  And the "Create" button is pressed
  Then a new "counselling_session" is created
  And with the "Adult" cell:
  | total-time                | 1.0 hours |
  | unsupervised-contact-time | 1.0 hours |
  | supervision-message       | Distant   |



