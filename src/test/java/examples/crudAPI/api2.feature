Feature: API to create items

Background:
    * url 'http://danielshamsudin.tech'
    * path 'items'
    * def result = call read('api.feature@CreateItem')
    * def item_id = result.response.id


Scenario: Fetch id with new generated id

    Given path item_id
    When method get
    Then status 200
    And print response



Scenario: Delete newly generated id

    Given path item_id
    When method delete
    Then status 204
    And print response

