define({ "api": [
  {
    "type": "get",
    "url": "/hospital/:hsp_id/ala/:wng_id/leito/new",
    "title": "02-Cadastrar",
    "name": "exports_cadastro",
    "group": "Leito",
    "description": "<p>Disponibiliza um formulário HTML para o cadastro das seguintes informações de um leito.</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputName",
            "description": "<p>Nome do Leito</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputCpf",
            "description": "<p>CPF do paciente que está ocupando o Leito</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "controllers/ala-controller.js",
    "groupTitle": "Ala"
  },
  {
    "type": "get",
    "url": "/hospital/:hsp_id/ala/new",
    "title": "02-Cadastrar",
    "name": "exports_cadastro",
    "group": "Ala",
    "description": "<p>Disponibiliza um formulário HTML para o cadastro das seguintes informações de um ala.</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputName",
            "description": "<p>Nome da Ala</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputSpeciality",
            "description": "<p>Especialidade atendida na Ala</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "controllers/ala-controller.js",
    "groupTitle": "Ala"
  },
  {
    "type": "get",
    "url": "/hospital/:hsp_id/ala/delete/:id",
    "title": "05-Desabilitar",
    "name": "exports_delete",
    "group": "Ala",
    "description": "<p>Desabilita um ala no banco de dados. Em caso de sucesso, redirecionao o usuário à lista de alas do hospital selecionado.</p>",
    "version": "0.0.0",
    "filename": "controllers/ala-controller.js",
    "groupTitle": "Ala"
  },
  {
    "type": "get",
    "url": "/hospital/:hsp_id/ala",
    "title": "01-Listar",
    "name": "exports_get",
    "group": "Ala",
    "description": "<p>Retorna uma tabela HTML contendo os campos</p> <p>Para cada registro, além das informações especificadas abaixo, há ainda <em>links</em> para edição e remoção do respectivo registro.</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Number",
            "optional": false,
            "field": "ID",
            "description": "<p>Identificador único do ala</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "Nome",
            "description": "<p>Nome da Ala</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "Especialidade",
            "description": "<p>Especialidade atendida na Ala</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "controllers/ala-controller.js",
    "groupTitle": "Ala"
  },
  {
    "type": "get",
    "url": "/hospital/:hsp_id/ala/:wng_id/leito",
    "title": "01-Listar",
    "name": "exports_get",
    "group": "Leito",
    "description": "<p>Retorna uma tabela HTML contendo os campos</p> <p>Para cada registro, além das informações especificadas abaixo, há ainda <em>links</em> para edição do respectivo registro.</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Number",
            "optional": false,
            "field": "ID",
            "description": "<p>Identificador único do leito</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "Nome",
            "description": "<p>Nome do leito</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "Paciente (cpf)",
            "description": "<p>CPF do paciente que está ocupando o leito</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "controllers/ala-controller.js",
    "groupTitle": "Ala"
  },
  {
    "type": "post",
    "url": "/hospital/:hsp_id/ala",
    "title": "03-Inserir",
    "name": "exports_post",
    "group": "Ala",
    "description": "<p>Insere informações de um ala no banco de dados. Em caso de sucesso, redirecionao o usuário à lista de alas do hospital selecionado.</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputName",
            "description": "<p>Nome da Ala</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "inputSpeciality",
            "description": "<p>ID da Especialidade atendida na Ala</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "controllers/ala-controller.js",
    "groupTitle": "Ala"
  },
  {
    "type": "post",
    "url": "/hospital/:hsp_id/ala/:wng_id/leito",
    "title": "03-Inserir",
    "name": "exports_post",
    "group": "Leito",
    "description": "<p>Insere informações de um leito no banco de dados. Em caso de sucesso, redirecionao o usuário à lista de leitos da ala selecionada.</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputName",
            "description": "<p>Nome do leito</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "inputCpf",
            "description": "<p>CPF do paciente que está ocupando o leito</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "controllers/leito-controller.js",
    "groupTitle": "Leito"
  },
  {
    "type": "post",
    "url": "/hospital/:hsp_id/ala/update/:id",
    "title": "04-Atualizar",
    "name": "exports_update",
    "group": "Ala",
    "description": "<p>Atualiza informações de um ala no banco de dados. Em caso de sucesso, redirecionao o usuário à lista de alas do hospital selecionado.</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputName",
            "description": "<p>Nome da Ala</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputSpeciality",
            "description": "<p>Especialidade atendida na Ala</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "inputSituation",
            "description": "<p>ID da Situacao da Ala</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "controllers/ala-controller.js",
    "groupTitle": "Ala"
  },
  {
    "type": "post",
    "url": "/hospital/:hsp_id/ala/:wng_id/update/:id",
    "title": "04-Atualizar",
    "name": "exports_update",
    "group": "Leito",
    "description": "<p>Atualiza informações de um leito no banco de dados. Em caso de sucesso, redirecionao o usuário à lista de leitos da ala selecionada.</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputName",
            "description": "<p>Nome da Leito</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "inputCpf",
            "description": "<p>CPF do paciente que está ocupando o leito</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "controllers/leito-controller.js",
    "groupTitle": "Leito"
  },
  {
    "type": "get",
    "url": "/especialidade/new",
    "title": "02-Cadastrar",
    "name": "exports_cadastro",
    "group": "Especialidade",
    "description": "<p>Disponibiliza um formulário HTML para o cadastro das seguintes informações de um especialidade.</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "Descricao",
            "description": "<p>Descrição da Especialidade</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "controllers/especialidade-controller.js",
    "groupTitle": "Especialidade"
  },
  {
    "type": "get",
    "url": "/especialidade/delete/:id",
    "title": "05-Remover",
    "name": "exports_delete",
    "group": "Especialidade",
    "description": "<p>Remove um especialidade do banco de dados. Em caso de sucesso, redirecionao o usuário à lista de especialidades.</p>",
    "version": "0.0.0",
    "filename": "controllers/especialidade-controller.js",
    "groupTitle": "Especialidade"
  },
  {
    "type": "get",
    "url": "/especialidade",
    "title": "01-Listar",
    "name": "exports_get",
    "group": "Especialidade",
    "description": "<p>Retorna uma tabela HTML contendo os campos</p> <p>Para cada registro, além das informações especificadas abaixo, há ainda <em>links</em> para edição e remoção do respectivo registro.</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Number",
            "optional": false,
            "field": "ID",
            "description": "<p>Identificador único do especialidade</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "Descricao",
            "description": "<p>Descrição da Especialidade</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "controllers/especialidade-controller.js",
    "groupTitle": "Especialidade"
  },
  {
    "type": "post",
    "url": "/especialidade/",
    "title": "03-Inserir",
    "name": "exports_post",
    "group": "Especialidade",
    "description": "<p>Insere informações de um especialidade no banco de dados. Em caso de sucesso, redirecionao o usuário à lista de especialidades.</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputDesc",
            "description": "<p>Descrição da Especialidade</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "controllers/especialidade-controller.js",
    "groupTitle": "Especialidade"
  },
  {
    "type": "post",
    "url": "/especialidade/update/:id",
    "title": "04-Atualizar",
    "name": "exports_update",
    "group": "Especialidade",
    "description": "<p>Atualiza informações de um especialidade no banco de dados. Em caso de sucesso, redirecionao o usuário à lista de especialidades.</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputDesc",
            "description": "<p>Descrição da Especialidade</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "controllers/especialidade-controller.js",
    "groupTitle": "Especialidade"
  },
  {
    "type": "get",
    "url": "/hospital/new",
    "title": "02-Cadastrar",
    "name": "exports_cadastro",
    "group": "Hospital",
    "description": "<p>Disponibiliza um formulário HTML para o cadastro das seguintes informações de um hospital.</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "Nome",
            "description": "<p>Nome do Hospital</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "CNPJ",
            "description": "<p>CNPJ do Hospital</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "Endereco",
            "description": "<p>Endereço completo do Hospital</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "Telefone",
            "description": "<p>Telefone do Hospital</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "controllers/hospital-controller.js",
    "groupTitle": "Hospital"
  },
  {
    "type": "get",
    "url": "/hospital/delete/:id",
    "title": "05-Desabilitar",
    "name": "exports_delete",
    "group": "Hospital",
    "description": "<p>Desabilita um hospital no banco de dados. Em caso de sucesso, redirecionao o usuário à lista de hospitais.</p>",
    "version": "0.0.0",
    "filename": "controllers/hospital-controller.js",
    "groupTitle": "Hospital"
  },
  {
    "type": "get",
    "url": "/hospital",
    "title": "01-Listar",
    "name": "exports_get",
    "group": "Hospital",
    "description": "<p>Retorna uma tabela HTML contendo os campos</p> <p>Para cada registro, além das informações especificadas abaixo, há ainda <em>links</em> para edição e remoção do respectivo registro.</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Number",
            "optional": false,
            "field": "ID",
            "description": "<p>Identificador único do hospital</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "Nome",
            "description": "<p>Nome do Hospital</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "CNPJ",
            "description": "<p>CNPJ do Hospital</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "Endereco",
            "description": "<p>Endereço completo do Hospital</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "Telefone",
            "description": "<p>Telefone do Hospital</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "controllers/hospital-controller.js",
    "groupTitle": "Hospital"
  },
  {
    "type": "post",
    "url": "/hospital/",
    "title": "03-Inserir",
    "name": "exports_post",
    "group": "Hospital",
    "description": "<p>Insere informações de um hospital no banco de dados. Em caso de sucesso, redirecionao o usuário à lista de hospitais.</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputNome",
            "description": "<p>Nome do Hospital</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputCnpj",
            "description": "<p>CNPJ do Hospital</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputAddress",
            "description": "<p>Endereço completo do Hospital</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputPhone",
            "description": "<p>Telefone do Hospital</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "controllers/hospital-controller.js",
    "groupTitle": "Hospital"
  },
  {
    "type": "post",
    "url": "/hospital/update/edit/:id",
    "title": "04-Atualizar",
    "name": "exports_update",
    "group": "Hospital",
    "description": "<p>Atualiza informações de um hospital no banco de dados. Em caso de sucesso, redirecionao o usuário à lista de hospitais.</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputNome",
            "description": "<p>Nome do Hospital</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputCnpj",
            "description": "<p>CNPJ do Hospital</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputAddress",
            "description": "<p>Endereço completo do Hospital</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "inputPhone",
            "description": "<p>Telefone do Hospital</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "inputSituation",
            "description": "<p>ID da Situacao do Hospital</p>"
          }
        ]
      }
    },
    "version": "0.0.0",
    "filename": "controllers/hospital-controller.js",
    "groupTitle": "Hospital"
  }
] });
