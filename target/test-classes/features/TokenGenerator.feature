Feature: Generate API Access Token for Retail App

	@getToken
  Scenario: Generate Token  
    Given url "https://tek-retail-api.azurewebsites.net/"
    * path "/auth/login"
    * request {"email":"shaiq.ahmad@tekschool.us","password":"Test@12345"}
    * method post
    * status 200
    * print response.accessToken
    * print response
