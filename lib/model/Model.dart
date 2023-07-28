import 'dart:async';
import 'dart:convert';
import 'package:front_end_ecommerce/model/objects/DTOUtente.dart';
import 'package:front_end_ecommerce/model/managers/RestManager.dart';
import 'package:front_end_ecommerce/model/objects/Autenticazione.dart';
import 'package:front_end_ecommerce/model/objects/Prodotto.dart';
import 'package:front_end_ecommerce/model/objects/ProdottoAcquisto.dart';
import 'package:front_end_ecommerce/model/objects/Utente.dart';
import 'package:front_end_ecommerce/model/support/Constants.dart';
import 'package:front_end_ecommerce/model/support/LogInResult.dart';

import 'objects/Acquisto.dart';


class Model {
  static Model sharedInstance = Model();

  RestManager _restManager = RestManager();
  Autenticazione? _authenticationData;


  Future<LogInResult?> logIn(String email, String password) async {
    try{
      Map<String, String> params = Map();
      params["grant_type"] = "password";
      params["client_id"] = Constants.CLIENT_ID;
      params["client_secret"] = Constants.CLIENT_SECRET;
      params["username"] = email;
      params["password"] = password;
      String result = await _restManager.makePostRequest(Constants.ADDRESS_AUTHENTICATION_SERVER, Constants.REQUEST_LOGIN, params, type: TypeHeader.urlencoded);
      _authenticationData = Autenticazione.fromJson(jsonDecode(result));
      if ( _authenticationData!.hasError() ) {//metto il "!" per dire che sappiamo che otrebbe essere null
        if ( _authenticationData!.error == "Invalid user credentials" ) {
          return LogInResult.error_wrong_credentials;
        } else if ( _authenticationData!.error == "Account is not fully set up" ) {
          return LogInResult.error_not_fully_setupped;
        } else {
          return LogInResult.error_unknown;
        }
      }
      _restManager.token = _authenticationData!.accessToken;
      Timer.periodic(Duration(seconds: (_authenticationData!.expiresIn - 50)), (Timer t) {
        _refreshToken();
      });

      return LogInResult.logged;
    }
    catch (e) {
      return LogInResult.error_unknown;
    }
  }

  Future<bool> _refreshToken() async {
    try {
      Map<String, String> params = Map();
      params["grant_type"] = "refresh_token";
      params["client_id"] = Constants.CLIENT_ID;
      params["client_secret"] = Constants.CLIENT_SECRET;
      params["refresh_token"] = _authenticationData!.refreshToken;
      String result = await _restManager.makePostRequest(Constants.ADDRESS_AUTHENTICATION_SERVER, Constants.REQUEST_LOGIN, params, type: TypeHeader.urlencoded);
      _authenticationData = Autenticazione.fromJson(jsonDecode(result));
      if ( _authenticationData!.hasError() ) {
        return false;
      }
      _restManager.token = _authenticationData!.accessToken;
      return true;
    }
    catch (e) {
      return false;
    }
  }

  Future<bool> logOut() async {
    try{
      Map<String, String> params = Map();
      //_restManager.token = "";
      _restManager.token =null;
      params["client_id"] = Constants.CLIENT_ID;
      //params["client_secret"] = Constants.CLIENT_SECRET;
      params["refresh_token"] = _authenticationData!.refreshToken;
      await _restManager.makePostRequest(Constants.ADDRESS_AUTHENTICATION_SERVER, Constants.REQUEST_LOGOUT, params, type: TypeHeader.urlencoded);
      return true;
    }
    catch (e) {
      return false;
    }
  }


  Future<List<Prodotto>?> searchProduct(String nome) async {
    Map<String, String> params = Map();
    params["nome"] = nome;
      String lista=await _restManager.makeGetRequest(Constants.ADDRESS_ECOMMERCE_SERVER, Constants.REQUEST_VIEW_PRODOTTI_NOME, params);
      List<Prodotto> lista2 = List<Prodotto>.from(json.decode(lista).map((i) => Prodotto.fromJson(i)).toList());
      return lista2;

  }

  Future<List<ProdottoAcquisto>?> searchCarrello() async {
    Map<String, String> params = Map();
    //params["nome"] = nome;
    try {
      String lista=await _restManager.makeGetRequest(Constants.ADDRESS_ECOMMERCE_SERVER, Constants.REQUEST_VIEW_CARELLO, params);
      print(lista);
      List<ProdottoAcquisto> lista2=List<ProdottoAcquisto>.from(json.decode(lista).map((i) => ProdottoAcquisto.fromJson(i)).toList());
      print("ci");
      print(lista2);
      print("ao");
      return lista2;
    }
    catch (e) {
      return []; // not the best solution
    }
  }

  Future<String> aggiungiAlCarrello(int id, int quantity) async {
    Map<String, String> params = Map();
    params["id"]=id.toString();
    params["quantita"] = quantity.toString();
    String result = "ERRORE intenro";
    try {
      result = await _restManager.makeGetRequest(Constants.ADDRESS_ECOMMERCE_SERVER, Constants.REQUEST_ADD_CARELLO, params);
      print("FANCULO"+result);
      print(result);
      //Acquisto a = Acquisto.fromJson(jsonDecode(result));
      if ( result == "") {
        return "Cortesemente accedere";
      }
      //_restManager.token = _authenticationData!.accessToken;
      return result;
    }
    catch (e) {
      return result; // not the best solution
    }
  }

