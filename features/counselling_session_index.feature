Feature: Counselling session index
  In order to log counselling activity
  As a session logging database
  An index of counselling sessions is required

Background:
  Given that a organisation exists
  And that a client exists
  And that the client has had some sessions

Scenario: View sessions in total
  Given that the index counselling_session page is accessed
  When the page is viewed
  Then a table of "counselling_sessions" details are visible

Scenario: View sessions by client
  Given that the index client page is accessed
  When the "Sessions" link is clicked
  Then a table of "counselling_sessions" details are visible

Scenario: View sessions by organisation
  Given that the index organisation page is accessed
  When the "Sessions" link is clicked
  Then a table of "counselling_sessions" details are visible
  
