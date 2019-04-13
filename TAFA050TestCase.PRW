#include "PROTHEUS.CH"
#INCLUDE "rwmake.ch" 
#INCLUDE "topconn.ch"   
#INCLUDE "FWMVCDEF.CH"
#INCLUDE "FWMBROWSE.CH"

//-------------------------------------------------------------------
/*/{Protheus.doc} TAFA050TestCase

@author Denis R. de Oliveira
@since 11/03/2016
@version 1.0
@see FWDefaultTestSuit , FWDefaultTestCase
/*/
//-------------------------------------------------------------------
CLASS TAFA050TestCase from FWDefaultTestCase

	DATA oHelper
	
	METHOD TAFA050TestCase() CONSTRUCTOR

	//METHOD TAF050_001()
	METHOD TAF050_002()
	//METHOD TAF050_003()
	//METHOD TAF050_004()
	METHOD TAF050_005()
	METHOD TAF050_006()
	METHOD TAF050_007()
	METHOD TAF050_009()
	METHOD TAF050_023()
	METHOD TAF050_024()
	METHOD TAF050_025()
	METHOD TAF050_026()
	METHOD TAF050_027()
	METHOD TAF050_028()
	METHOD TAF050_038()
	METHOD TAF050_039()
	METHOD TAF050_040()
	METHOD TAF050_041()
	METHOD TAF050_042()
	METHOD TAF050_043()
	
	//nova validade
	//METHOD TAF050_026()
	
ENDCLASS

//-----------------------------------------------------------------
/*/{Protheus.doc} TAFA050TestCase
Instância os casos de teste do módulo TAF
 
@author Denis R. de Oliveira
@since 11/03/2016
@version 1.0
/*/
//-----------------------------------------------------------------
METHOD TAFA050TestCase() CLASS TAFA050TestCase
	
	_Super:FWDefaultTestSuite()
	
	//::AddTestMethod("TAF050_001",,"Caso de Teste 001")
	::AddTestMethod( "TAF050_002",,"Caso de Teste 002")
	//::AddTestMethod("TAF050_003",,"Caso de Teste 003")
	//::AddTestMethod( "TAF050_004",,"Caso de Teste 004")
	::AddTestMethod( "TAF050_005",,"Caso de Teste 005")
	::AddTestMethod( "TAF050_006",,"Caso de Teste 006")
	::AddTestMethod( "TAF050_007",,"Caso de Teste 007")
	::AddTestMethod( "TAF050_009",, "Inclusão manual" )
	::AddTestMethod( "TAF050_023",, "Alteração manual evento não transmitido" )
	//::AddTestMethod( "TAF050_024",, "Caso de Teste 024" ) //Amarração Automática 1 x 1 - Tabela Vazia
	//::AddTestMethod( "TAF050_025",, "Caso de Teste 025" ) //Amarração Automática 1 x 1 - Substituir
	::AddTestMethod( "TAF050_026",, "Alteração via integração evento não transmitido" )
	::AddTestMethod( "TAF050_027",, "Retificação manual evento transmitido" )
	::AddTestMethod( "TAF050_028",, "Alteração via integração evento não transmitido" )
	::AddTestMethod( "TAF050_038",, "Inclusão via integração" )
	::AddTestMethod( "TAF050_039",, "Alteração via integração evento não transmitido" )
	::AddTestMethod( "TAF050_040",, "Alteração manual evento não transmitido" )
	::AddTestMethod( "TAF050_041",, "Retificação via integração evento transmitido" )
	::AddTestMethod( "TAF050_042",, "Alteração manual evento não transmitido" )
	::AddTestMethod( "TAF050_043",, "Inclusão de um novo registro com uma nova data de inicio de validade para uma filial que já tenha cadastro no sistema." )

Return

//-------------------------------------------------------------------
/*/{Protheus.doc} DelC1E
Realiza a exclusão do registro cCodFil da tabela C1E
	
@return  lOK

@author Denis Souza \ Wesley Pinheiro
@since 24/07/2018
@version 1.0
/*/ 
//--------------------------------------------------------------------   
Static Function DelC1E( cCodFil )

	Local cQryExec 	:= " "
	Local lOk		:= .F.

	cQryExec := " " 
	cQryExec += " DELETE FROM " + RetSqlName( "C1E" ) + " WHERE C1E_FILIAL = '" + xFilial( "C1E" ) + "' AND C1E_CODFIL = '" + cCodFil + "' "
	
	lOk := TcSQLExec( cQryExec ) >= 0

	If lOk
		TcSQLExec( "COMMIT" )
	Else 	
		Conout( "Não foi possível realizar a exclusão dos registros da tabela " + RetSqlName( "C1E" ) + ". Erro: "  + TCSQLError( ) )
	Endif
  
	TCRefresh( RetSqlName( "C1E" ) )

Return lOk

//-------------------------------------------------------------------
/*/{Protheus.doc} TAFA050_001 Inclusão
Caso de Teste 001, via TDD
Inclusão de novo registro (TAFA050) - Preenchimento dos Campos Obrigatórios - Todos

@author Denis R. de Oliveira
@since 11/03/2016
@version 1.0
/*/
//-------------------------------------------------------------------
/*METHOD TAF050_001() CLASS TAFA050TestCase
Local oHelper	:= FWTestHelper():New()
Local oModel	:= FWLoadModel('TAFA050')

Local cID		:= GetSx8Num("C1E","C1E_ID")
Local cFilTaf := "M SP 02 "
Local cCodFil := "T1M SP 02

Local cTable 	:= "C1E"
Local cQuery 	:= ""

//-- Limpo a tabela
oHelper:Activate()
oHelper:UTClearDB({"C1E"})
oHelper:DeActivate()

//-- Seto a operação
oModel:SetOperation(MODEL_OPERATION_INSERT)
oModel:Activate()

oHelper	:= FWTestHelper():New()
oHelper:SetModel(oModel)
oHelper:Activate()

//-- SetValue
oHelper:UTSetValue('MODEL_C1E','C1E_ID'    ,cID) //Caracter - Tamanho: 02
oHelper:UTSetValue('MODEL_C1E','C1E_FILTAF',cFilTaf) //Caracter - Tamanho: 02
oHelper:UTSetValue('MODEL_C1E','C1E_CODFIL',cCodFil) //Caracter - Tamanho: 40
                                                                                                                                                                                                                                                      
//-- Confirma Inclusão
oHelper:UTCommitData()

//-- Ponto de verificação
cQuery := "C1E_FILIAL = '" + xFilial("C1E") + "' AND C1E_ID = '" + cID + "'"

oHelper:UTQueryDB(cTable,'C1E_ID'    ,cQuery,cID)
oHelper:UTQueryDB(cTable,'C1E_FILTAF',cQuery,cFilTaf)
oHelper:UTQueryDB(cTable,'C1E_CODFIL',cQuery,cCodFil)



oHelper:AssertTrue(oHelper:lOk,'')

Return oHelper */
//-------------------------------------------------------------------
/*/{Protheus.doc} TAFA050_002 Inclusão
Caso de Teste 002, via TDD
Inclusão do complemento de empresa (TAFA050) - Preenchimento dos Campos Obrigatórios - Parcial

@author Denis R. de Oliveira
@since 11/03/2016
@version 1.0
/*/
//-------------------------------------------------------------------
METHOD TAF050_002() CLASS TAFA050TestCase
Local oHelper  := FWTestHelper():New()
Local oModel   := FWLoadModel('TAFA050')

Local cID		:= GetSx8Num("C1E","C1E_ID")    
Local cFilTaf := "M SP 02 "
Local cCodFil := "T1M SP 02"

Local cTable 	:= "C1E"
Local cQuery 	:= ""

//-- Limpo a tabela
DelC1E( cCodFil )

//-- Seto a operação
oModel:SetOperation(MODEL_OPERATION_INSERT)
oModel:Activate()

oHelper	:= FWTestHelper():New()
oHelper:SetModel(oModel)
oHelper:Activate()

//-- SetValue
oHelper:UTSetValue('MODEL_C1E','C1E_ID'    ,cID) //Caracter - Tamanho: 02
oHelper:UTSetValue('MODEL_C1E','C1E_FILTAF',cFilTaf) //Caracter - Tamanho: 02
oHelper:UTSetValue('MODEL_C1E','C1E_CODFIL',cCodFil) //Caracter - Tamanho: 02


//-- Confirma Inclusão
oHelper:UTCommitData()

//-- Ponto de verificação
cQuery := "C1E_FILIAL = '" + xFilial("C1E") + "' AND C1E_ID = '" + cID + "'"

oHelper:UTQueryDB(cTable,'C1E_ID'    ,cQuery,cID)
oHelper:UTQueryDB(cTable,'C1E_FILTAF',cQuery,cFilTaf)
oHelper:UTQueryDB(cTable,'C1E_CODFIL',cQuery,cCodFil)

oHelper:AssertTrue(oHelper:lOk,'')


