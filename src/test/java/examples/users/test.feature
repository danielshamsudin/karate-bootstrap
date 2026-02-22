@regression
Feature: API Test for my-json-server

  Background:
    * url 'https://my-json-server.typicode.com/typicode/demo/'

  @smoke
  Scenario: Smoke Test - Get DB and check status
    Given path 'db'
    When method get
    Then status 200

  @regression
  Scenario: Regression Test - Validate DB structure and data types
    Given path 'db'
    When method get
    Then status 200
    And match response.posts == '#[]'
    And match each response.posts[*].id == '#number'
    And match each response.posts[*].title == '#string'
    And match response.comments == '#[]'
    And match each response.comments[*].id == '#number'
    And match each response.comments[*].body == '#string'
    And match each response.comments[*].postId == '#number'
    And match response.profile == '#object'
    And match response.profile.name == '#string'

  @e2e
  Scenario: E2E Test - Get all posts and then a single post
    # First, get all posts
    Given path 'posts'
    When method get
    Then status 200
    And def firstPost = response[0]

    # Then, get the first post by its ID
    Given path 'posts', firstPost.id
    When method get
    Then status 200
    And match response == firstPost

  @e2e @negative
  Scenario: E2E Test - Try to get a non-existent post
    Given path 'posts', 9999
    When method get
    Then status 404

  @e2e
  Scenario: E2E Test - Create a new post and verify
    # Note: my-json-server doesn't actually save the new post,
    # but it will simulate a successful creation with a 201 status.
    Given path 'posts'
    And request { title: 'new post', body: 'hello world', userId: 1 }
    When method post
    Then status 201
    And match response.id == '#number'
    And match response.title == 'new post'