Feature: Organisation index
  In order to access organisations
  As a session logging database
  A organisation index is generated

Background:
  Given that a organisation exists

Scenario: View organisation
  Given that the index organisation page is accessed
  When the page is viewed
  Then a table of "organisations" details are visible

Scenario: Organisation sessions
  Given that the index organisation page is accessed
  When the "Sessions" link is clicked
  Then the "Sessions" page is displayed

Scenario: Edit organisation
  Given that the index organisation page is accessed
  When the "Edit" link is clicked
  Then the "Edit Organisation" page is displayed