Return oHelper
//-------------------------------------------------------------------
/*/{Protheus.doc} TAFA050_003 Inclusão
Caso de Teste 003, via TDD
Inclusão de novo registro (TAFA050) - Preenchimento de Todos os Campos (Complemento de Empresa) / Exclusão do registro.

@author Denis R. de Oliveira
@since 11/03/2016
@version 1.0
/*/
//-------------------------------------------------------------------
/*METHOD TAF050_003() CLASS TAFA050TestCase
Local oHelper  := FWTestHelper():New()
Local oModel   := FWLoadModel('TAFA050')
Local cID1		:= ""  
Local cID2		:= ""   
Local cID		:= ""   
Local cFilTaf := "M SP 02 "
Local cCodFil := "T1M SP 02"
Local cFilTaf1 := "M SP 01 "
Local cCodFil1 := "T1M SP 01"
Local cFilTaf2 := "M PR 01 "
Local cCodFil2 := "T1M PR 01"


Local cTable 	:= "C1E"
Local cQuery, cQuery1, cQuery2, cQuery3, cQuery4, cQuery5

//-- Limpo as tabelas
oHelper:Activate()
oHelper:UTClearDB( { "C1E", "C1F", "CUW", "CR9","CZR" } )
oHelper:DeActivate()

//crio 2 filiais para SCP
oModel:SetOperation(MODEL_OPERATION_INSERT)
oModel:Activate()

oHelper	:= FWTestHelper():New()
oHelper:SetModel(oModel)
oHelper:Activate()

//-- Filial 1 SCP
cID1		:= GetSx8Num("C1E","C1E_ID")   
oHelper:UTSetValue('MODEL_C1E','C1E_ID'    ,cID1) //Caracter - Tamanho: 02
oHelper:UTSetValue('MODEL_C1E','C1E_FILTAF',cFilTaf1) //Caracter - Tamanho: 02
oHelper:UTSetValue('MODEL_C1E','C1E_CODFIL',cCodFil1) //Caracter - Tamanho: 40
                                                                                                                                                                                                                                                      
//-- Confirma Inclusão
oHelper:UTCommitData()

oModel:DeActivate()
oModel:SetOperation(MODEL_OPERATION_INSERT)
oModel:Activate()

oHelper:DeActivate()

oHelper	:= FWTestHelper():New()
oHelper:SetModel(oModel)
oHelper:Activate()

//-- Filial 2 SCP
cID2		:= GetSx8Num("C1E","C1E_ID")   
oHelper:UTSetValue('MODEL_C1E','C1E_ID'    ,cID2) //Caracter - Tamanho: 02
oHelper:UTSetValue('MODEL_C1E','C1E_FILTAF',cFilTaf2) //Caracter - Tamanho: 02
oHelper:UTSetValue('MODEL_C1E','C1E_CODFIL',cCodFil2) //Caracter - Tamanho: 40
                                                                                                                                                                                                                                                      
//-- Confirma Inclusão
oHelper:UTCommitData()
oHelper:DeActivate()

//-- Seto a operação
oModel:DeActivate()
oModel:SetOperation(MODEL_OPERATION_INSERT)
oModel:Activate()

oHelper  := FWTestHelper():New()
oHelper:SetModel(oModel)
oHelper:Activate()

//-- SetValue
cID		:= GetSx8Num("C1E","C1E_ID")
oHelper:UTSetValue('MODEL_C1E','C1E_ID'    ,cID) //Caracter - Tamanho: 02
oHelper:UTSetValue('MODEL_C1E','C1E_FILTAF',cFilTaf) //Caracter - Tamanho: 02
oHelper:UTSetValue('MODEL_C1E','C1E_CODFIL',cCodFil) //Caracter - Tamanho: 40
oHelper:UTSetValue('MODEL_C1E','C1E_EMAIL' ,'FISCAL@EMAIL.COM.BR') //Caracter - Tamanho: 220
oHelper:UTSetValue('MODEL_C1E','C1E_CODFEB','1234567890') //Caracter - Tamanho: 29
oHelper:UTSetValue('MODEL_C1E','C1E_DTINI' ,'012014') //Caracter - Tamanho: 6
oHelper:UTSetValue('MODEL_C1E','C1E_DTFIN' ,'012030') //Caracter - Tamanho: 6
oHelper:UTSetValue('MODEL_C1E','C1E_NOME'  ,'RAZAO SOCIAL') //Caracter - Tamanho: 220
oHelper:UTSetValue('MODEL_C1E','C1E_CLAFIS','000019') //Caracter - Tamanho: 6
oHelper:UTSetValue('MODEL_C1E','C1E_NATJUR','000062') //Caracter - Tamanho: 6
oHelper:UTSetValue('MODEL_C1E','C1E_INCOOP','0') //Caracter - Tamanho: 1
oHelper:UTSetValue('MODEL_C1E','C1E_INCONS','0') //Caracter - Tamanho: 1
oHelper:UTSetValue('MODEL_C1E','C1E_NOMCNT','NOME TESTE') //Caracter - Tamanho: 60
oHelper:UTSetValue('MODEL_C1E','C1E_CPFCNT','41820284735') //Caracter - Tamanho: 11
oHelper:UTSetValue('MODEL_C1E','C1E_DDDFON','011') //Caracter - Tamanho: 3
oHelper:UTSetValue('MODEL_C1E','C1E_FONCNT','45458963  ') //Caracter - Tamanho: 10
oHelper:UTSetValue('MODEL_C1E','C1E_DDDCEL','011') //Caracter - Tamanho: 3
oHelper:UTSetValue('MODEL_C1E','C1E_CELCNT','36998545  ') //Caracter - Tamanho: 10
oHelper:UTSetValue('MODEL_C1E','C1E_ISEMUL','0') //Caracter - Tamanho: 1
oHelper:UTSetValue('MODEL_C1E','C1E_CRT'   ,'3') //Caracter - Tamanho: 1
oHelper:UTSetValue('MODEL_C1E','C1E_DESFOL','0') //Caracter - Tamanho: 1
oHelper:UTSetValue('MODEL_C1E','C1E_REGELT','0') //Caracter - Tamanho: 1
oHelper:UTSetValue('MODEL_C1E','C1E_SIAFI' ,'123456') //Caracter - Tamanho: 6

//-- SetValue - "Cadastro de Inscrição do Estabelecimento Substituto"
//Registro 01
oHelper:UTSetValue('MODEL_C1F','C1F_UFST','000027') //Caracter - Tamanho: 6
oHelper:UTSetValue('MODEL_C1F','C1F_IEST','781094070080') //Caracter - Tamanho: 20
oHelper:UTSetValue('MODEL_C1F','C1F_VALIDA',CTOD('01/01/2020')) //Data - Tamanho: 8

//Registro 02
oHelper:UTAddLine("MODEL_C1F")
oHelper:UTSetValue('MODEL_C1F','C1F_UFST','000020') //Caracter - Tamanho: 6
oHelper:UTSetValue('MODEL_C1F','C1F_IEST','85776762') //Caracter - Tamanho: 20
oHelper:UTSetValue('MODEL_C1F','C1F_VALIDA',CTOD('01/01/2025')) //Data - Tamanho: 8


//-- SetValue - "SCP"
//Registro 01
oHelper:UTSetValue('MODEL_CUW','CUW_CODSCP',cId1) //Caracter - Tamanho: 14
oHelper:UTSetValue('MODEL_CUW','CUW_DECSCP','DESC SCP 01') //Caracter - Tamanho: 220
oHelper:UTSetValue('MODEL_CUW','CUW_INFCOM','INF COMP 01') //Caracter - Tamanho: 220

//Registro 02
oHelper:UTAddLine("MODEL_CUW")
oHelper:UTSetValue('MODEL_CUW','CUW_CODSCP',cId2) //Caracter - Tamanho: 14
oHelper:UTSetValue('MODEL_CUW','CUW_DECSCP','DESC SCP 02') //Caracter - Tamanho: 220
oHelper:UTSetValue('MODEL_CUW','CUW_INFCOM','INF COMP 02') //Caracter - Tamanho: 220


//-- SetValue - "Outras Filiais"
//Registro 01
oHelper:UTSetValue('MODEL_CR9','CR9_CODFIL',cCodFil + '_002') //Caracter - Tamanho: 20

//Registro 02
oHelper:UTAddLine("MODEL_CR9")
oHelper:UTSetValue('MODEL_CR9','CR9_CODFIL',cCodFil + '_003') //Caracter - Tamanho: 20

//Registro 03
oHelper:UTAddLine("MODEL_CR9")
oHelper:UTSetValue('MODEL_CR9','CR9_CODFIL',cCodFil + '_004') //Caracter - Tamanho: 20


//-- SetValue - "Obrigações Fiscais"
//Registro 01
oHelper:UTSetValue('MODEL_CZR','CZR_IDOBRI','2044f0d3-01f7-3add-ac4e-4773eab77a26') //Caracter - Tamanho: 36

//Registro 02
oHelper:UTAddLine("MODEL_CZR")
oHelper:UTSetValue('MODEL_CZR','CZR_IDOBRI','23b21ef5-fe32-769e-7b6f-2c76b1cb488d') //Caracter - Tamanho: 36

//Registro 03
oHelper:UTAddLine("MODEL_CZR")
oHelper:UTSetValue('MODEL_CZR','CZR_IDOBRI','37302f8e-b0a9-1e4e-831c-9a8a7c596f18') //Caracter - Tamanho: 36

//Registro 04
oHelper:UTAddLine("MODEL_CZR")
oHelper:UTSetValue('MODEL_CZR','CZR_IDOBRI','49c5cc9e-887a-2c2a-b888-c705b2812ace') //Caracter - Tamanho: 36

//Registro 05
oHelper:UTAddLine("MODEL_CZR")
oHelper:UTSetValue('MODEL_CZR','CZR_IDOBRI','d30637e5-9e62-fd86-53fb-2891a664eaf2') //Caracter - Tamanho: 36


//-- Confirma Inclusão
oHelper:UTCommitData()


//-- Ponto de verificação - "Complemento do Estabelecimento"
cQuery := "C1E_FILIAL = '" + xFilial("C1E") + "' AND C1E_ID = '" + cID + "'"

oHelper:UTQueryDB(cTable,'C1E_ID'    ,cQuery,cID)
oHelper:UTQueryDB(cTable,'C1E_FILTAF',cQuery,cFilTaf)
oHelper:UTQueryDB(cTable,'C1E_CODFIL',cQuery,cCodFil)
oHelper:UTQueryDB(cTable,'C1E_EMAIL' ,cQuery,'FISCAL@EMAIL.COM.BR')
oHelper:UTQueryDB(cTable,'C1E_CODFEB',cQuery,'1234567890') 
oHelper:UTQueryDB(cTable,'C1E_DTINI' ,cQuery,'012014') 
oHelper:UTQueryDB(cTable,'C1E_DTFIN' ,cQuery,'012030')
oHelper:UTQueryDB(cTable,'C1E_NOME'  ,cQuery,'RAZAO SOCIAL')
oHelper:UTQueryDB(cTable,'C1E_CLAFIS',cQuery,'000019')
oHelper:UTQueryDB(cTable,'C1E_NATJUR',cQuery,'000062')
oHelper:UTQueryDB(cTable,'C1E_INCOOP',cQuery,'0')
oHelper:UTQueryDB(cTable,'C1E_INCONS',cQuery,'0')
oHelper:UTQueryDB(cTable,'C1E_NOMCNT',cQuery,'NOME TESTE') 
oHelper:UTQueryDB(cTable,'C1E_CPFCNT',cQuery,'41820284735')
oHelper:UTQueryDB(cTable,'C1E_DDDFON',cQuery,'011') 
oHelper:UTQueryDB(cTable,'C1E_FONCNT',cQuery,'45458963')
oHelper:UTQueryDB(cTable,'C1E_DDDCEL',cQuery,'011') 
oHelper:UTQueryDB(cTable,'C1E_CELCNT',cQuery,'36998545')
oHelper:UTQueryDB(cTable,'C1E_ISEMUL',cQuery,'0')
oHelper:UTQueryDB(cTable,'C1E_CRT'   ,cQuery,'3')
oHelper:UTQueryDB(cTable,'C1E_DESFOL',cQuery,'0')
oHelper:UTQueryDB(cTable,'C1E_REGELT',cQuery,'0')
oHelper:UTQueryDB(cTable,'C1E_SIAFI' ,cQuery,'123456')
oHelper:UTQueryDB(cTable,'C1E_EVENTO',cQuery,'I')
oHelper:UTQueryDB(cTable,'C1E_ATIVO' ,cQuery,'1')

oHelper:AssertTrue(oHelper:lOk,'')


//-- Ponto de verificação - "Cadastro de Inscrição do Estabelecimento Substituto"
cTable  := "C1F"
cQuery1 := "C1F_FILIAL = '" + xFilial("C1F") + "' AND C1F_ID = '" + cID + "' AND C1F_UFST = '000027' AND C1F_VALIDA = '20200101'"
cQuery2 := "C1F_FILIAL = '" + xFilial("C1F") + "' AND C1F_ID = '" + cID + "' AND C1F_UFST = '000020' AND C1F_VALIDA = '20250101'"

//Registro 01
oHelper:UTQueryDB(cTable,'C1F_ID'	  ,cQuery1,cID)
oHelper:UTQueryDB(cTable,'C1F_UFST'  ,cQuery1,'000027')
oHelper:UTQueryDB(cTable,'C1F_IEST'  ,cQuery1,'781094070080')
oHelper:UTQueryDB(cTable,'C1F_VALIDA',cQuery1,CTOD('01/01/2020'))
oHelper:UTQueryDB(cTable,'C1F_ATIVO' ,cQuery1,'1')

//Registro 02
oHelper:UTQueryDB(cTable,'C1F_ID'    ,cQuery2,cID)
oHelper:UTQueryDB(cTable,'C1F_UFST'  ,cQuery2,'000020')
oHelper:UTQueryDB(cTable,'C1F_IEST'  ,cQuery2,'85776762')
oHelper:UTQueryDB(cTable,'C1F_VALIDA',cQuery2,CTOD('01/01/2025'))
oHelper:UTQueryDB(cTable,'C1F_ATIVO' ,cQuery2,'1')

oHelper:AssertTrue(oHelper:lOk,'')


//-- Ponto de verificação - "SCP"
cTable  := "CUW"
cQuery1 := "CUW_FILIAL = '" + xFilial("CUW") + "' AND CUW_ID = '" + cID + "' AND CUW_CODSCP = '" + cId1 + "'"
cQuery2 := "CUW_FILIAL = '" + xFilial("CUW") + "' AND CUW_ID = '" + cID + "' AND CUW_CODSCP = '" + cId2 + "'"

//Registro 01
oHelper:UTQueryDB(cTable,'CUW_ID'    ,cQuery1,cID)
oHelper:UTQueryDB(cTable,'CUW_CODSCP',cQuery1,cId1)
//oHelper:UTQueryDB(cTable,'CUW_DECSCP',cQuery1,'DESC SCP 01')
oHelper:UTQueryDB(cTable,'CUW_INFCOM',cQuery1,'INF COMP 01')     
oHelper:UTQueryDB(cTable,'CUW_ATIVO' ,cQuery1,'1')

//Registro 02
oHelper:UTQueryDB(cTable,'CUW_ID'    ,cQuery2,cID)
oHelper:UTQueryDB(cTable,'CUW_CODSCP',cQuery2,cId2)
//oHelper:UTQueryDB(cTable,'CUW_DECSCP',cQuery2,'DESC SCP 02')
oHelper:UTQueryDB(cTable,'CUW_INFCOM',cQuery2,'INF COMP 02')     
oHelper:UTQueryDB(cTable,'CUW_ATIVO' ,cQuery2,'1')

oHelper:AssertTrue(oHelper:lOk,'')


//-- Ponto de verificação - "Outras Filiais"
cTable  := "CR9"
cQuery1 := "CR9_FILIAL = '" + xFilial("CR9") + "' AND CR9_ID = '" + cID + "' AND CR9_CODFIL = '" + cCodFil + "_002'"
cQuery2 := "CR9_FILIAL = '" + xFilial("CR9") + "' AND CR9_ID = '" + cID + "' AND CR9_CODFIL = '" + cCodFil + "_003'"                                    
cQuery3 := "CR9_FILIAL = '" + xFilial("CR9") + "' AND CR9_ID = '" + cID + "' AND CR9_CODFIL = '" + cCodFil + "_004'"                                       

//Registro 01
oHelper:UTQueryDB(cTable,'CR9_ID'    ,cQuery1,cID)
oHelper:UTQueryDB(cTable,'CR9_CODFIL',cQuery1,cCodFil + '_002')
oHelper:UTQueryDB(cTable,'CR9_ATIVO' ,cQuery1,'1')

//Registro 02
oHelper:UTQueryDB(cTable,'CR9_ID'    ,cQuery2,cID)
oHelper:UTQueryDB(cTable,'CR9_CODFIL',cQuery2,cCodFil + '_003')
oHelper:UTQueryDB(cTable,'CR9_ATIVO' ,cQuery2,'1')

//Registro 03
oHelper:UTQueryDB(cTable,'CR9_ID'    ,cQuery3,cID)
oHelper:UTQueryDB(cTable,'CR9_CODFIL',cQuery3,cCodFil + '_004')
oHelper:UTQueryDB(cTable,'CR9_ATIVO' ,cQuery3,'1')

oHelper:AssertTrue(oHelper:lOk,'')


//-- Ponto de verificação - "Obrigações Fiscais"
cTable  := "CZR"
cQuery1 := "CZR_FILIAL = '" + xFilial("CZR") + "' AND CZR_ID = '" + cID + "' AND CZR_IDOBRI = '2044f0d3-01f7-3add-ac4e-4773eab77a26'"
cQuery2 := "CZR_FILIAL = '" + xFilial("CZR") + "' AND CZR_ID = '" + cID + "' AND CZR_IDOBRI = '23b21ef5-fe32-769e-7b6f-2c76b1cb488d'"
cQuery3 := "CZR_FILIAL = '" + xFilial("CZR") + "' AND CZR_ID = '" + cID + "' AND CZR_IDOBRI = '37302f8e-b0a9-1e4e-831c-9a8a7c596f18'"
cQuery4 := "CZR_FILIAL = '" + xFilial("CZR") + "' AND CZR_ID = '" + cID + "' AND CZR_IDOBRI = '49c5cc9e-887a-2c2a-b888-c705b2812ace'"
cQuery5 := "CZR_FILIAL = '" + xFilial("CZR") + "' AND CZR_ID = '" + cID + "' AND CZR_IDOBRI = 'd30637e5-9e62-fd86-53fb-2891a664eaf2'"

//Registro 01
oHelper:UTQueryDB(cTable,'CZR_ID',cQuery1,cID)
oHelper:UTQueryDB(cTable,'CZR_IDOBRI',cQuery1,'2044f0d3-01f7-3add-ac4e-4773eab77a26')
oHelper:UTQueryDB(cTable,'CZR_ATIVO',cQuery1,'1')

//Registro 02
oHelper:UTQueryDB(cTable,'CZR_ID',cQuery2,cID)
oHelper:UTQueryDB(cTable,'CZR_IDOBRI',cQuery2,'23b21ef5-fe32-769e-7b6f-2c76b1cb488d')
oHelper:UTQueryDB(cTable,'CZR_ATIVO',cQuery2,'1')

//Registro 03
oHelper:UTQueryDB(cTable,'CZR_ID',cQuery3,cID)
oHelper:UTQueryDB(cTable,'CZR_IDOBRI',cQuery3,'37302f8e-b0a9-1e4e-831c-9a8a7c596f18')
oHelper:UTQueryDB(cTable,'CZR_ATIVO',cQuery3,'1')

//Registro 04
oHelper:UTQueryDB(cTable,'CZR_ID',cQuery4,cID)
oHelper:UTQueryDB(cTable,'CZR_IDOBRI',cQuery4,'49c5cc9e-887a-2c2a-b888-c705b2812ace')
oHelper:UTQueryDB(cTable,'CZR_ATIVO',cQuery4,'1')

//Registro 05
oHelper:UTQueryDB(cTable,'CZR_ID',cQuery5,cID)
oHelper:UTQueryDB(cTable,'CZR_IDOBRI',cQuery5,'d30637e5-9e62-fd86-53fb-2891a664eaf2')
oHelper:UTQueryDB(cTable,'CZR_ATIVO',cQuery5,'1')

oHelper:AssertTrue(oHelper:lOk,'')

//-------------------------//
//    Teste de Exclusão    //
//-------------------------//
If oHelper:lOk
	//-- Posiciono no registro a ser deletado
	If oHelper:UTFINDREG("C1E",3,cFilTaf + "1") 
		//-- Seto a Operação
		oModel:DeActivate()
		oModel:SetOperation(MODEL_OPERATION_DELETE)
		oModel:Activate()
		
		//-- Ativo a classe oHelper
		oHelper:DeActivate()
		//oHelper := FWTestHelper():New()
		oHelper:SetModel(oModel)
		oHelper:Activate()
		
		//-- Confirmo a Exclusão
		oHelper:UTCommitData()
		
		
		//-- Ponto de verificação - "Complemento do Estabelecimento"
		cTable := "C1E"
		cQuery := "C1E_FILIAL = '" + xFilial("C1E") + "' AND C1E_ID = '" + cID + "'"
		
		oHelper:UTQueryDB(cTable,'C1E_ID'    ,cQuery,cID)
		oHelper:AssertFalse(oHelper:lOk,'')
		
		
		//-- Ponto de verificação - "Cadastro de Inscrição do Estabelecimento Substituto"
		cTable  := "C1F"
		cQuery1 := "C1F_FILIAL = '" + xFilial("C1F") + "' AND C1F_ID = '" + cID + "' AND C1F_UFST = '000027' AND C1F_VALIDA = '20200101'"
		cQuery2 := "C1F_FILIAL = '" + xFilial("C1F") + "' AND C1F_ID = '" + cID + "' AND C1F_UFST = '000020' AND C1F_VALIDA = '20250101'"
		
		//Registro 01
		oHelper:UTQueryDB(cTable,'C1F_ID'	  ,cQuery1,cID)
		//Registro 02
		oHelper:UTQueryDB(cTable,'C1F_ID'    ,cQuery2,cID)
		
		oHelper:AssertFalse(oHelper:lOk,'')
		
		
		//-- Ponto de verificação - "SCP"
		cTable  := "CUW"
		cQuery1 := "CUW_FILIAL = '" + xFilial("CUW") + "' AND CUW_ID = '" + cID + "' AND CUW_CODSCP = '" + cId1 + "'"
		cQuery2 := "CUW_FILIAL = '" + xFilial("CUW") + "' AND CUW_ID = '" + cID + "' AND CUW_CODSCP = '" + cId2 + "'"
		
		//Registro 01
		oHelper:UTQueryDB(cTable,'CUW_ID'    ,cQuery1,cID)
		//Registro 02
		oHelper:UTQueryDB(cTable,'CUW_ID'    ,cQuery2,cID)
		
		oHelper:AssertFalse(oHelper:lOk,'')
		
		
		//-- Ponto de verificação - "Outras Filiais"
		cTable  := "CR9"
		cQuery1 := "CR9_FILIAL = '" + xFilial("CR9") + "' AND CR9_ID = '" + cID + "' AND CR9_CODFIL = '" + cCodFil + "_002'"
		cQuery2 := "CR9_FILIAL = '" + xFilial("CR9") + "' AND CR9_ID = '" + cID + "' AND CR9_CODFIL = '" + cCodFil + "_003'"                                    
		cQuery3 := "CR9_FILIAL = '" + xFilial("CR9") + "' AND CR9_ID = '" + cID + "' AND CR9_CODFIL = '" + cCodFil + "_004'"                                       
		
		//Registro 01
		oHelper:UTQueryDB(cTable,'CR9_ID'    ,cQuery1,cID)
		//Registro 02
		oHelper:UTQueryDB(cTable,'CR9_ID'    ,cQuery2,cID)
		//Registro 03
		oHelper:UTQueryDB(cTable,'CR9_ID'    ,cQuery3,cID)
		
		oHelper:AssertFalse(oHelper:lOk,'')
		
		
		//-- Ponto de verificação - "Obrigações Fiscais"
		cTable  := "CZR"
		cQuery1 := "CZR_FILIAL = '" + xFilial("CZR") + "' AND CZR_ID = '" + cID + "' AND CZR_IDOBRI = '2044f0d3-01f7-3add-ac4e-4773eab77a26'"
		cQuery2 := "CZR_FILIAL = '" + xFilial("CZR") + "' AND CZR_ID = '" + cID + "' AND CZR_IDOBRI = '23b21ef5-fe32-769e-7b6f-2c76b1cb488d'"
		cQuery3 := "CZR_FILIAL = '" + xFilial("CZR") + "' AND CZR_ID = '" + cID + "' AND CZR_IDOBRI = '37302f8e-b0a9-1e4e-831c-9a8a7c596f18'"
		cQuery4 := "CZR_FILIAL = '" + xFilial("CZR") + "' AND CZR_ID = '" + cID + "' AND CZR_IDOBRI = '49c5cc9e-887a-2c2a-b888-c705b2812ace'"
		cQuery5 := "CZR_FILIAL = '" + xFilial("CZR") + "' AND CZR_ID = '" + cID + "' AND CZR_IDOBRI = 'd30637e5-9e62-fd86-53fb-2891a664eaf2'"
		
		//Registro 01
		oHelper:UTQueryDB(cTable,'CZR_ID',cQuery1,cID)
		//Registro 02
		oHelper:UTQueryDB(cTable,'CZR_ID',cQuery2,cID)
		//Registro 03
		oHelper:UTQueryDB(cTable,'CZR_ID',cQuery3,cID)
		//Registro 04
		oHelper:UTQueryDB(cTable,'CZR_ID',cQuery4,cID)
		//Registro 05
		oHelper:UTQueryDB(cTable,'CZR_ID',cQuery5,cID)
		
		oHelper:AssertFalse(oHelper:lOk,'')
	Else
		oHelper:AssertTrue(.F.,'')
	EndIf
EndIf	
Return oHelper*/
//-------------------------------------------------------------------
/*/{Protheus.doc} TAFA050_004 Inclusão
Caso de Teste 004, via TDD
Inclusão de novo registro (TAFA050) - Teste de Chave Duplicada

@author Denis R. de Oliveira
@since 11/03/2016
@version 1.0
/*/
//-------------------------------------------------------------------
/*METHOD TAF050_004() CLASS TAFA050TestCase
Local oHelper	:= FWTestHelper():New()
Local oModel	:= FWLoadModel('TAFA050')

Local cID		:= GetSx8Num("C1E","C1E_ID")   
Local cFilTaf := "M SP 02 "
Local cCodFil := "T1M SP 02"

Local cTable 	:= "C1E"
Local cQuery	:= ""

//-- Limpo a tabela
DelC1E( cCodFil )

//-- Seto a operação
oModel:SetOperation(MODEL_OPERATION_INSERT)
oModel:Activate()

oHelper	:= FWTestHelper():New()
oHelper:SetModel(oModel)
oHelper:Activate()

//-- SetValue
oHelper:UTSetValue('MODEL_C1E','C1E_ID'    ,cID) //Caracter - Tamanho: 02
oHelper:UTSetValue('MODEL_C1E','C1E_FILTAF',cFilTaf) //Caracter - Tamanho: 02
oHelper:UTSetValue('MODEL_C1E','C1E_CODFIL',cCodFil) //Caracter - Tamanho: 40
//oHelper:UTSetValue('MODEL_C1E','C1E_VLDDATA',CTOD('01/02/2020')) //Data - Tamanho: 8

oHelper:UTCommitData()

//////////////////////////////////////////////////////////////////////////////////////////////
//-- Testando a inclusão de uma chave duplicada

//-- Seto a operação
oModel:DeActivate()
oModel:SetOperation(MODEL_OPERATION_INSERT)
oModel:Activate()

oHelper:DeActivate()
oHelper	:= FWTestHelper():New()
oHelper:SetModel(oModel)
oHelper:Activate()
//-- Novo ID para inclusão
cNewID		:= GetSx8Num("C1E","C1E_ID")

//-- SetValue
oHelper:UTSetValue('MODEL_C1E','C1E_ID'    ,cNewID) //Caracter - Tamanho: 02
oHelper:UTSetValue('MODEL_C1E','C1E_FILTAF',cFilTaf) //Caracter - Tamanho: 02
oHelper:UTSetValue('MODEL_C1E','C1E_CODFIL',cCodFil) //Caracter - Tamanho: 40

//-- Confirma Inclusão
oHelper:UTCommitData()


//-- Ponto de verificação
cQuery := "C1E_FILIAL = '" + xFilial("C1E") + "' AND C1E_ID = '" + cNewID + "'"

oHelper:UTQueryDB(cTable,'C1E_ID'    ,cQuery,cNewID)
oHelper:UTQueryDB(cTable,'C1E_FILTAF',cQuery,cFilTaf)
oHelper:UTQueryDB(cTable,'C1E_CODFIL',cQuery,cCodFil)
                          
oHelper:AssertFalse(oHelper:lOk,'')


Return oHelper*/
//-------------------------------------------------------------------
/*/{Protheus.doc} TAFA050_005 Alteração
Caso de Teste 005, via TDD
Alterar as informações e gravar na tabela pai C1E, e nas tabelas filhas C1F, CUW, CR9, CZR.

@author Denis R. de Oliveira
@since 11/03/2016
@version 1.0
/*/
//-------------------------------------------------------------------
METHOD TAF050_005() CLASS TAFA050TestCase

	Local oHelper       := FWTestHelper( ):New( )
	Local oModel        := FWLoadModel( "TAFA050" )
	Local oTAF050   	:= Nil
	Local oTAF050Helper := Nil

	Local cID      := ""     
	Local cFilTaf  := "M SP 02 "
	Local cCodFil  := "T1M SP 02"

	Local cID1     := ""
	Local cFilTaf1 := "M SP 01 "
	Local cCodFil1 := "T1M SP 01"

	Local cID2     := ""
	Local cFilTaf2 := "M PR 01 "
	Local cCodFil2 := "T1M PR 01"

	Local cTable   := "C1E"
	Local cQuery   := ""
	Local cLogOpe  := "2"

	oTAF050 := TAFA050TestCase( ):TAFA050TestCase( )
	oTAF050Helper := oTAF050:TAF050_024( )

	If oTAF050Helper:lOk

		// Cria a filial SCP 1
		oModel:SetOperation( MODEL_OPERATION_INSERT )
		oModel:Activate( )

		oHelper:DeActivate( )
		oHelper:SetModel( oModel )
		oHelper:Activate( )

		DelC1E( cCodFil1 )
		cID1 := GetSx8Num("C1E","C1E_ID")
		oHelper:UTSetValue('MODEL_C1E','C1E_ID'    ,cID1) //Caracter - Tamanho: 02
		oHelper:UTSetValue('MODEL_C1E','C1E_FILTAF',cFilTaf1) //Caracter - Tamanho: 02
		oHelper:UTSetValue('MODEL_C1E','C1E_CODFIL',cCodFil1) //Caracter - Tamanho: 40

		//-- Confirma Inclusão
		oHelper:UTCommitData()

		oHelper:DeActivate()
		oModel:DeActivate()

		// Cria a filial SCP 2
		oModel:SetOperation(MODEL_OPERATION_INSERT)
		oModel:Activate()
		oHelper:SetModel(oModel)
		oHelper:Activate()

		// Cria a filial SCP
		DelC1E( cCodFil2 )
		cID2 := GetSx8Num("C1E","C1E_ID")
		oHelper:UTSetValue('MODEL_C1E','C1E_ID'    ,cID2) //Caracter - Tamanho: 02
		oHelper:UTSetValue('MODEL_C1E','C1E_FILTAF',cFilTaf2) //Caracter - Tamanho: 02
		oHelper:UTSetValue('MODEL_C1E','C1E_CODFIL',cCodFil2) //Caracter - Tamanho: 40

		//-- Confirma Inclusão
		oHelper:UTCommitData()

		oHelper:DeActivate()
		oModel:DeActivate()

		oModel:SetOperation(MODEL_OPERATION_INSERT)
		oModel:Activate()

		oHelper:SetModel(oModel)
		oHelper:Activate()

		//-- SetValue
		DelC1E( cCodFil )
		cID := GetSx8Num("C1E","C1E_ID")
		oHelper:UTSetValue('MODEL_C1E','C1E_ID'    ,cID) //Caracter - Tamanho: 02
		oHelper:UTSetValue('MODEL_C1E','C1E_FILTAF',cFilTaf) //Caracter - Tamanho: 02
		oHelper:UTSetValue('MODEL_C1E','C1E_CODFIL',cCodFil) //Caracter - Tamanho: 40

		//-- SetValue - "Cadastro de Inscrição do Estabelecimento Substituto"
		oHelper:UTSetValue('MODEL_C1F','C1F_UFST' ,'000027') //Caracter - Tamanho: 6
		oHelper:UTSetValue('MODEL_C1F','C1F_IEST' ,'256800022785') //Caracter - Tamanho: 20
		oHelper:UTSetValue('MODEL_C1F','C1F_VALIDA',CTOD('01/02/2020')) //Data - Tamanho: 8

		//-- SetValue - "SCP"
		oHelper:UTSetValue('MODEL_CUW','CUW_CODSCP',cID1) //Caracter - Tamanho: 6
		oHelper:UTSetValue('MODEL_CUW','CUW_DECSCP','DESC SCP 01') //Caracter - Tamanho: 220
		oHelper:UTSetValue('MODEL_CUW','CUW_INFCOM','INF COMP 01') //Caracter - Tamanho: 220
																																																			
		//-- SetValue - "Outras Filiais"
		oHelper:UTSetValue('MODEL_CR9','CR9_CODFIL',cCodFil + '_002') //Caracter - Tamanho: 20

		//-- SetValue - "Obrigações Fiscais"
		oHelper:UTSetValue('MODEL_CZR','CZR_IDOBRI','37302f8e-b0a9-1e4e-831c-9a8a7c596f18') //Caracter - Tamanho: 36

		//-- Confirma Inclusão
		oHelper:UTCommitData()

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		If oHelper:lOk
			//-- Posiciono no registro a ser alterado
			If oHelper:UTFINDREG(cTable,5,cID) //ìndice 5 - ID
				oModel:DeActivate()
				oModel:SetOperation(MODEL_OPERATION_UPDATE)
				oModel:Activate()
				
				//Alterar o Registro
				oHelper:DeActivate()
				oHelper:SetModel(oModel)
				oHelper:Activate()
				
				//-- SetValue - "Complemento do Estabelecimento"
				oHelper:UTSetValue('MODEL_C1E','C1E_CODFIL',cCodFil + '_002') //Caracter - Tamanho: 40
				oHelper:UTSetValue('MODEL_C1E','C1E_EVENTO','A') //Caracter - Tamanho: 1
				
				//-- SetValue - "Cadastro de Inscrição do Estabelecimento Substituto"
				oHelper:UTSetValue('MODEL_C1F','C1F_UFST'  ,'000017') //Caracter - Tamanho: 6
				oHelper:UTSetValue('MODEL_C1F','C1F_IEST'  ,'553500708') //Caracter - Tamanho: 20
				oHelper:UTSetValue('MODEL_C1F','C1F_VALIDA',CTOD('01/01/2030')) //Data - Tamanho: 8
				
				//-- SetValue - "SCP"
				oHelper:UTSetValue('MODEL_CUW','CUW_CODSCP',cId2) //Caracter - Tamanho: 6
				//oHelper:UTSetValue('MODEL_CUW','CUW_DECSCP','DESC SCP 02') //Caracter - Tamanho: 220
				oHelper:UTSetValue('MODEL_CUW','CUW_INFCOM','INF COMP 02') //Caracter - Tamanho: 220
																																																					
				//-- SetValue - "Outras Filiais"
				oHelper:UTSetValue('MODEL_CR9','CR9_CODFIL',cCodFil + '_003') //Caracter - Tamanho: 20
				
				//-- SetValue - "Obrigações Fiscais"
				oHelper:UTSetValue('MODEL_CZR','CZR_IDOBRI','23b21ef5-fe32-769e-7b6f-2c76b1cb488d') //Caracter - Tamanho: 36
				
				//-- Confirma Alteração
				oHelper:UTCommitData()
				
				//-- Ponto de verificação - "Complemento do Estabelecimento"
				cQuery := "C1E_FILIAL = '" + xFilial("C1E") + "' AND C1E_ID = '" + cID + "'"
				
				oHelper:UTQueryDB(cTable,'C1E_CODFIL',cQuery,cCodFil + '_002') 
				oHelper:UTQueryDB(cTable,'C1E_EVENTO',cQuery,'A')
				oHelper:UTQueryDB( cTable, "C1E_LOGOPE" , cQuery, cLogOpe   )
				oHelper:UTQueryDB(cTable,'C1E_ATIVO' ,cQuery,'1')
				
				oHelper:AssertTrue(oHelper:lOk,'')
				
				//-- Ponto de verificação - "Cadastro de Inscrição do Estabelecimento Substituto"
				cTable := "C1F"
				cQuery := "C1F_FILIAL = '" + xFilial("C1F") + "' AND C1F_ID = '" + cID + "' AND C1F_UFST = '000017' AND C1F_VALIDA = '20300101'"
				
				oHelper:UTQueryDB(cTable,'C1F_UFST'  ,cQuery,'000017')
				oHelper:UTQueryDB(cTable,'C1F_IEST'  ,cQuery,'553500708')
				oHelper:UTQueryDB(cTable,'C1F_VALIDA',cQuery,CTOD('01/01/2030'))
				oHelper:UTQueryDB(cTable,'C1F_ATIVO' ,cQuery,'1')
				
				oHelper:AssertTrue(oHelper:lOk,'')
				
				//-- Ponto de verificação - "SCP"
				cTable := "CUW"
				cQuery := "CUW_FILIAL = '" + xFilial("CUW") + "' AND CUW_ID = '" + cID + "' AND CUW_CODSCP = '" + cId2 + "'"
				
				oHelper:UTQueryDB(cTable,'CUW_CODSCP',cQuery,cId2)
				//oHelper:UTQueryDB(cTable,'CUW_DECSCP',cQuery,'DESC SCP 02')
				oHelper:UTQueryDB(cTable,'CUW_INFCOM',cQuery,'INF COMP 02')     
				oHelper:UTQueryDB(cTable,'CUW_ATIVO' ,cQuery,'1')
				
				oHelper:AssertTrue(oHelper:lOk,'')
				
				//-- Ponto de verificação - "Outras Filiais"
				cTable := "CR9"
				cQuery := "CR9_FILIAL = '" + xFilial("CR9") + "' AND CR9_ID = '" + cID + "' AND CR9_CODFIL = '" + cCodFil + "_003'"                              
				
				oHelper:UTQueryDB(cTable,'CR9_CODFIL',cQuery,cCodFil + '_003')
				oHelper:UTQueryDB(cTable,'CR9_ATIVO' ,cQuery,'1')
				
				oHelper:AssertTrue(oHelper:lOk,'')
				
				//-- Ponto de verificação - "Obrigações Fiscais"
				cTable := "CZR"
				cQuery := "CZR_FILIAL = '" + xFilial("CZR") + "' AND CZR_ID = '" + cID + "' AND CZR_IDOBRI = '23b21ef5-fe32-769e-7b6f-2c76b1cb488d'"
				
				oHelper:UTQueryDB(cTable,'CZR_IDOBRI',cQuery,'23b21ef5-fe32-769e-7b6f-2c76b1cb488d')
				oHelper:UTQueryDB(cTable,'CZR_ATIVO' ,cQuery,'1')
				
				oHelper:AssertTrue(oHelper:lOk,'')
			Else
				oHelper:AssertTrue(.F.,'')
			EndIf
			
		EndIF
	EndIf

	oHelper:AssertTrue( oTAF050Helper:lOk )

