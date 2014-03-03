Feature: Delete organisation
  In order to manage organisations
  As a session logging database
  Organisation can be removed

Background:
  Given that a organisation exists

@javascript
Scenario: Delete organisation
  Given that the show "organisation" page is accessed
  When the "Delete" button is pressed
  Then the "organisation" is deleted


