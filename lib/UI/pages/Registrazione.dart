import 'dart:async';

import 'package:front_end_ecommerce/UI/widgets/SquareIconButton.dart';
import 'package:front_end_ecommerce/UI/widgets/InputField.dart';
import 'package:front_end_ecommerce/model/Model.dart';
import 'package:front_end_ecommerce/model/objects/Utente.dart';
import 'package:front_end_ecommerce/model/objects/DTOUtente.dart';
import 'package:front_end_ecommerce/model/support/LogInResult.dart';
import 'package:flutter/material.dart';

import '../widgets/MessaggioDialogo.dart';



class Registrazione extends StatefulWidget {
  Registrazione({required Key key}) : super(key: key);


  @override
  _Registrazione createState() => _Registrazione();
}

class _Registrazione extends State<Registrazione> {
  bool _adding = false;
  bool _logging =false;
  Utente ? _justAddedUser;
  LogInResult ? _justLoggedUser;
  bool _showMessage = false;
  String _message = '';
  bool _showMessage2 = false;

  void mostraMessaggioTemporaneo(String messaggio) {
    setState(() {
      _message = messaggio;
      _showMessage = true;
    });

    Timer(Duration(seconds: 3), () {
      setState(() {
        _showMessage = false;
      });
    });
  }

  void mostraMessaggioTemporaneo2(String messaggio) {
    setState(() {
      _message = messaggio;
      _showMessage2 = true;
    });

    Timer(Duration(seconds: 3), () {
      setState(() {
        _showMessage = false;
      });
    });
  }

  TextEditingController _codiceFiscaleFiledController = TextEditingController();
  TextEditingController _firstNameFiledController = TextEditingController();
  TextEditingController _lastNameFiledController = TextEditingController();
  TextEditingController _telephoneNumberFiledController = TextEditingController();
  TextEditingController _emailFiledController = TextEditingController();
  TextEditingController _addressFiledController = TextEditingController();
  TextEditingController _usernameController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _password2Controller=TextEditingController();
  TextEditingController _passwordControllerReg=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
            padding: EdgeInsets.all(20), // Aggiungi il padding desiderato
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
            padding: EdgeInsets.all(20),
              child: Text(
                "Se noi sei iscritto, registrati adesso",
                style: TextStyle(
                  fontSize: 35,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  InputField(
                    key:UniqueKey(),
                    labelText: "Codice fiscale",
                    controller: _codiceFiscaleFiledController,
                  ),
                  InputField(
                    key:UniqueKey(),
                    labelText: "Nome",
                    controller: _firstNameFiledController,
                  ),
                  InputField(
                    key:UniqueKey(),
                    labelText:"Cognome",
                    controller: _lastNameFiledController,
                  ),
                  InputField(
                    key:UniqueKey(),
                    labelText:"Telefono",
                    controller: _telephoneNumberFiledController,
                  ),
                  InputField(
                    key:UniqueKey(),
                    labelText:"Email",
                    controller: _emailFiledController,
                  ),
                  InputField(
                    key:UniqueKey(),
                    labelText:"Indirizzo",
                    controller: _addressFiledController,
                  ),
                  InputField(
                    isPassword: true,
                    key:UniqueKey(),
                    labelText:"Password",
                    controller: _passwordControllerReg,
                  ),
                  InputField(
                    isPassword: true,
                    key:UniqueKey(),
                    labelText:"Conferma password",
                    controller: _password2Controller,
                  ),
                  AnimatedOpacity(
                    opacity: _showMessage ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.yellow,
                      child: Text(
                        _message,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SquareIconButton(
                    key:UniqueKey(),
                    icon: Icons.how_to_reg_sharp,
                    onPressed: () {

                      _register();
                    },
                  ),

                  Center(
                      child: (_adding)
                          ? CircularProgressIndicator()
                          /*: ((_justAddedUser != null)
                          ? Text("justAddedd",)*/
                          : SizedBox.shrink()
                  ),
                ],
              ),
            ),Padding(
              padding: EdgeInsets.all(20),
                child: Text(
                  "Se sei già iscritto, inserisci le tue credenziali",
                  style: TextStyle(
                    fontSize: 35,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  InputField(
                    key:UniqueKey(),
                    labelText: "Mail",
                    controller: _usernameController,
                  ),
                  InputField(
                    isPassword: true,
                    key:UniqueKey(),
                    labelText:"Password",
                    controller: _passwordController,
                  ),
                  AnimatedOpacity(
                    opacity: _showMessage2 ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.yellow,
                      child: Text(
                        _message,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SquareIconButton(
                    key:UniqueKey(),
                    icon: Icons.how_to_reg_sharp,
                    onPressed: () {
                      _logIn();
                    },
                  ),
                  Center(
                      child: (_logging)
                          ? CircularProgressIndicator()
                          /*: ((_justLoggedUser != null)
                          ? Text(
                        //AppLocalizations.of(context).translate("just_added") + ":" + _justAddedUser!.firstName + " " + _justAddedUser!.lastName + "!"
                        "justLogged",*/
                      //)
                          : SizedBox.shrink()
                  ),
                  //),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _register() {
    setState(() {
      _adding = true;
      _justAddedUser = null;
    });
    if(_passwordControllerReg.text!=_password2Controller.text){
      showDialog(
        context: context,
        builder: (context) => MessaggioDialogo(
          titleText: "oops",
          bodyText: "Le password non coincidono",
        ),
      );
      return;
    }

    DTOUtente user = DTOUtente(

      codiceFiscale: _codiceFiscaleFiledController.text,
      nome: _firstNameFiledController.text,
      cognome: _lastNameFiledController.text,
      email: _emailFiledController.text,
      numeroTelefonico: _telephoneNumberFiledController.text,
      indirizzo: _addressFiledController.text,
      password: _passwordControllerReg.text,

    );

    Model.sharedInstance.addUser(user).then((result) {
      if(result==null)print("errore");
      setState(() {
        _adding = false;
        _justAddedUser = result;

        String message;
        if (result != null) {
          showDialog(
            context: context,
            builder: (context) => MessaggioDialogo(
              titleText: "Perfetto",
              bodyText: "Utente registrato",
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => MessaggioDialogo(
              titleText: "Ooops",
              bodyText: "Utente NON registrato",
            ),
          );
        }
      });
    });
  }


  void _logIn() {
    setState(() {
      _logging = true;
      _justLoggedUser = null;
    });

    Model.sharedInstance.logIn(_usernameController.text,_passwordController.text).then((result) {
      setState(() {
        _logging = false;
        _justLoggedUser = result!;

        String message;
        if(result==LogInResult.error_wrong_credentials){
          showDialog(
            context: context,
            builder: (context) => MessaggioDialogo(
              titleText: "Ooops",
              bodyText: "Credenziali errate. Si prega di riprovare!",
            ),
          );
        }
        if (result ==LogInResult.error_not_fully_setupped || result ==LogInResult.error_unknown) {
          showDialog(
            context: context,
            builder: (context) => MessaggioDialogo(
              titleText: "Ooops",
              bodyText: "Utente NON loggato.",
            ),
          );
        }
        else{
          showDialog(
            context: context,
            builder: (context) => MessaggioDialogo(
              titleText: "Perfetto",
              bodyText: "Sei loggato",
            ),
          );
        }
      });
    });
  }
}