Return oHelper
//-------------------------------------------------------------------
/*/{Protheus.doc} TAFA050_006 Validação
Caso de Teste 006, via TDD
Validar no cadastro o registro incluído, verificando se o conteúdo condiz com o layout do TAF ou Fisco. 
O registro deve ser válido (sem incosistências), e preenchido com "0" o conteúdo do campo C1E_STATUS.  

@author Denis R. de Oliveira
@since 11/03/2016
@version 1.0
/*/
//-------------------------------------------------------------------
METHOD TAF050_006() CLASS TAFA050TestCase

	Local oHelper  := FWTestHelper():New()
	Local oModel   := FWLoadModel('TAFA050')
	Local oTAF050   	:= Nil
	Local oTAF050Helper := Nil

	Local cID      := ""  
	Local cFilTaf  := "M SP 02 "
	Local cCodFil  := "T1M SP 02"

	Local cID1     := ""  
	Local cFilTaf1 := "M SP 01 "
	Local cCodFil1 := "T1M SP 01"

	Local cTable   := "C1E"
	Local cQuery   := ""
	Local cLogOpe  := "2"

	oTAF050 := TAFA050TestCase( ):TAFA050TestCase( )
	oTAF050Helper := oTAF050:TAF050_024( )

	If oTAF050Helper:lOk

		//crio 1 filial para SCP
		oModel:SetOperation(MODEL_OPERATION_INSERT)
		oModel:Activate()

		oHelper:SetModel(oModel)
		oHelper:Activate()

		//-- Filial 1
		DelC1E( cCodFil1 )
		cID1 := GetSx8Num("C1E","C1E_ID")   
		oHelper:UTSetValue('MODEL_C1E','C1E_ID'    ,cID1) //Caracter - Tamanho: 02
		oHelper:UTSetValue('MODEL_C1E','C1E_FILTAF',cFilTaf1) //Caracter - Tamanho: 02
		oHelper:UTSetValue('MODEL_C1E','C1E_CODFIL',cCodFil1) //Caracter - Tamanho: 40
																																																															
		//-- Confirma Inclusão
		oHelper:UTCommitData()

		//-- Seto a operação
		oModel:DeActivate()
		oModel:SetOperation(MODEL_OPERATION_INSERT)
		oModel:Activate()

		oHelper:DeActivate( )
		oHelper:SetModel(oModel)
		oHelper:Activate()

		//-- SetValue
		DelC1E( cCodFil )
		cID := GetSx8Num("C1E","C1E_ID")  
		oHelper:UTSetValue('MODEL_C1E','C1E_ID'    ,cID) //Caracter - Tamanho: 02
		oHelper:UTSetValue('MODEL_C1E','C1E_FILTAF',cFilTaf) //Caracter - Tamanho: 02
		oHelper:UTSetValue('MODEL_C1E','C1E_CODFIL',cCodFil) //Caracter - Tamanho: 40
		oHelper:UTSetValue('MODEL_C1E','C1E_EMAIL' ,'FISCAL@EMAIL.COM.BR') //Caracter - Tamanho: 220
		oHelper:UTSetValue('MODEL_C1E','C1E_CODFEB','1234567890') //Caracter - Tamanho: 29
		oHelper:UTSetValue('MODEL_C1E','C1E_DTINI' ,'012014') //Caracter - Tamanho: 6
		oHelper:UTSetValue('MODEL_C1E','C1E_DTFIN' ,'012030') //Caracter - Tamanho: 6
		oHelper:UTSetValue('MODEL_C1E','C1E_NOME'  ,'RAZAO SOCIAL') //Caracter - Tamanho: 220
		oHelper:UTSetValue('MODEL_C1E','C1E_CLAFIS','000019') //Caracter - Tamanho: 6
		oHelper:UTSetValue('MODEL_C1E','C1E_NATJUR','000062') //Caracter - Tamanho: 6
		oHelper:UTSetValue('MODEL_C1E','C1E_INCOOP','0') //Caracter - Tamanho: 1
		oHelper:UTSetValue('MODEL_C1E','C1E_INCONS','0') //Caracter - Tamanho: 1
		oHelper:UTSetValue('MODEL_C1E','C1E_NOMCNT','NOME TESTE') //Caracter - Tamanho: 60
		oHelper:UTSetValue('MODEL_C1E','C1E_CPFCNT','41820284735') //Caracter - Tamanho: 11
		oHelper:UTSetValue('MODEL_C1E','C1E_DDDFON','011') //Caracter - Tamanho: 3
		oHelper:UTSetValue('MODEL_C1E','C1E_FONCNT','45458963') //Caracter - Tamanho: 10
		oHelper:UTSetValue('MODEL_C1E','C1E_DDDCEL','011') //Caracter - Tamanho: 3
		oHelper:UTSetValue('MODEL_C1E','C1E_CELCNT','36998545') //Caracter - Tamanho: 10
		oHelper:UTSetValue('MODEL_C1E','C1E_ISEMUL','0') //Caracter - Tamanho: 1
		oHelper:UTSetValue('MODEL_C1E','C1E_CRT'   ,'3') //Caracter - Tamanho: 1
		oHelper:UTSetValue('MODEL_C1E','C1E_DESFOL','0') //Caracter - Tamanho: 1
		oHelper:UTSetValue('MODEL_C1E','C1E_REGELT','0') //Caracter - Tamanho: 1
		oHelper:UTSetValue('MODEL_C1E','C1E_SIAFI' ,'123456') //Caracter - Tamanho: 6
		oHelper:UTSetValue('MODEL_C1E','C1E_EVENTO','I') //Caracter - Tamanho: 1
		oHelper:UTSetValue('MODEL_C1E','C1E_ATIVO' ,'1') //Caracter - Tamanho: 1

		//-- SetValue - "Cadastro de Inscrição do Estabelecimento Substituto"
		//Registro 01
		oHelper:UTSetValue('MODEL_C1F','C1F_UFST'  ,'000027') //Caracter - Tamanho: 6
		oHelper:UTSetValue('MODEL_C1F','C1F_IEST'  ,'256800022785') //Caracter - Tamanho: 20
		oHelper:UTSetValue('MODEL_C1F','C1F_VALIDA',CTOD('31/06/2018')) //Data - Tamanho: 8

		//-- SetValue - "SCP"
		//Registro 01
		oHelper:UTSetValue('MODEL_CUW','CUW_CODSCP',cId1) //Caracter - Tamanho: 6
		oHelper:UTSetValue('MODEL_CUW','CUW_DECSCP','DESC SCP 01') //Caracter - Tamanho: 220
		oHelper:UTSetValue('MODEL_CUW','CUW_INFCOM','INF COMP 01') //Caracter - Tamanho: 220

		//-- SetValue - "Outras Filiais"
		//Registro 01
		oHelper:UTSetValue('MODEL_CR9','CR9_CODFIL',cCodFil + '_002') //Caracter - Tamanho: 20

		//-- SetValue - "Obrigações Fiscais"
		//Registro 01
		oHelper:UTSetValue('MODEL_CZR','CZR_IDOBRI','2044f0d3-01f7-3add-ac4e-4773eab77a26') //Caracter - Tamanho: 36

		//-- Confirma Inclusão
		oHelper:UTCommitData()

		///////////////////////////////////////////////////////////////////////////////////////////////

		//-- Validar Registro 

		//Posiciono no registro
		If oHelper:lOk
			//-- Posiciono no registro a ser validado
			If oHelper:UTFINDREG(cTable,5,cID) //ìndice 5 - ID 
				//Chamo a função de validação
				TAF050Vld(cTable)
				
				//Ponto de verificação - "Complemento do Estabelecimento"
				cQuery := "C1E_FILIAL = '" + xFilial("C1E") + "' AND C1E_ID = '" + cID + "'"
				
				oHelper:UTQueryDB(cTable,'C1E_ID'    ,cQuery,cID)
				oHelper:UTQueryDB(cTable,'C1E_FILTAF',cQuery,cFilTaf)
				oHelper:UTQueryDB(cTable,'C1E_CODFIL',cQuery,cCodFil)
				oHelper:UTQueryDB( cTable, "C1E_LOGOPE" , cQuery, cLogOpe )
				oHelper:UTQueryDB(cTable,'C1E_STATUS',cQuery,'0')
				oHelper:AssertTrue(oHelper:lOk,'')
			
			Else
				oHelper:AssertTrue(.F.,'')
			EndIf
		EndIf
	EndIf

	oHelper:AssertTrue( oTAF050Helper:lOk )

