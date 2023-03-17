@completeTest
Feature: Retail API - Address Service

  Background: 
    Given url "https://tek-retail-api.azurewebsites.net/"
    * def tokenValue = call read("TokenGenerator.feature")
    * def token = tokenValue.response.accessToken
    * header x-access-token = token

  Scenario: Create New Address
    * path "/address"
    * request
      """
      {
      "country": "United States",
      "fullName": "Shaiq",
      "phoneNumber": "2021015522",
      "street": "1226 Main Street ",
      "apartment": "apt 115",
      "city": "Tysons",
      "state": "VA",
      "zipCode": "22044"
      }
      """
    * method post
    * print response
    * status 200

  Scenario: get all Addresses
    * path "/address"
    * method get
    * status 200
    * print response
    * print response[0].id
    * karate.write(response,'address.json')

  Scenario: Update an address
    * def addressID = read('file:./target/address.json')
    * def id = addressID[0].id
    * path "/address/" + id
    * request
      """
      {
      "country": "United States",
      "fullName": "Transformers ",
      "phoneNumber": "2021015566",
      "street": "Main st ",
      "apartment": "H.no 15",
      "city": "Falls Church",
      "state": "VA",
      "zipCode": "22044"
      }
      """
    * method put
    * print response

  Scenario: Delete All Address
    * def addressID = read('file:./target/address.json')
    * def id = addressID[0].id
    * path "/address/" + id
    * method delete
    * print response

