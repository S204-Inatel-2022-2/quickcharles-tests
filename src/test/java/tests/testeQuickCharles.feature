Feature: Testes de API

  Background: 
    Given url 'http://localhost:3000'
    And request {"name": "TESTE KARATE"}
    When path '/user'
    When method POST
    And print response
    * def auth = 'Bearer ' + response.token
    And header Authorization = auth

  Scenario: POST dos usuarios
    Given request {"name": "TESTE KARATE"}
    When path '/user'
    When method POST
    And print response
    * def id = response._id
    And print id
    Then status 200
    Given path '/user'
    And header Authorization = auth
    Then method DELETE
    

  Scenario: POST de um usuario sem passar o nome
    Given request {"name": ""}
    When path '/user'
    When method POST
    Then status 400
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: POST de um usuario com token invalido
    Given request {"name": ""}
    And header Authorization = 'Inexistente'
    When path '/user'
    When method POST
    Then status 400
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: GET dos usuarios
    Given path '/user'
    When method GET
    Then status 200
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: GET dos usuarios com token de autorizacao invalido
    Given header Authorization = 'Inexistente'
    And path '/user'
    When method GET
    Then status 403
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: PUT dos usuarios
    Given request {"name": "Nome novo"}
    When path '/user'
    When method PUT
    Then status 200
    And print response
		Given path '/user'
    And header Authorization = auth
    Then method DELETE
    
  Scenario: PUT de usuario sem passagem de parametros
    Given path '/user'
    When method PUT
    Then status 400
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: POST dos comando1
    Given request {"keyword": "COMANDO 1 ","payload": "meu retorno"}
    When path '/message'
    When method POST
    Then status 200
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: POST dos comando2
    Given request {"keyword": "COMANDO TESTE KARATE","payload": "RETORNO DO COMANDO TESTE KARATE"}
    When path '/message'
    When method POST
    Then status 200
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: POST de um comando sem keyword
    Given request {"payload": "RETORNO DO COMANDO TESTE KARATE"}
    When path '/message'
    When method POST
    Then status 400
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: POST de um comando sem payload
    Given request {"keyword": "COMANDO TESTE KARATE"}
    When path '/message'
    When method POST
    Then status 400
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: POST de um comando com token invalido
    Given request {"name": "asdas"}
    And header Authorization = 'dsddddd'
    When path '/message'
    When method POST
    Then status 403
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: GET de todos comandos
    Given path '/message'
    When method GET
    Then status 200
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: GET de um comando por query
    Given path '/message'
    And param id = messageID
    When method PUT
    Then status 400
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: GET dos comandos com token de autorizacao invalido
    Given header Authorization = 'Inexistente'
    And path '/message'
    When method GET
    Then status 403
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: GET de um comando nao existente
    Given path '/message'
    And param id = 'Inexistente'
    When method PUT
    Then status 400
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: GET de um comando nao existente
    Given path '/message'
    And param id = 'Inexistente'
    When method PUT
    Then status 400
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: PUT dos comandos
    Given request {"keyword": "NOVA KEYWORD TESTE KARATE"}
    And path '/message'
    And param id = messageID
    When method PUT
    Then status 200
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: PUT de um comando nao existente
    Given request {"keyword": "Nao existe"}
    And path '/message'
    And param id = 'Inexistente'
    When method PUT
    Then status 500
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: PUT de um comando sem passar a keyword
    Given request {"keyword": ""}
    And path '/message'
    And param id = messageID
    When method PUT
    Then status 400
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: PUT de um comando sem especificar o id
    Given request {"keyword": "Nao existe"}
    And path '/message'
    When method PUT
    Then status 400
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: PUT de comando sem passagem de parametros
    Given path '/message'
    When method PUT
    Then status 400
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: DEL de um comando sem query
    Given path '/message'
    And param id = 'Inexistente'
    When method delete
    Then status 500
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: DEL de um comando com token invalido
    Given header Authorization = 'Inexistente'
    And path '/message'
    And param id = 'Inexistente'
    When method delete
    Then status 403
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: DEL de um comando com ID invalido
    Given header Authorization = 'Inexistente'
    And path '/message'
    And param id = 'Inexistente'
    When method delete
    Then status 403
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: POST do token do discord
    Given request {"token": "token TESTE KARATE"}
    When path '/discord'
    When method POST
    Then status 200
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: POST do token do discord sem passar o nome
    Given request {"name": ""}
    When path '/user'
    When method POST
    Then status 400
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: POST do token com token invalido
    Given request {"token": "token TESTE KARATE"}
    And header Authorization = 'Inexistente'
    When path '/discord'
    When method POST
    Then status 403
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: GET do token com token de autorizacao invalido
    Given header Authorization = 'Inexistente'
    And path '/discord'
    When method GET
    Then status 403
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: PUT do token do discord
    Given request {"token": "NOVO TOKEN TESTE KARATE"}
    When path '/discord'
    When method PUT
    Then status 200
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: PUT de usuario sem passagem de parametros
    Given path '/user'
    When method PUT
    Then status 400
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: POST do token do whatsapp
    Given path '/whatsapp/register'
    When method POST
    Then status 200
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE

  Scenario: POST do token do whatsapp com token invalido
    Given header Authorization = 'Inexistente'
    And path '/whatsapp/register'
    When method POST
    Then status 403
    And print response
    Given path '/user'
    And header Authorization = auth
    Then method DELETE