Return oHelper
//-------------------------------------------------------------------
/*/{Protheus.doc} TAFA050_007 Validação
Caso de Teste 008, via TDD
Validar no cadastro o registro incluído, verificando se o conteúdo condiz com o layout do TAF ou Fisco.
O registro deve ser invalido (possuir incosistências), e preenchido com "1" o conteúdo do campo C1E_STATUS.  

@author Denis R. de Oliveira
@since 11/03/2016
@version 1.0
/*/
//-------------------------------------------------------------------
METHOD TAF050_007() CLASS TAFA050TestCase

	Local oHelper  := FWTestHelper():New()
	Local oModel   := FWLoadModel('TAFA050')
	Local oTAF050   	:= Nil
	Local oTAF050Helper := Nil

	Local cID      := ""     
	Local cFilTaf  := "M SP 02 "
	Local cCodFil  := "T1M SP 02"

	Local cID1     := ""    
	Local cFilTaf1 := "M SP 01 "
	Local cCodFil1 := "T1M SP 01"

	Local cTable   := "C1E"
	Local cQuery   := ""
	Local cLogOpe  := "2"

	oTAF050       := TAFA050TestCase( ):TAFA050TestCase( )
	oTAF050Helper := oTAF050:TAF050_024( )

	If oTAF050Helper:lOk

		//-- Cria a filial SCP
		oModel:SetOperation(MODEL_OPERATION_INSERT)
		oModel:Activate()

		oHelper  := FWTestHelper():New()
		oHelper:SetModel(oModel)
		oHelper:Activate()

		//-- SetValue
		DelC1E( cCodFil1 )
		cID1 := GetSx8Num("C1E","C1E_ID") 
		oHelper:UTSetValue('MODEL_C1E','C1E_ID'    ,cID1) //Caracter - Tamanho: 02
		oHelper:UTSetValue('MODEL_C1E','C1E_FILTAF',cFilTaf1) //Caracter - Tamanho: 02
		oHelper:UTSetValue('MODEL_C1E','C1E_CODFIL',cCodFil1) //Caracter - Tamanho: 40

		//-- Confirma Inclusão
		oHelper:UTCommitData()
		oHelper:DeActivate()

		//-- Seto a operação
		oModel:DeActivate()
		oModel:SetOperation(MODEL_OPERATION_INSERT)
		oModel:Activate()

		oHelper  := FWTestHelper():New()
		oHelper:SetModel(oModel)
		oHelper:Activate()

		//-- SetValue
		DelC1E( cCodFil )
		cID := GetSx8Num("C1E","C1E_ID") 
		oHelper:UTSetValue('MODEL_C1E','C1E_ID'    ,cID) //Caracter - Tamanho: 02
		oHelper:UTSetValue('MODEL_C1E','C1E_FILTAF',cFilTaf) //Caracter - Tamanho: 02
		oHelper:UTSetValue('MODEL_C1E','C1E_CODFIL',cCodFil) //Caracter - Tamanho: 40
		oHelper:UTSetValue('MODEL_C1E','C1E_EMAIL' ,'FISCAL@EMAIL.COM.BR') //Caracter - Tamanho: 220
		oHelper:UTSetValue('MODEL_C1E','C1E_CODFEB','1234567890') //Caracter - Tamanho: 29
		oHelper:UTSetValue('MODEL_C1E','C1E_DTINI' ,'062014') //Caracter - Tamanho: 6
		oHelper:UTSetValue('MODEL_C1E','C1E_DTFIN' ,'122015') //Caracter - Tamanho: 6
		oHelper:UTSetValue('MODEL_C1E','C1E_SIGMIN','CNAS') //Caracter - Tamanho: 8

		//-- SetValue - "Cadastro de Inscrição do Estabelecimento Substituto"
		oHelper:UTSetValue('MODEL_C1F','C1F_UFST'  ,'000027') //Caracter - Tamanho: 6
		oHelper:UTSetValue('MODEL_C1F','C1F_IEST'  ,'256800022785') //Caracter - Tamanho: 20
		oHelper:UTSetValue('MODEL_C1F','C1F_VALIDA',CTOD('01/07/2020')) //Data - Tamanho: 8

		//-- SetValue - "SCP"
		//Registro 01
		oHelper:UTSetValue('MODEL_CUW','CUW_CODSCP',cID1) //Caracter - Tamanho: 14
		oHelper:UTSetValue('MODEL_CUW','CUW_DECSCP','DESC SCP 02') //Caracter - Tamanho: 220
		oHelper:UTSetValue('MODEL_CUW','CUW_INFCOM','INF COMP 02') //Caracter - Tamanho: 220

		//-- SetValue - "Outras Filiais"
		oHelper:UTSetValue('MODEL_CR9','CR9_CODFIL',cCodFil + '_002') //Caracter - Tamanho: 20

		//-- SetValue - "Obrigações Fiscais"
		oHelper:UTSetValue('MODEL_CZR','CZR_IDOBRI','2044f0d3-01f7-3add-ac4e-4773eab77a26') //Caracter - Tamanho: 36

		//-- Confirma Inclusão
		oHelper:UTCommitData()

		///////////////////////////////////////////////////////////////////////////////////////////////

		//-- Validar Registro 

		//Posiciono no registro
		If oHelper:lOk
			//-- Posiciono no registro a ser validado
			If oHelper:UTFINDREG(cTable,5,cID) //ìndice 5 - ID 
				//Chamo a função de validação
				TAF050Vld(cTable)
				
				//Ponto de verificação - "Complemento do Estabelecimento"
				cQuery := "C1E_FILIAL = '" + xFilial("C1E") + "' AND C1E_ID = '" + cID + "'"
				
				oHelper:UTQueryDB(cTable,'C1E_ID'    ,cQuery,cID)
				oHelper:UTQueryDB(cTable,'C1E_FILTAF',cQuery,cFilTaf)
				oHelper:UTQueryDB(cTable,'C1E_CODFIL',cQuery,cCodFil)
				oHelper:UTQueryDB( cTable, "C1E_LOGOPE" , cQuery, cLogOpe )
				oHelper:UTQueryDB(cTable,'C1E_STATUS',cQuery,'1')
				oHelper:AssertTrue(oHelper:lOk,'')
			Else
				oHelper:AssertTrue(.F.,'')
			EndIf
		EndIf
	EndIf	

	oHelper:AssertTrue( oTAF050Helper:lOk )

