 'use strict';
var hospital = require('../models/hospital-model')
var situacao = require('../models/situacao-model')
//http://docs.sequelizejs.com/manual/models-usage.html

/**
 * @api {post} /hospital/ 03-Insercao
 * @apiName exports.post
 * @apiGroup Hospital
 * @apiDescription Insere informa&ccedil;&otilde;es de um hospital no banco de dados.
 * Em caso de sucesso, redirecionao o usu&aacute;rio &agrave; lista de hospitais.
 * @apiParam {String} inputNome  Nome do Hospital
 * @apiParam {String} inputCnpj  CNPJ do Hospital
 * @apiParam {String} inputAddress  Endere&ccedil;o completo do Hospital
 * @apiParam {String} inputPhone  Telefone do Hospital
 */
exports.post = (req, res, next) => {
    var me = req.body;
    hospital.create({
        nome: me.inputNome,
        cnpj: me.inputCnpj,
        endereco: me.inputAddress,
        telefone: me.inputPhone,
        sit_id: 1 //Ativo
    }).then(function(hsp) {
		res.redirect('/Hospital')
	}).catch(function(err) {
		err.message = 'Hospital nao pode ser cadastrado!';
		next(err)
	})
    //console.log(req.body)
    //res.send('seja bem vindo. ' + req.body.inputPhone)

};

/**
 * @api {get} /hospital 01-Lista
 * @apiName exports.get
 * @apiGroup Hospital
 * @apiDescription Retorna uma tabela HTML contendo os campos
 *
 * Para cada registro, al&eacute;m das informa&ccedil;&otilde;es especificadas abaixo, h&aacute; ainda <em>links</em> para edi&ccedil;&atilde;o e remo&ccedil;&atilde;o do respectivo registro.
 * @apiSuccess {Number} ID  Identificador &uacute;nico do hospital
 * @apiSuccess {String} Nome  Nome do Hospital
 * @apiSuccess {String} CNPJ  CNPJ do Hospital
 * @apiSuccess {String} Endereco  Endere&ccedil;o completo do Hospital
 * @apiSuccess {String} Telefone  Telefone do Hospital
 */
exports.get = (req, res, next) => {
  
    hospital.findAll({ order: [['Nome', 'ASC']] }).then(function (hsp) {

        situacao.findAll({ order: [['SIT_DESC', 'ASC']] }).then(function (sit) {
            //console.log(hsp)
            //console.log(sit)
            res.render('hospital-lista', { title: 'Lista de Hospitais', hsp: hsp, sit: sit })
        })

        
    })


    //res.render('hospital', { title: 'Cadastro de Hospital' })
};

/**
 * @api {get} /hospital/cadastro 02-Cadastro
 * @apiName exports.cadastro
 * @apiGroup Hospital
 * @apiDescription Disponibiliza um formul&aacute;rio HTML para o cadastro das seguintes informa&ccedil;&otilde;es de um hospital.
 * @apiSuccess {String} Nome  Nome do Hospital
 * @apiSuccess {String} CNPJ  CNPJ do Hospital
 * @apiSuccess {String} Endereco  Endere&ccedil;o completo do Hospital
 * @apiSuccess {String} Telefone  Telefone do Hospital
 */
exports.cadastro = (req, res, next) => {
    res.render('hospital-cadastro', { title: 'Cadastro de Hospital' })
};

/**
 * @api {post} /hospital/update/edit/:id 04-Atualizacao
 * @apiName exports.update
 * @apiGroup Hospital
 * @apiDescription Atualiza informa&ccedil;&otilde;es de um hospital no banco de dados.
 * Em caso de sucesso, redirecionao o usu&aacute;rio &agrave; lista de hospitais.
 * @apiParam {String} inputNome  Nome do Hospital
 * @apiParam {String} inputCnpj  CNPJ do Hospital
 * @apiParam {String} inputAddress  Endere&ccedil;o completo do Hospital
 * @apiParam {String} inputPhone  Telefone do Hospital
 */
exports.update =  (req, res, next) => {
    var me = req.body;
    hospital.update(
        {
            nome: me.inputNome,
            cnpj: me.inputCnpj,
            endereco: me.inputAddress,
            telefone: me.inputPhone,
            sit_id: me.inputSituacao == "Ativo" ? 1 : 2
        },
        {returning: true, where: {HSP_ID: req.params.id} }
    ).then(function(hsp) {
  		res.redirect('/Hospital')
  	}).catch(function(err) {
		err.message = 'Hospital nao pode ser alterado!';
  		next(err)
  	})
}

/**
 * @api {get} /hospital/delete/:id 05-Remocao
 * @apiName exports.delete
 * @apiGroup Hospital
 * @apiDescription Remove um hospital do banco de dados.
 * Em caso de sucesso, redirecionao o usu&aacute;rio &agrave; lista de hospitais.
 */
exports.delete = (req, res, next) => {
    hospital.destroy({ where: { HSP_ID: req.params.id } }, { truncate: true }
	).then(function() {
  		res.redirect('/Hospital')
  	}).catch(function(err) {
		err.message = 'Hospital nao pode ser removido!';
  		next(err)
  	})
}


/**
 * @api {post} /hospital/desativa/:id 06-Desativacao
 * @apiName exports.update
 * @apiGroup Hospital
 * @apiDescription Desativa um hospital do banco de dados.
 * Em caso de sucesso, redirecionao o usu&aacute;rio &agrave; lista de hospitais.
 */
exports.desativa =  (req, res, next) => {   
    hospital.update(
        {
            sit_id: 2
        },
        {returning: true, where: {HSP_ID: req.params.id} }
    ).then(function(hsp) {
  		res.redirect('/Hospital')
  	}).catch(function(err) {
		err.message = 'Hospital nao pode ser alterado!';
  		next(err)
  	})
}