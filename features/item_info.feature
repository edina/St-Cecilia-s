#encoding: utf-8
Feature: App responds to proximity and manual request for item info

  Scenario: Launch the app and display home page 
    Given the app has been installed
    When I launch the app
    A page displaying details about the app and the collection is displayed 

  Scenario: View list of items in collection.
    Given the app has been installed
    And I am on the home page
    When I select 'View Collection'
    A list of information about each item in the collection is displayed

  Scenario: View webpage associated with an item manually.
    Given the app has been installed
    And I am on the home page
    When I select 'View Collection'
    Then I select a particular item
    A web page is displayed within the app containing further information about the chosen item

  Scenario: View webpage associated with a nearby item.
    Given the beacons have been registered with associated items 
    And the app has been installed
    When I approach a beacon
    A web page is displayed within the app containing further information about the nearby item