Return oHelper

//------------------------------------------------------------------
/*/{Protheus.doc} TAF050_009
Caso de Teste 009 - Inclusão manual

@author Denis Souza \ Wesley Pinheiro
@since 24/07/2018
@version 1.0

/*/
//-----------------------------------------------------------------
METHOD TAF050_009( ) CLASS TAFA050TestCase

	Local oHelper   := FWTestHelper( ):New( )
	Local oModelC1E := FwLoadModel( "TAFA050" )

	Local cTable    := "C1E"
	Local cQuery    := ""
	Local cFilial   := xFilial( cTable )
	Local cFilTaf   := "D MG 01"
	Local cCodFil   := "T1D MG 01"
	Local cDtIni    := "012018"
	Local cEvento   := "I"
	Local cAtivo    := "1"
	Local cLogOpe   := "2"

	DelC1E( cCodFil )
	
	oModelC1E:SetOperation( MODEL_OPERATION_INSERT )
	oModelC1E:Activate( )

	//-- Ativa o modelo do MVC
	oHelper:SetModel( oModelC1E )
	oHelper:Activate( )

	oHelper:UTSetValue( "MODEL_C1E", "C1E_FILTAF" , cFilTaf )
    oHelper:UTSetValue( "MODEL_C1E", "C1E_CODFIL" , cCodFil )
	oHelper:UTSetValue( "MODEL_C1E", "C1E_DTINI"  , cDtIni  )
	
	If TafLayESoc("02_05_00")
		oHelper:UTSetValue( "MODEL_C1E", "C1E_INDCP"  , '1' )
	EndIf

	//-- Realiza a gravação dos dados
	oHelper:UTCommitData( )

	cQuery := "C1E_FILIAL = '" + cFilial + "' AND C1E_CODFIL = '" + cCodFil + "' AND C1E_EVENTO = '" + cEvento + "' AND C1E_ATIVO = '" + cAtivo + "' "
	
	oHelper:UTQueryDB( cTable, "C1E_FILIAL" , cQuery, cFilial )
	oHelper:UTQueryDB( cTable, "C1E_FILTAF" , cQuery, cFilTaf )
	oHelper:UTQueryDB( cTable, "C1E_CODFIL" , cQuery, cCodFil )
	oHelper:UTQueryDB( cTable, "C1E_DTFIN" 	, cQuery, ""      )
	oHelper:UTQueryDB( cTable, "C1E_EVENTO" , cQuery, cEvento )
	oHelper:UTQueryDB( cTable, "C1E_ATIVO" 	, cQuery, cAtivo  )
	oHelper:UTQueryDB( cTable, "C1E_LOGOPE"	, cQuery, cLogOpe )
	oHelper:UTQueryDB( cTable, "C1E_STATUS"	, cQuery, ""      )
	
	If TafLayESoc("02_05_00")
		oHelper:UTQueryDB( cTable, "C1E_INDCP"	, cQuery, "1"      )
	EndIf
	
	//-- Realiza a checagem dos resultados
	oHelper:AssertTrue( )

Return oHelper

//------------------------------------------------------------------
/*/{Protheus.doc} TAF050_023
Caso de Teste 023 - Alteração manual evento não transmitido - Evento foi incluído via SaveModel ( Manual )

@author Denis Souza \ Wesley Pinheiro
@since 24/07/2018
@version 1.0

/*/
//-----------------------------------------------------------------
METHOD TAF050_023( ) CLASS TAFA050TestCase

	Local oHelper       := FWTestHelper( ):New( )
	Local oModel        := Nil
	Local oTAF050       := Nil
	Local oTAF050Helper := Nil

	Local cTable    := "C1E"
	Local cQuery    := ""
	Local cFilial   := xFilial( cTable )
	Local cFilTaf   := "D MG 01"
	Local cCodFil   := "T1D MG 01"
	Local cEvento   := "I"
	Local cAtivo    := "1"
	Local cEmail    := "TESTETAF@TESTE.COM.BR"
	Local cDtIni    := "012018"
	Local cLogOpe   := "6"

	oTAF050 := TAFA050TestCase( ):TAFA050TestCase( )
	oTAF050Helper := oTAF050:TAF050_024( )

	If oTAF050Helper:lOk

		If oHelper:UTFindReg( cTable, 7, cCodFil ) // C1E_FILIAL + C1E_CODFIL + C1E_ATIVO

			oModel:= FwLoadModel( "TAFA050" )
			oModel:SetOperation( MODEL_OPERATION_UPDATE )
			oModel:Activate( )

			//-- Ativa o modelo do MVC
			oHelper:SetModel( oModel )
			oHelper:Activate( )

			// -- Realizo a alteração da data final do cadastro
			oHelper:UTSetValue( "MODEL_C1E", "C1E_EMAIL",  cEmail )
			oHelper:UTSetValue( "MODEL_C1E", "C1E_DTINI",  cDtIni )
			
			//-- Realiza a gravação dos dados
			oHelper:UTCommitData( )

			cQuery := "C1E_FILIAL = '" + cFilial + "' AND C1E_CODFIL = '" + cCodFil + "' AND C1E_ATIVO = '" + cAtivo + "' AND C1E_EVENTO = '" + cEvento + "' "

			oHelper:UTQueryDB( cTable, "C1E_FILIAL" , cQuery, cFilial )
			oHelper:UTQueryDB( cTable, "C1E_FILTAF" , cQuery, cFilTaf )
			oHelper:UTQueryDB( cTable, "C1E_CODFIL" , cQuery, cCodFil )
			oHelper:UTQueryDB( cTable, "C1E_ATIVO" 	, cQuery, cAtivo  )
			oHelper:UTQueryDB( cTable, "C1E_EVENTO" , cQuery, cEvento )
			oHelper:UTQueryDB( cTable, "C1E_LOGOPE"	, cQuery, cLogOpe )
			oHelper:UTQueryDB( cTable, "C1E_DTINI" 	, cQuery, cDtIni  )
			oHelper:UTQueryDB( cTable, "C1E_EMAIL" 	, cQuery, cEmail  )
			oHelper:UTQueryDB( cTable, "C1E_STATUS"	, cQuery, ""      )
		
		Else
			oHelper:Activate( )
			oHelper:UTPutError( "Não foi possí­vel encontrar o registro. Verifique o índice selecionado!" )
		EndIf
	EndIf

	oHelper:AssertTrue( oTAF050Helper:lOk )

Return oHelper

//-------------------------------------------------------------------
/*/{Protheus.doc} TAFA050_024

Caso de Teste 024, via TDD

Amarração Automática 1 x 1 do Complemento de Estabelecimento ( TAFA050 )
Processo executado do tipo Tabela Vazia.

@Author	Felipe C. Seolin
@Since		26/10/2016
@Version	1.0
/*/
//-------------------------------------------------------------------
METHOD TAF050_024() CLASS TAFA050TestCase

Local oHelper	:=	FWTestHelper():New()
Local cQuery	:=	""
Local nI		:=	0
Local aSM0		:=	{}

oHelper:Activate()

oHelper:UTClearDB( { "C1E", "C1F", "CR9", "CRM", "CUW", "CZR" } )

A050Am1x1( "", 0, 0, .T., .F. )

//-- Ponto de verificação
aSM0 := FWLoadSM0( .T. )

For nI := 1 to Len( aSM0 )
	If aSM0[nI,SM0_GRPEMP] == cEmpAnt .and. aSM0[nI,SM0_USEROK] .and. ( ValType( aSM0[nI,SM0_EMPOK] ) == "U" .or. aSM0[nI,SM0_EMPOK] )
		cQuery := "C1E_FILIAL = '" + xFilial( "C1E" ) + "' AND C1E_FILTAF = '" + aSM0[nI,SM0_CODFIL] +"' "

		oHelper:UTQueryDB( "C1E", "C1E_FILTAF", cQuery, aSM0[nI,SM0_CODFIL] )
		oHelper:UTQueryDB( "C1E", "C1E_CODFIL", cQuery, cEmpAnt + aSM0[nI,SM0_CODFIL] )

		oHelper:AssertTrue( oHelper:lOk, "" )
	EndIf
Next nI

Return( oHelper )

//-------------------------------------------------------------------
/*/{Protheus.doc} TAFA050_025

Caso de Teste 025, via TDD

Amarração Automática 1 x 1 do Complemento de Estabelecimento ( TAFA050 )
Processo executado do tipo Substituir

@Author	Felipe C. Seolin
@Since		26/10/2016
@Version	1.0
/*/
//-------------------------------------------------------------------
METHOD TAF050_025() CLASS TAFA050TestCase

