Feature: Session Cell
  In order to give an overview of the supervision status
  As a web application
  Session totals are given at the top

Background:
  Given that a organisation exists
  And that a client exists

Scenario: 1 hour of unsupervisied adult counselling
  Given 1 hour of "Adult" counselling
  When the "root" page is accessed
  Then 1 hour of "Adult" counselling is displayed
  And the supervision is "Distant"

Scenario: 7 hours of unsupervisied adult counselling
  Given 7 hours of "Adult" counselling
  When the "root" page is accessed
  Then 7 hours of "Adult" counselling is displayed
  And the supervision is "Close"

Scenario: 11 hours of unsupervisied adult counselling
  Given 11 hours of "Adult" counselling
  When the "root" page is accessed
  Then 11 hours of "Adult" counselling is displayed
  And the supervision is "Due"

Scenario: 13 hours of unsupervisied adult counselling
  Given 13 hours of "Adult" counselling
  When the "root" page is accessed
  Then 13 hours of "Adult" counselling is displayed
  And the supervision is "Over Due"
    
