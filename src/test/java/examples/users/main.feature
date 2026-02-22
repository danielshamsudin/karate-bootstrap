@smoke
Feature: API Test

Background:
    * url 'https://my-json-server.typicode.com/typicode/demo/'
Scenario: Get DB data
    Given path 'db'
    When method get
    Then status 200

Scenario: Get Posts data
    Given path 'posts'
    When method get
    Then status 200
Scenario: Get Comments data
    Given path 'comments'
    When method get
    Then status 200

Scenario: Get profile data
    Given path 'profile'
    When method get
    Then status 200