Local oHelper	:=	FWTestHelper():New()
Local cQuery	:=	""
Local nI		:=	0
Local aSM0		:=	{}

oHelper:Activate()

A050Am1x1( "", 0, 0, .T., .T. )

//-- Ponto de verificação
aSM0 := FWLoadSM0( .T. )

For nI := 1 to Len( aSM0 )
	If aSM0[nI,SM0_GRPEMP] == cEmpAnt .and. aSM0[nI,SM0_USEROK] .and. ( ValType( aSM0[nI,SM0_EMPOK] ) == "U" .or. aSM0[nI,SM0_EMPOK] )
		cQuery := "C1E_FILIAL = '" + xFilial( "C1E" ) + "' AND C1E_FILTAF = '" + aSM0[nI,SM0_CODFIL] +"' "

		oHelper:UTQueryDB( "C1E", "C1E_FILTAF", cQuery, aSM0[nI,SM0_CODFIL] )
		oHelper:UTQueryDB( "C1E", "C1E_CODFIL", cQuery, cEmpAnt + aSM0[nI,SM0_CODFIL] )

		oHelper:AssertTrue( oHelper:lOk, "" )
	EndIf
Next nI

Return( oHelper )

//------------------------------------------------------------------
/*/{Protheus.doc} TAF050_026
Caso de Teste 026 - Alteração via integração de um registro não transmitido - Considerando que o evento foi incluído via SaveModel ( Manual )

@author Denis Souza \ Wesley Pinheiro
@since 24/07/2018
@version 1.0

/*/
//-----------------------------------------------------------------

METHOD TAF050_026( ) CLASS TAFA050TestCase

	Local oHelper 		:= FWTestHelper( ):New( )
	Local oTAF050   	:= Nil
	Local oTAF050Helper := Nil

	Local cTable  := "C1E"
	Local cQuery  := ""
	Local cFilial := xFilial( cTable )
	Local cFilTaf := "D MG 01"
	Local cCodFil := "T1D MG 01"
	Local cCodEmp := "T1"
	Local cFolder := "AUTOMACAO_TAF050_026" //-- Diretório a partir da "\baseline" para isolar os arquivos do caso de teste
	Local cXml    := "t1_d mg 01_s-1000_TAF050_026.xml" //-- Arquivo xml a ser integrado
	Local cEvento := "I"
	Local cAtivo  := "1"
	Local cLogOpe := "5"

	oTAF050       := TAFA050TestCase( ):TAFA050TestCase( )
	oTAF050Helper := oTAF050:TAF050_023( )
	oHelper:Activate( )

	If oTAF050Helper:lOk

		TafGetXml( cFilial, cCodEmp, cFolder, cXml, oHelper )
		
		cQuery := "C1E_FILIAL = '" + cFilial + "' AND C1E_CODFIL = '" + cCodFil + "' AND C1E_ATIVO = '" + cAtivo + "' AND C1E_EVENTO = '" + cEvento + "' "

		oHelper:UTQueryDB( cTable, "C1E_FILIAL" , cQuery, cFilial  )
		oHelper:UTQueryDB( cTable, "C1E_FILTAF" , cQuery, cFilTaf  )
		oHelper:UTQueryDB( cTable, "C1E_CODFIL" , cQuery, cCodFil  )
		oHelper:UTQueryDB( cTable, "C1E_ATIVO" 	, cQuery, cAtivo   )
		oHelper:UTQueryDB( cTable, "C1E_EVENTO" , cQuery, cEvento  )
		oHelper:UTQueryDB( cTable, "C1E_LOGOPE" , cQuery, cLogOpe  )
		oHelper:UTQueryDB( cTable, "C1E_DTFIN" 	, cQuery, "042050" )
		oHelper:UTQueryDB( cTable, "C1E_STATUS"	, cQuery, ""       )

	EndIf

	oHelper:AssertTrue( oTAF050Helper:lOk )
	
Return oHelper

//------------------------------------------------------------------
/*/{Protheus.doc} TAF050_027
Caso de Teste 027 - Alteração manual evento transmitido - Considerando que o evento foi incluído via SaveModel ( Manual )

@author Denis Souza \ Wesley Pinheiro
@since 24/07/2018
@version 1.0

/*/
//-----------------------------------------------------------------

METHOD TAF050_027( ) CLASS TAFA050TestCase

	Local oHelper       := FWTestHelper( ):New( )
	Local oModel        := Nil
	Local oTAF050       := Nil
	Local oTAF050Helper := Nil

	Local cTable    := "C1E"
	Local cQuery    := ""
	Local cFilial   := xFilial( cTable )
	Local cFilTaf   := "D MG 01"
	Local cCodFil   := "T1D MG 01"
	Local cStatus   := "4"
	Local cProtul   := "123456"
	Local cEvento   := "A"
	Local cAtivo    := "1"
	Local cDtFinAlt := "012050"
	Local cLogOpe   := "6"

	oTAF050 := TAFA050TestCase( ):TAFA050TestCase( )
	oTAF050Helper := oTAF050:TAF050_023( )

	If oTAF050Helper:lOk

		If oHelper:UTFindReg( cTable, 7, cCodFil ) // C1E_FILIAL + C1E_CODFIL + C1E_ATIVO
			
			//-- Simula transmissão
			C1E->( RecLock( cTable, .F. ) )
			C1E->C1E_STATUS := cStatus
			C1E->C1E_PROTUL := cProtul
			C1E->( MsUnlock( ) )

			oModel:= FwLoadModel( "TAFA050" )
			oModel:SetOperation( MODEL_OPERATION_UPDATE )
			oModel:Activate( )

			//-- Ativa o modelo do MVC
			oHelper:SetModel( oModel )
			oHelper:Activate( )
			
			// -- Realizo a alteração da data final do cadastro
			oHelper:UTSetValue( "MODEL_C1E", "C1E_DTFIN", cDtFinAlt )

			//-- Realiza a gravação dos dados
			oHelper:UTCommitData( )

			//-- Verifico se inativou o evento anterior
			cQuery := "C1E_FILIAL = '" + cFilial + "' AND C1E_CODFIL = '" + cCodFil + "' AND C1E_ATIVO = '2' AND C1E_EVENTO = 'I' "
			
			oHelper:UTQueryDB( cTable, "C1E_FILIAL" , cQuery, cFilial )
			oHelper:UTQueryDB( cTable, "C1E_FILTAF" , cQuery, cFilTaf )
			oHelper:UTQueryDB( cTable, "C1E_CODFIL" , cQuery, cCodFil )
			oHelper:UTQueryDB( cTable, "C1E_STATUS" , cQuery, cStatus )
			oHelper:UTQueryDB( cTable, "C1E_PROTUL" , cQuery, cProtul )
			oHelper:UTQueryDB( cTable, "C1E_ATIVO" 	, cQuery, "2"     )
			oHelper:UTQueryDB( cTable, "C1E_EVENTO" , cQuery, "I"     )
			oHelper:UTQueryDB( cTable, "C1E_LOGOPE"	, cQuery, cLogOpe )

			//-- Verifico se criou novo evento a ser transmitido
			cQuery := "C1E_FILIAL = '" + cFilial + "' AND C1E_CODFIL = '" + cCodFil + "' AND C1E_ATIVO = '" + cAtivo + "' AND C1E_EVENTO = '" + cEvento + "' "

			oHelper:UTQueryDB( cTable, "C1E_FILIAL" , cQuery, cFilial   )
			oHelper:UTQueryDB( cTable, "C1E_FILTAF" , cQuery, cFilTaf   )
			oHelper:UTQueryDB( cTable, "C1E_CODFIL" , cQuery, cCodFil   )
			oHelper:UTQueryDB( cTable, "C1E_ATIVO" 	, cQuery, cAtivo    )
			oHelper:UTQueryDB( cTable, "C1E_EVENTO" , cQuery, cEvento   )
			oHelper:UTQueryDB( cTable, "C1E_DTFIN" 	, cQuery, cDtFinAlt )
			oHelper:UTQueryDB( cTable, "C1E_LOGOPE"	, cQuery, cLogOpe   )
			oHelper:UTQueryDB( cTable, "C1E_STATUS"	, cQuery, ""        )
		
		Else
			oHelper:Activate( )
			oHelper:UTPutError( "Não foi possí­vel encontrar o registro. Verifique o índice selecionado!" )
		EndIf
	EndIf

	oHelper:AssertTrue( oTAF050Helper:lOk )

Return oHelper

//------------------------------------------------------------------
/*/{Protheus.doc} TAF050_028
Caso de Teste 028 - Alteração via integração - Considerando que o evento foi incluído via SaveModel ( Manual )

@author Denis Souza \ Wesley Pinheiro
@since 24/07/2018
@version 1.0

/*/
//-----------------------------------------------------------------

METHOD TAF050_028( ) CLASS TAFA050TestCase

	Local oHelper 		:= FWTestHelper( ):New( )
	Local oTAF050   	:= Nil
	Local oTAF050Helper := Nil

	Local cTable  := "C1E"
	Local cQuery  := ""
	Local cFilial := "        "
	Local cFilTaf := "D MG 01"
	Local cCodFil := "T1D MG 01"
	Local cCodEmp := "T1"
	Local cFolder := "AUTOMACAO_TAF050_028" //-- Diretório a partir da "\baseline" para isolar os arquivos do caso de teste
	Local cXml    := "t1_d mg 01_s-1000_TAF050_028.xml" //-- Arquivo xml a ser integrado
	Local cEvento := "I"
	Local cAtivo  := "1"
	Local cLogOpe := "5"

	oTAF050       := TAFA050TestCase( ):TAFA050TestCase( )
	oTAF050Helper := oTAF050:TAF050_027( )
	oHelper:Activate( )

	If oTAF050Helper:lOk

		TafGetXml( cFilial, cCodEmp, cFolder, cXml, oHelper )
		
		cQuery := "C1E_FILIAL = '" + cFilial + "' AND C1E_CODFIL = '" + cCodFil + "' AND C1E_ATIVO = '" + cAtivo + "' AND C1E_EVENTO = '" + cEvento + "' "
		
		oHelper:UTQueryDB( cTable, "C1E_FILIAL" , cQuery, cFilial  )
		oHelper:UTQueryDB( cTable, "C1E_FILTAF" , cQuery, cFilTaf  )
		oHelper:UTQueryDB( cTable, "C1E_CODFIL" , cQuery, cCodFil  )
		oHelper:UTQueryDB( cTable, "C1E_ATIVO" 	, cQuery, cAtivo   )
		oHelper:UTQueryDB( cTable, "C1E_EVENTO" , cQuery, cEvento  )
		oHelper:UTQueryDB( cTable, "C1E_LOGOPE" , cQuery, cLogOpe  )
		oHelper:UTQueryDB( cTable, "C1E_DTFIN" 	, cQuery, "052050" )
		oHelper:UTQueryDB( cTable, "C1E_STATUS"	, cQuery, ""       )

	EndIf

	oHelper:AssertTrue( oTAF050Helper:lOk )
	
Return oHelper

//-------------------------------------------------------------------
/*/{Protheus.doc} UTDELREG
Função criada para exclusão de registro

@Param	cAlias  - Alias da tabela do registro
		cIndice - Indice da tabela do registro
		cChave  - Chave de pesquisa do registro  
		oModel  - Objeto do Modelo MVC da rotina
		oModel  - Objeto da Classe oHelper
		
@Author Denis R. de Oliveira
@Since 18/03/2016
@Version 1.0
/*/
//-------------------------------------------------------------------
Static Function UTDELREG( cAlias, cIndice, cChave, oModel, oHelper )
Default cAlias	:= ""
Default cIndice	:= ""
Default cChave	:= ""
Default oModel	:= Nil
Default oHelper	:= Nil


dbSelectArea(cAlias)
dbSetOrder(cIndice)

//-- Posiciono no registro a ser deletado
oHelper:Activate()
oHelper:UTFINDREG(cAlias,cIndice,cChave) 

//-- Seto a Operação
oModel:SetOperation(MODEL_OPERATION_DELETE)
oModel:Activate()

//-- Ativo a classe oHelper
oHelper:DeActivate()

oHelper  := FWTestHelper():New()
oHelper:SetModel(oModel)
oHelper:Activate()

//-- Confirmo a Exclusão
oHelper:UTCommitData()

oModel:DeActivate()
oHelper:DeActivate()
Return

/*
Nova validade:  Os scripts de testes da nova validade ainda não foram implementados
Serão implementados posteriormente.

*/