  Future<bool> rimuoviDaCarrello(int id, int quantity) async {
    Map<String, String> params = Map();
    params["id"]=id.toString();
    params["quantita"] = quantity.toString();
    try {
      String result = await _restManager.makeGetRequest(Constants.ADDRESS_ECOMMERCE_SERVER, Constants.REQUEST_REMOVE_CARELLO, params);
      Acquisto a = Acquisto.fromJson(jsonDecode(result));
      if ( a==null ) {
        return false;
      }
      _restManager.token = _authenticationData!.accessToken;
      return true;
    }
    catch (e) {
      return false; // not the best solution
    }
  }


  Future<String> acquista() async {
    Map<String, String> params = Map();
    String result = "Errore interno";
    try {
      result = await _restManager.makePostRequest(Constants.ADDRESS_ECOMMERCE_SERVER, Constants.REQUEST_ACQUISTA, params, type: TypeHeader.urlencoded);
      //Acquisto a= Acquisto.fromJson(jsonDecode(result));
      print(result);
      /*if (result == "" ) {
        return false;
      }*/
      return result;
    }
    catch (e) {
      return result;
    }
  }


  Future<List<Prodotto>?> searchProductByGenere(String genere) async {
    Map<String, String> params = Map();
    params["genere"] = genere;
    try {
      String lista=await _restManager.makeGetRequest(Constants.ADDRESS_ECOMMERCE_SERVER, Constants.REQUEST_VIEW_PRODOTTI_CATEGORIA, params);
      //print(lista);
      List<Prodotto> lista2=List<Prodotto>.from(json.decode(lista).map((i) => Prodotto.fromJson(i)).toList());
      //print(lista2);
      return lista2;
    }
    catch (e) {
      return [];
    }
  }

  Future<List<ProdottoAcquisto>> acquistiEffettuati(int pagina) async{
    Map<String, String> params = Map();
    params["pageNumber"] = pagina.toString();
    try {
      String lista=await _restManager.makeGetRequest(Constants.ADDRESS_ECOMMERCE_SERVER, Constants.REQUEST_VIEW_AQUISTI, params);
      List<ProdottoAcquisto> lista2=List<ProdottoAcquisto>.from(json.decode(lista).map((i) => ProdottoAcquisto.fromJson(i)).toList());
      return lista2;
    }
    catch (e) {
      return [];
    }
  }

  Future<List<Prodotto>?> searchAllProduct() async {
    Map<String, String> params = Map();
    try {
      String lista=await _restManager.makeGetRequest(Constants.ADDRESS_ECOMMERCE_SERVER, Constants.REQUEST_VIEW_PRODOTTI, params);
      print(lista);
      List<Prodotto> lista2=List<Prodotto>.from(json.decode(lista).map((i) => Prodotto.fromJson(i)).toList());
      print(lista2);
      return lista2;
    }
    catch (e) {
      return []; // not the best solution
    }
  }

  /*Future<List<Prodotto>?> searchDatePurchase(List<DateTime> date) async {
    Map<String, String> params = Map();
    params["genere"] = genere;
    try {
      String lista=await _restManager.makeGetRequest(Constants.ADDRESS_ECOMMERCE_SERVER, Constants.REQUEST_VIEW_PRODOTTI_CATEGORIA, params);
      //print(lista);
      List<Prodotto> lista2=List<Prodotto>.from(json.decode(lista).map((i) => Prodotto.fromJson(i)).toList());
      //print(lista2);
      return lista2;
    }
    catch (e) {
      return [];
    }
  }*/
  Future<List<Acquisto>?> searchAllPurchase() async {
    Map<String, String> params = Map();
    try {
      String lista=await _restManager.makeGetRequest(Constants.ADDRESS_ECOMMERCE_SERVER, Constants.REQUEST_VIEW_ACQUISTI, params);
      print(lista);
      List<Acquisto> lista2=List<Acquisto>.from(json.decode(lista).map((i) => Acquisto.fromJson(i)).toList());
      print("ciao");
      print(lista2);
      return lista2;
    }
    catch (e) {
      return []; // not the best solution
    }
  }


  Future<Utente?> addUser(DTOUtente user) async {
    try {
      Map<String, String> params = Map();
      params["codiceFiscale"] = user.codiceFiscale;
      params["nome"] = user.nome;
      params["cognome"] = user.cognome;
      params["numeroTelefonico"] = user.numeroTelefonico;
      params["email"] = user.email;
      params["indirizzo"]=user.indirizzo;
      params["password"]=user.password;
      String rawResult = await _restManager.makePostRequest(Constants.ADDRESS_ECOMMERCE_SERVER, Constants.REQUEST_ADD_CLIENTE, params, type: TypeHeader.json);
      //String result = await _restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER, Constants.ACQUISTA, params, type: TypeHeader.urlencoded);
      print(rawResult);
      print("prima if");
      try{
        return Utente.fromJson(jsonDecode(rawResult));
      }
      catch (e) {
        if (e is FormatException) {
          print('Errore nella decodifica JSON: $e');
          return null;
        } else if (e is TypeError) {
          print(' $e');
          return null;
        }

      }
    }
    catch (e) {
      print("eccomi2");
      return null; // not the best solution
    }
  }
}