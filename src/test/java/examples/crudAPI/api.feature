Feature: API to create items

Background:
    * url 'http://danielshamsudin.tech'
    * path 'items'

 @CreateItem
 Scenario: Create new item
     * def randomName = 'item-' + java.util.UUID.randomUUID()
     * def requestBody = 
     """
     {
         "name": "#(randomName)",
         "title": "#(randomName)"
     }
     """
     Given request requestBody
     When method post
     And print response
     Then status 201


# Scenario: Get all item

#     * karate.pause(2000)
#     When method get
#     Then status 200
#     And print response

# Scenario: Get item id 2

#     * karate.pause(2000)
#     Given path '6'
#     When method get
#     Then status 200
#     And print response

    