//-------------------------------------------------------------------
/*/{Protheus.doc} TAF050_026
Caso de Teste 026, via TDD 
TAFA050 - S-1000 - Complemento de Empresas

Nova Validade - Inclusão de novo registro quando já existir outro com a mesma chave 
e status = '2' (Aguardando retorno do governo)

@author denis.oliveira
@since 04/01/2018
@version 1.0
/*/
//-------------------------------------------------------------------
/*METHOD TAF050_026() CLASS TAFA050TestCase

Local oHelper  := FWTestHelper():New()
Local oModel   := FWLoadModel("TAFA050")

//Dados do Registro
Local cId 		 :=  GetSx8Num("C1E","C1E_ID")
Local cDtIni   := "022018"

//Tratamento de barra para Linux - GetRemoteType() == 2 - REMOTE_LINUX
Local cBarra		:=	Iif( GetRemoteType() == 2, "/", "\" )

//Caminho do arquivo modelo
Local cRoothPath	:=	oHelper:cDirBaseLine

//Caminho do arquivo gerado pelo CT
Local cStartPath	:=	GetSrvProfString( "RootPath", "" ) + GetSrvProfString( "StartPath", "" )

//Diretório para isolar os arquivos do caso de teste
Local cFolder		:=	"AUTOMACAO_TAF050_026"

//Arquivo gerado pelo CT ( S-1070 )
Local cFileTest	:=	"T1D MG 01 _S-1000_AUTOMACAOTAF050_026.XML"

//Variáveis para busca de informação no banco de dados
Local cTable		:=	"C1E"
Local cQuery		:=	""

//Parâmetros da rotina
Local aPar			:=	{}
Local lOk			:=	.T.
Local lERP			:=	.F.
Local aParam		:=	{}

//Filial / Empresa
Local cCodFil		:=	"D MG 01 "
Local cCodEmp		:=	"T1"
Local cFilTaf := "M SP 02 "
Local cCodFilC1E := "T1M SP 02"

//Parâmetros de conexão com o banco
Local cMVTAFTDB	:=	PadR( GetNewPar( "MV_TAFTDB", "" ), 100 ) //Parâmetro MV_TAFTDB - TAF TOP DATABASE DO ERP
Local cMVTAFTALI	:=	PadR( GetMV( "MV_TAFTALI" ), 100 ) //Parâmetro MV_TAFTALI - TAF TOP ALIAS DO ERP
Local nMVTAFPort	:=	GetNewPar( "MV_TAFPORT", 0 ) //Parâmetro MV_TAFPORT - PORTA DO DBACCESS - DEFAULT PORTA CORRENTE
Local aTopInfo	:=	FWGetTopInfo()
Local cMVTafPort	:=	PadR( Iif( nMVTAFPort == 0, AllTrim( Str( aTopInfo[03] ) ), AllTrim( Str( nMVTAFPort ) ) ), 100 )


//-- Limpo as tabelas
oHelper:Activate()
oHelper:UTClearDB( { "C1E", "C1F", "CUW", "CR9","CZR" } )
oHelper:DeActivate()

//-- Seto a Operação / Model
oModel:SetOperation(MODEL_OPERATION_INSERT)
oModel:Activate()

oHelper:SetModel(oModel)
oHelper:Activate()

//-------------------------------------------------------------------------------------------------------------------------------\\
//-------------------------------------------------- Inclusão Manual ------------------------------------------------------------\\
//-------------------------------------------------------------------------------------------------------------------------------\\

//-- Fecho o Ambiente
oHelper:UTCloseFilial()

//-- Reabro o ambiente
oHelper:UTOpenFilial(cCodEmp,cCodFil)

//-- SetValue
oHelper:UTSetValue('MODEL_C1E','C1E_ID'    ,cID) //Caracter - Tamanho: 02
oHelper:UTSetValue('MODEL_C1E','C1E_FILTAF',cFilTaf) //Caracter - Tamanho: 02
oHelper:UTSetValue('MODEL_C1E','C1E_CODFIL',cCodFil) //Caracter - Tamanho: 40
oHelper:UTSetValue('MODEL_C1E','C1E_DTINI' , cDtIni)

//-- Inclusão
oHelper:UTCommitData()

//-- Ponto de verificação
cQuery := "C1E_FILIAL = '" + xFilial("C1E") + "' AND C1E_ID = '" + cId + "'"

oHelper:UTQueryDB(cTable, 'C1E_FILTAF',cFilTaf) //Caracter - Tamanho: 02
oHelper:UTQueryDB(cTable, 'C1E_CODFIL',cCodFil) //Caracter - Tamanho: 40
oHelper:UTQueryDB(cTable, 'C1E_DTINI' , cDtIni)

oHelper:AssertFalse(oHelper:lOk,"")

//-------------------------------------------------------------------------------------------------------------------------------\\
//------------------------------------------------- Integração ( TAFA500 ) ------------------------------------------------------\\
//-------------------------------------------------------------------------------------------------------------------------------\\

//Verifica se o processo está OK, para continuar os testes
If oHelper:lOk

	//Necessário instanciar novamente a classe, pois ao configurar um modelo, o método UTCommitData sempre esperar persistir o modelo
	oHelper := FWTestHelper():New()
	oHelper:Activate()
	
	//Metódo de Importação - ( 2 - Importa TXT ; 3 - Importa XML )
	MV_PAR01 := 3

	//Altera o parâmetro - Caminho do arquivo a ser importado
	//Utiliza diretório isolado para importar os arquivos do caso de teste
	oHelper:UTSetParam( "MV_DIMPTAF", cRoothPath + cFolder, .T. )

	//Parâmetros das rotinas de importação
	aAdd( aParam, cCodEmp )
	aAdd( aParam, cCodFil )
	aAdd( aParam, "" )

	//Parâmetros das rotinas de integração
	aPar := { 2, cMVTAFTALI, cMVTAFTDB, cCodEmp, cCodFil, cMVTafPort }
	
	//Exclui os registros na tabela TAFST2
	oHelper:UTClearDB( { "TAFST2" } )
	
	//Criação de diretório para isolar os arquivos deste caso de teste
	FWMakeDir( cRoothPath + cFolder )

	//Copia arquivos deste caso de teste para diretório isolado
	Copy File &( cRoothPath + cFileTest ) To &( cRoothPath + cFolder + cBarra + cFileTest )

	//Chamada da Rotina - Importação do arquivo xml
	oHelper:UTCommitData( { |a| TAFA500( a ) }, aParam )

	//Chamada da Rotina - Integração ( Job 2 )
	oHelper:UTCommitData( { |a,b,c,d,e| TAFAInteg( a, b, c, d, e ) }, aPar,,, lOk, lERP )

	//Fecha o Ambiente - Necessário após a execução do TAFAINTEG
	oHelper:UTCloseFilial()

	//Reabre o ambiente
	oHelper:UTOpenFilial( cCodEmp, cCodFil )

	//Retorna os parâmetros ao default
	oHelper:UTRestParam( oHelper:aParamCT )

EndIf

//-------------------------------------------------------------------------------------------------------------------------------\\
//------------------------------------------- Valido Registros Integrados -------------------------------------------------------\\
//-------------------------------------------------------------------------------------------------------------------------------\\

//Verifica se o processo está OK, para continuar os testes
If oHelper:lOk
	
	//-- Ponto de verificação
	cQuery := "C1E_FILIAL = '" + xFilial("C1E") + "' AND C1E_FILTAF = '" + cFilTaf + "' AND C1E_CODFIL = '" + cCodFil + "' AND C1E_DTINI = '" + cDtIni + "'"
	
	
	oHelper:UTQueryDB(cTable, "C1E_FILTAF", cQuery, cFilTaf)
	oHelper:UTQueryDB(cTable, "C1E_DTINI" , cQuery, cDtIni)
	oHelper:UTQueryDB(cTable, "C1E_CODFIL", cQuery, cCodFil)
	oHelper:UTQueryDB(cTable, "C1E_STATUS", cQuery, "")
		
	oHelper:AssertFalse(oHelper:lOk,"")
	If !oHelper:lOk
		oHelper:AddMessages(CRLF + STR0028 + "S-1000" + STR0029 + " Complemento de Empresas " + STR0030 + CRLF)
	EndIf

EndIf

Return oHelper

*/

//------------------------------------------------------------------
/*/{Protheus.doc} TAF050_038
Caso de Teste 038 - Inclusão de dados complementares via integração

@author Denis Souza \ Wesley Pinheiro
@since 18/07/2018
@version 1.0
@obs: A filial já deve esta cadastrada na tabela C1E ( neste caso "D MG 01" devido configuração do testsuite )
As informações contidas no xml são dados complementares que vão ser amarrados a filial logada no momento da importação
Portanto a operação realizada é de UPDATE, não de INSERT, por isso o campo C1E_LOGOPE é preenchido com o valor "5"

/*/
//-----------------------------------------------------------------

METHOD TAF050_038( ) CLASS TAFA050TestCase

	Local oHelper       := FWTestHelper( ):New( )
	Local oTAF050       := Nil
	Local oTAF050Helper := Nil

	Local cTable  := "C1E"
	Local cQuery  := ""
	Local cFilial := xFilial( cTable )
	Local cFilTaf := "D MG 01"
	Local cCodEmp := "T1"
	Local cFolder := "AUTOMACAO_TAF050_038" //-- Diretório a partir da "\baseline" para isolar os arquivos do caso de teste
	Local cXml    := "t1_d mg 01_s-1000_TAF050_038.xml" //-- Arquivo xml a ser integrado
	Local cCodFil := "T1D MG 01"
	Local cEmail  := "TESTE@TESTE.COM.BR"
	Local cDtIni  := "012018"
	Local cEvento := "I"
	Local cAtivo  := "1"
	Local cLogOpe := "5"

	oTAF050       := TAFA050TestCase( ):TAFA050TestCase( )
	oTAF050Helper := oTAF050:TAF050_024( )
	oHelper:Activate( )

	If oTAF050Helper:lOk

		TafGetXml( cFilial, cCodEmp, cFolder, cXml, oHelper )

		cQuery := "C1E_FILIAL = '" + cFilial + "' AND C1E_CODFIL = '" + cCodFil + "' AND C1E_ATIVO = '" + cAtivo + "' AND C1E_EVENTO = '" + cEvento + "' "

		oHelper:UTQueryDB( cTable, "C1E_FILIAL" , cQuery, cFilial )
		oHelper:UTQueryDB( cTable, "C1E_FILTAF" , cQuery, cFilTaf )
		oHelper:UTQueryDB( cTable, "C1E_CODFIL" , cQuery, cCodFil )
		oHelper:UTQueryDB( cTable, "C1E_DTINI" 	, cQuery, cDtIni  )
		oHelper:UTQueryDB( cTable, "C1E_EMAIL" 	, cQuery, cEmail  )
		oHelper:UTQueryDB( cTable, "C1E_ATIVO" 	, cQuery, cAtivo  )
		oHelper:UTQueryDB( cTable, "C1E_EVENTO" , cQuery, cEvento )
		oHelper:UTQueryDB( cTable, "C1E_LOGOPE" , cQuery, cLogOpe )
		oHelper:UTQueryDB( cTable, "C1E_STATUS"	, cQuery, ""      )

	EndIf

	oHelper:AssertTrue( oTAF050Helper:lOk )

Return oHelper

//------------------------------------------------------------------
/*/{Protheus.doc} TAF050_039
Caso de Teste 037 Alteração via integração evento não transmitido
Considerando que a edição do evento dos dados complementares foi incluído via TAFxxxGrv ( Integração )

@author Denis Souza \ Wesley Pinheiro
@since 18/07/2018
@version 1.0

/*/
//-----------------------------------------------------------------

METHOD TAF050_039( ) CLASS TAFA050TestCase

	Local oHelper       := FWTestHelper( ):New( )
	Local oTAF050       := Nil
	Local oTAF050Helper := Nil

	Local cTable  := "C1E"
	Local cQuery  := ""
	Local cFilial := xFilial( cTable )
	Local cFilTaf := "D MG 01"
	Local cCodEmp := "T1"
	Local cFolder := "AUTOMACAO_TAF050_039" //-- Diretório a partir da "\baseline" para isolar os arquivos do caso de teste
	Local cXml    := "t1_d mg 01_s-1000_TAF050_039.xml" //-- Arquivo xml a ser integrado
	Local cCodFil := "T1D MG 01"
	Local cEmail  := "TESTE2@TESTE.COM.BR"
	Local cEvento := "I"
	Local cAtivo  := "1"
	Local cLogOpe := "5"

	oTAF050       := TAFA050TestCase( ):TAFA050TestCase( )
	oTAF050Helper := oTAF050:TAF050_038( )
	oHelper:Activate( )

	If oTAF050Helper:lOk

		TafGetXml( cFilial, cCodEmp, cFolder, cXml, oHelper )

		cQuery := "C1E_FILIAL = '" + cFilial + "' AND C1E_CODFIL = '" + cCodFil + "' AND C1E_ATIVO = '" + cAtivo + "' AND C1E_EVENTO = '" + cEvento + "' "

		oHelper:UTQueryDB( cTable, "C1E_FILIAL" , cQuery, cFilial  )
		oHelper:UTQueryDB( cTable, "C1E_FILTAF" , cQuery, cFilTaf  )
		oHelper:UTQueryDB( cTable, "C1E_CODFIL" , cQuery, cCodFil  )
		oHelper:UTQueryDB( cTable, "C1E_ATIVO" 	, cQuery, cAtivo   )
		oHelper:UTQueryDB( cTable, "C1E_EVENTO" , cQuery, cEvento  )
		oHelper:UTQueryDB( cTable, "C1E_LOGOPE" , cQuery, cLogOpe  )
		oHelper:UTQueryDB( cTable, "C1E_DTFIN" 	, cQuery, "012049" )
		oHelper:UTQueryDB( cTable, "C1E_EMAIL" 	, cQuery, cEmail   )
		oHelper:UTQueryDB( cTable, "C1E_STATUS"	, cQuery, ""       )

	EndIf

	oHelper:AssertTrue( oTAF050Helper:lOk )

Return oHelper

//------------------------------------------------------------------
/*/{Protheus.doc} TAF050_040
Caso de Teste 040 Alteração manual evento não transmitido - Considerando que o evento dos dados complementares foi editado via TAFxxxGrv ( Integração )

@author Denis Souza \ Wesley Pinheiro
@since 18/07/2018
@version 1.0

/*/
//-----------------------------------------------------------------

METHOD TAF050_040( ) CLASS TAFA050TestCase

	Local oHelper		:= FWTestHelper( ):New( )
	Local oModel 		:= Nil
	Local oTAF050       := Nil
	Local oTAF050Helper := Nil

	Local cTable	:= "C1E"
	Local cQuery	:= ""
	Local cFilial   := xFilial( cTable )
	Local cFilTaf   := "D MG 01"
	Local cCodFil   := "T1D MG 01"
	Local cEvento   := "I"
	Local cAtivo    := "1"
	Local cEmail    := "TESTETAF@TESTE.COM.BR"
	Local cDtFinAlt := "122069"
	Local cLogOpe   := "6"
	
	oTAF050       := TAFA050TestCase( ):TAFA050TestCase( )
	oTAF050Helper := oTAF050:TAF050_039( )

	If oTAF050Helper:lOk

		If oHelper:UTFindReg( cTable, 7, cCodFil ) // C1E_FILIAL + C1E_CODFIL + C1E_ATIVO

			oModel := FwLoadModel( "TAFA050" )
			oModel:SetOperation( MODEL_OPERATION_UPDATE )
			oModel:Activate( )

			//-- Ativa o modelo do MVC
			oHelper:SetModel( oModel )
			oHelper:Activate( )

			// -- Realizo a alteração da data final do cadastro
			oHelper:UTSetValue( "MODEL_C1E", "C1E_EMAIL",  cEmail    )
			oHelper:UTSetValue( "MODEL_C1E", "C1E_DTFIN",  cDtFinAlt )

			//-- Realiza a gravação dos dados
			oHelper:UTCommitData( )	

			cQuery := "C1E_FILIAL = '" + cFilial + "' AND C1E_CODFIL = '" + cCodFil + "' AND C1E_ATIVO = '" + cAtivo + "' AND C1E_EVENTO = '" + cEvento + "' "

			oHelper:UTQueryDB( cTable, "C1E_FILIAL" , cQuery, cFilial   )
			oHelper:UTQueryDB( cTable, "C1E_FILTAF" , cQuery, cFilTaf   )
			oHelper:UTQueryDB( cTable, "C1E_CODFIL" , cQuery, cCodFil   )
			oHelper:UTQueryDB( cTable, "C1E_ATIVO" 	, cQuery, cAtivo    )
			oHelper:UTQueryDB( cTable, "C1E_EVENTO" , cQuery, cEvento   )
			oHelper:UTQueryDB( cTable, "C1E_LOGOPE" , cQuery, cLogOpe   )
			oHelper:UTQueryDB( cTable, "C1E_EMAIL" 	, cQuery, cEmail    )
			oHelper:UTQueryDB( cTable, "C1E_DTFIN" 	, cQuery, cDtFinAlt )
			oHelper:UTQueryDB( cTable, "C1E_STATUS"	, cQuery, ""        )

		Else
			oHelper:Activate( )
			oHelper:UTPutError( "Não foi possí­vel encontrar o registro. Verifique o índice selecionado!" )
		EndIf
	EndIf

	oHelper:AssertTrue( oTAF050Helper:lOk )

