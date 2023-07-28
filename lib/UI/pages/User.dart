import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_ecommerce/model/objects/Acquisto.dart';
import '../../model/Model.dart';
import '../widgets/AcquistoSpecifiche.dart';
import '../widgets/ClickableButton.dart';
import '../widgets/InputField.dart';
import '../widgets/SquareIconButton.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class User extends StatefulWidget {
  const User({required Key key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  late DateTime selectedDateTime;
  bool _searching = false;
  bool filtroAttivo = false;
  List<Acquisto> _acquisti = [];

  TextEditingController _searchFiledController = TextEditingController(); //controller area di testo


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            top(),
            bottom(),
          ],
        ),
      ),
    );
  }

  Widget top() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClickableButton(
                onClick: () {
                  _selectDateTime();
                  // Azione da eseguire quando il pulsante viene cliccato
                  setState(() {
                    if (filtroAttivo == true) {
                      filtroAttivo = false;
                    } else {
                      filtroAttivo = true;
                    }

                  });

                },
                buttonText: 'Fitra per data',
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey, // Colore di sfondo del bottone
                    foregroundColor: Colors.white, // Colore del testo del bottone
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2), // Imposta il raggio dei bordi desiderato
                    ),
                  ),
                  onPressed: () {
                    _searchAll();
                  },
                  child: Text('Mostra tutti gli acquisti'),
                ),
              ),
            ],
          ),
          Row(
              children: [

                Flexible(
                  child: InputField(
                    key: UniqueKey(),
                    //labelText: AppLocalizations.of(context).translate("search").capitalize,
                    labelText: "Inserisci data Inizio",
                    controller: _searchFiledController,
                    onSubmit: (value) {
                      _search();
                    },
                  ),
                ),
                SquareIconButton(
                  key: UniqueKey(),
                  icon: Icons.search_rounded,
                  onPressed: () {
                    _search();
                  },
                ),
              ]
          ),
        ],
      ),
    );

  }
  _selectDateTime() {
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2022, 1, 1),
      maxTime: DateTime(2025, 12, 31),
      onChanged: (date) {
        print('change $date');
      },
      onConfirm: (date) {
        setState(() {
          selectedDateTime = date;
        });
      },
      currentTime: DateTime.now(),
      locale: LocaleType.it,
    );
  }

  Widget bottom() {
    if (_searching) {
      return CircularProgressIndicator();
    } else {
      print("CIAOOOO");
      print(_acquisti.length);
      if (_acquisti.length == 0) {
        return noResults();
      } else {
        return yesResults();
      }
    }
  }

  Widget noResults() {
    return Text("Nessun acquisto disponibile");
  }

  Widget yesResults() {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: _acquisti.length,
          itemBuilder: (context, index) {
            return AcquistoSpecifiche(
              key: UniqueKey(),
              acquisto: _acquisti[index],
            );
          },
        ),
      ),
    );
  }

  void _search() {
    setState(() {
      _searching = true;
      _acquisti = [];
    });
    print(filtroAttivo);
    /*Model.sharedInstance.searchProductByGenere(_searchFiledController.text).then((result) {
      setState(() {
        _searching = false;
        _acquisti = result!;
      });
    });*/
  }
  void _searchAll() {
    setState(() {
      _searching = true;
      _acquisti = [];
    });
    Model.sharedInstance.searchAllPurchase().then((result) {
      setState(() {
        _searching = false;
        _acquisti = result!;
      });
    });
  }
}
