Feature: Counselling session index
  In order to log counselling activity
  As a session logging database
  An index of counselling sessions is required

Background:
  Given the following setup:
  | organisation | client   | zone  | sessions |
  | ACME         | ACME-001 | Adult |        2 |
  | ACME         | ACME-002 | Adult |        2 |
  | BCME         | BCME-001 | Adult |        2 |
  | BCME         | BCME-002 | Adult |        2 |

Scenario: View sessions in total
  Given that the index counselling_session page is accessed
  When the page is viewed
  Then a table of "counselling_sessions" details are visible

Scenario: View sessions by client
  Given that the index client page is accessed
  When the first "Sessions" link is clicked
  Then a table of "counselling_sessions" details are visible

Scenario: View sessions by organisation
  Given that the index organisation page is accessed
  When the first "Sessions" link is clicked
  Then a table of "counselling_sessions" details are visible
  