Return oHelper

//------------------------------------------------------------------
/*/{Protheus.doc} TAF050_041
Caso de Teste 041 Retificação via integração evento transmitido - Considerando que o evento dos dados complementares foi editado via TAFxxxGrv ( Integração )

@author Denis Souza \ Wesley Pinheiro
@since 18/07/2018
@version 1.0

/*/
//-----------------------------------------------------------------

METHOD TAF050_041( ) CLASS TAFA050TestCase

	Local oHelper		:= FWTestHelper( ):New( )
	Local oTAF050       := Nil
	Local oTAF050Helper := Nil

	Local cTable  := "C1E"
	Local cQuery  := ""
	Local cCodFil := "T1D MG 01"
	Local cEmail  := ""
	Local cCodEmp := "T1"
	Local cFolder := "AUTOMACAO_TAF050_041" //-- Diretório a partir da "\baseline" para isolar os arquivos do caso de teste
	Local cXml    := "t1_d mg 01_s-1000_TAF050_041.xml" //-- Arquivo xml a ser integrado
	Local cStatus := ""
	Local cProtul := ""
	Local cEvento := ""
	Local cAtivo  := ""

	//-- Limpo a tabela
	DelC1E( cCodFil )

	oTAF050       := TAFA050TestCase( ):TAFA050TestCase( )
	oTAF050Helper := oTAF050:TAF050_038( )
	oHelper:Activate( )

	If oTAF050Helper:lOk

		If oHelper:UTFindReg( cTable, 7, cCodFil ) // C1E_FILIAL + C1E_CODFIL + C1E_ATIVO
			
			//-- Simula transmissão
			C1E->( RecLock( cTable, .F. ) )
			C1E->C1E_STATUS := cStatus
			C1E->C1E_PROTUL := cProtul
			C1E->( MsUnlock( ) )

			TafGetXml( cFilial, cCodEmp, cFolder, cXml, oHelper )

			//-- Verifico se inativou o evento anterior
			cQuery := "C1E_CODFIL = 'T1D MG 01' AND C1E_ATIVO = '2' AND C1E_EVENTO = 'I' "
			
			oHelper:UTQueryDB( cTable, "C1E_EMAIL" 	, cQuery, cEmail  )
			oHelper:UTQueryDB( cTable, "C1E_ATIVO" 	, cQuery, cAtivo    )
			oHelper:UTQueryDB( cTable, "C1E_EVENTO" , cQuery, cEvento   )
			
	
		Else
			oHelper:Activate( )
			oHelper:UTPutError( "Não foi possí­vel encontrar o registro. Verifique o índice selecionado!" )
		EndIf
	EndIf

	oHelper:AssertTrue( oTAF050Helper:lOk )

Return oHelper

//------------------------------------------------------------------
/*/{Protheus.doc} TAF050_042
Caso de Teste 042 Alteração manual evento transmitido - Considerando que o evento dos dados complementares foi editado via TAFxxxGrv ( Integração )

@author Denis Souza \ Wesley Pinheiro
@since 18/07/2018
@version 1.0

/*/
//-----------------------------------------------------------------

METHOD TAF050_042( ) CLASS TAFA050TestCase

	Local oHelper		:= FWTestHelper( ):New( )
	Local oModelC1E 	:= Nil
	Local oTAF050       := Nil
	Local oTAF050Helper := Nil

	Local cTable    := "C1E"
	Local cQuery    := ""
	Local cFilial   := xFilial( cTable )
	Local cFilTaf   := "D MG 01"
	Local cCodFil	:= Padr( "T1D MG 01" , TamSX3( "C1E_CODFIL" )[1] )
	Local cEvento   := ""
	Local cAtivo    := ""
	Local cEmail    := "TESTE2@TESTE.COM.BR"
	Local cDtFinAlt	:= ""
	Local cLogOpe   := ""

	DelC1E( cCodFil )
	
	oTAF050       := TAFA050TestCase( ):TAFA050TestCase( )
	oTAF050Helper := oTAF050:TAF050_041( )

	If oTAF050Helper:lOk

		If oHelper:UTFindReg( cTable, 7, cCodFil + cAtivo ) // C1E_FILIAL + C1E_CODFIL + C1E_ATIVO
		
			cCodFil   := AllTrim( cCodFil )
			oModelC1E := FwLoadModel( "TAFA050" )
			oModelC1E:SetOperation( MODEL_OPERATION_UPDATE )
			oModelC1E:Activate( )

			//-- Ativa o modelo do MVC
			oHelper:SetModel( oModelC1E )
			oHelper:Activate( )
			
			oHelper:UTSetValue( "MODEL_C1E", "C1E_EMAIL",  cEmail    )
			oHelper:UTSetValue( "MODEL_C1E", "C1E_DTFIN",  cDtFinAlt )
			
			//-- Realiza a gravação dos dados
			oHelper:UTCommitData( )

			cQuery := "C1E_CODFIL = '" + cCodFil + "' AND C1E_ATIVO = '" + cAtivo + "' AND C1E_EVENTO = '" + cEvento + "' "

			//oHelper:UTQueryDB( cTable, "C1E_FILIAL" , cQuery, cFilial   )
			//oHelper:UTQueryDB( cTable, "C1E_FILTAF" , cQuery, cFilTaf   )
			//oHelper:UTQueryDB( cTable, "C1E_CODFIL" , cQuery, cCodFil   )
			oHelper:UTQueryDB( cTable, "C1E_ATIVO" 	, cQuery, cAtivo    )
			oHelper:UTQueryDB( cTable, "C1E_EVENTO" , cQuery, cEvento   )
			//oHelper:UTQueryDB( cTable, "C1E_LOGOPE" , cQuery, cLogOpe   )
			oHelper:UTQueryDB( cTable, "C1E_EMAIL" 	, cQuery, cEmail    )
			//oHelper:UTQueryDB( cTable, "C1E_DTFIN" 	, cQuery, cDtFinAlt )
			//oHelper:UTQueryDB( cTable, "C1E_STATUS"	, cQuery, ""        )

		Else
			oHelper:Activate( )
			oHelper:UTPutError( "Não foi possí­vel encontrar o registro. Verifique o índice selecionado!" )
		EndIf
	EndIf

	oHelper:AssertTrue( oTAF050Helper:lOk )

Return oHelper

//------------------------------------------------------------------
/*/{Protheus.doc} TAF050_043
Caso de Teste 043 - Inclusão de um novo registro com uma nova data de inicio de validade para uma filial que já tenha cadastro no sistema.

@author henrique.cesar
@since 04/10/2018
@version 1.0

/*/
//-----------------------------------------------------------------
METHOD TAF050_043( ) CLASS TAFA050TestCase

	Local oHelper   := FWTestHelper( ):New( )
	Local oModelC1E := FwLoadModel( "TAFA050" )

	Local cTable    := "C1E"
	Local cQuery    := ""
	Local cFilial   := xFilial( cTable )
	Local cFilTaf   := "D MG 01"
	Local cCodFil   := "T1D MG 01"
	Local cDtIni    := "092018"
	Local cEvento   := "I"
	Local cAtivo    := "1"
	Local cLogOpe   := "2"

	DelC1E( cCodFil )
	
	oModelC1E:SetOperation( MODEL_OPERATION_INSERT )
	oModelC1E:Activate( )

	//-- Ativa o modelo do MVC
	oHelper:SetModel( oModelC1E )
	oHelper:Activate( )

	//-- Cadastro de Complemento de Empresas
	oHelper:UTExecPredecessor('TAFA050TestCase','TAF050_009')

	oHelper:UTSetValue( "MODEL_C1E", "C1E_FILTAF" , cFilTaf )
    oHelper:UTSetValue( "MODEL_C1E", "C1E_CODFIL" , cCodFil )
	oHelper:UTSetValue( "MODEL_C1E", "C1E_DTINI"  , cDtIni  )

	//-- Realiza a gravação dos dados
	oHelper:UTCommitData( )

	cQuery := "C1E_FILIAL = '" + cFilial + "' AND C1E_CODFIL = '" + cCodFil + "' AND C1E_EVENTO = '" + cEvento + "' AND C1E_ATIVO = '" + cAtivo + "' "
	
	oHelper:UTQueryDB( cTable, "C1E_FILIAL" , cQuery, cFilial )
	oHelper:UTQueryDB( cTable, "C1E_FILTAF" , cQuery, cFilTaf )
	oHelper:UTQueryDB( cTable, "C1E_CODFIL" , cQuery, cCodFil )
	oHelper:UTQueryDB( cTable, "C1E_DTFIN" 	, cQuery, ""      )
	oHelper:UTQueryDB( cTable, "C1E_EVENTO" , cQuery, cEvento )
	oHelper:UTQueryDB( cTable, "C1E_ATIVO" 	, cQuery, cAtivo  )
	oHelper:UTQueryDB( cTable, "C1E_LOGOPE"	, cQuery, cLogOpe )
	oHelper:UTQueryDB( cTable, "C1E_STATUS"	, cQuery, ""      )

	//-- Realiza a checagem dos resultados
	oHelper:AssertTrue( )

Return oHelper


//-------------------------------------------------------------------
/*/{Protheus.doc} TafGetXml    
Função Auxiliar utilizada para integrar xml's nos casos de testes de automação do TAF

@parametros                      
cCodFil - Filial
cCodEmp - Empresa
cFolder - Diretório para isolar o xml do caso de teste -> Será criado a pasta dentro do diretório "\baseline"
cXml    - Arquivo xml a ser integrado -> O arquivo xml deve ser colocado no diretorio "\baseline" a partir do Rootpath ( Protheus_data )
oHelper - objeto utilizado para configurar parametro de ambiente e executar funções ADVPR

@author Denis Souza \ Wesley Pinheiro
@since 23/07/2018
@version 1.0
/*/
//-------------------------------------------------------------------

Static Function TafGetXml( cCodFil, cCodEmp, cFolder, cXml, oHelper )

	//-------------------------------------------------------------------------------------------------------------------------------\\
	//------------------------------------------------- Variáveis Execução Servidor -------------------------------------------------\\
	//-------------------------------------------------------------------------------------------------------------------------------\\

	Local cBarra     := Iif( GetRemoteType( ) == 2, "/", "\" ) //-- Tratamento de barra para Linux - GetRemoteType() == 2 - REMOTE_LINUX
	Local cRoothPath :=	oHelper:cDirBaseLine //-- Caminho do arquivo modelo
	
	//-- Parâmetros da rotina
	Local lOk        := .T.
	Local lERP       := .F.

	Local aPar       := { }
	Local aParam     := { }
	Local aXML       := { }

	Local nXML       := 0

	//Parâmetros de conexão com o banco
	Local aTopInfo   :=	FWGetTopInfo( )
	Local nMVTAFPort :=	GetNewPar( "MV_TAFPORT", 0 ) 				//Parâmetro MV_TAFPORT - PORTA DO DBACCESS - DEFAULT PORTA CORRENTE

	Local cMVTAFTDB  :=	PadR( GetNewPar( "MV_TAFTDB", "" ), 100 )	//Parâmetro MV_TAFTDB - TAF TOP DATABASE DO ERP
	Local cMVTAFTALI :=	PadR( GetMV( "MV_TAFTALI" ), 100 ) 			//Parâmetro MV_TAFTALI - TAF TOP ALIAS DO ERP
	Local cMVTafPort :=	PadR( Iif( nMVTAFPort == 0, AllTrim( Str( aTopInfo[03] ) ), AllTrim( Str( nMVTAFPort ) ) ), 100 )

	//-------------------------------------------------------------------------------------------------------------------------------\\
	//------------------------------------------------- Integração ( TAFA500 ) ------------------------------------------------------\\
	//-------------------------------------------------------------------------------------------------------------------------------\\

	//-- Metódo de Importação - ( 2 - Importa TXT ; 3 - Importa XML )
	MV_PAR01 := 3

	//-- Altera o parâmetro - Caminho do arquivo a ser importado
	//-- Utiliza diretório isolado para importar os arquivos do caso de teste
	oHelper:UTSetParam( "MV_DIMPTAF", cRoothPath + cFolder, .T. )

	//-- Parâmetros das rotinas de importação
	aAdd( aParam, cCodEmp )
	aAdd( aParam, cCodFil )
	aAdd( aParam, ""      )

	//-- Parâmetros das rotinas de integração
	aPar := { 2, cMVTAFTALI, cMVTAFTDB, cCodEmp, cCodFil, cMVTafPort }

	//-- Criação de diretório para isolar os arquivos deste caso de teste
	FWMakeDir( cRoothPath + cFolder )

	aAdd( aXML, cXml )

	//-- Copia arquivos deste caso de teste para diretório isolado
	For nXML := 1 to Len( aXML )
		Copy File &( cRoothPath + aXML[nXML] ) To &( cRoothPath + cFolder + cBarra + aXML[nXML] )
	Next nXML

	//-- Chamada da Rotina - Importação do arquivo xml
	oHelper:UTCommitData( { | a | TAFA500( a ) }, aParam )

	//-- Chamada da Rotina - Integração ( Job 2 )
	oHelper:UTCommitData( { | a, b, c, d, e | TAFAInteg( a, b, c, d, e ) }, aPar,,, lOk, lERP )

	//-- Fecha o Ambiente - Necessário após a execução do TAFAINTEG
	oHelper:UTCloseFilial( )

	//Reabre o ambiente
	oHelper:UTOpenFilial( cCodEmp, cCodFil )

	//-- Retorna os parâmetros ao default
	oHelper:UTRestParam( oHelper:aParamCT )

Return