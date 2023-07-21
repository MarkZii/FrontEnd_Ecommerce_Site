import 'dart:async';
import 'dart:html';

import 'package:front_end_ecommerce/UI/widgets/SquareIconButton.dart';
import 'package:front_end_ecommerce/UI/widgets/ClickableButton.dart';
import 'package:front_end_ecommerce/UI/widgets/InputField.dart';
import 'package:front_end_ecommerce/model/Model.dart';
import 'package:front_end_ecommerce/model/objects/Prodotto.dart';
import 'package:flutter/material.dart';

import '../widgets/ProdottoSpecifiche.dart';

class MostraArticoli extends StatefulWidget {
  const MostraArticoli({required Key key}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<MostraArticoli> {
  bool _searching = false;
  bool filtroAttivo = false;
  List<Prodotto> _products = [];

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ClickableButton(
              onClick: () {
                // Azione da eseguire quando il pulsante viene cliccato
                setState(() {
                  if (filtroAttivo == true) {
                    filtroAttivo = false;
                  } else {
                    filtroAttivo = true;
                  }
                });
              },
              buttonText: 'Cerca per genere',
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
                  child: Text('Mostra tutti i prodotti'),
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
                    labelText: "Search",
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

  Widget bottom() {
    if (_searching) {
      return CircularProgressIndicator();
    } else {
      if (_products.length == 0) {
        return noResults();
      } else {
        return yesResults();
      }
    }
  }

  Widget noResults() {
    return Text("Nessun risultato disponibile");
  }

  Widget yesResults() {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: _products.length,
          itemBuilder: (context, index) {
            return ProdottoSpecifiche(
              key: UniqueKey(),
              prodotto: _products[index],

            );
          },
        ),
      ),
    );
  }

  void _search() {
    setState(() {
      _searching = true;
      _products = [];
    });

    if (filtroAttivo == false) {
      Model.sharedInstance.searchProduct(_searchFiledController.text).then((result) {
        setState(() {
          _searching = false;
          _products = result!;
        });
      });
    } else {
      print(filtroAttivo);
      Model.sharedInstance.searchProductByGenere(_searchFiledController.text).then((result) {
        setState(() {
          _searching = false;
          _products = result!;
        });
      });
    }
  }
  void _searchAll() {
    setState(() {
      _searching = true;
      _products = [];
    });
    Model.sharedInstance.searchAllProduct().then((result) {
        setState(() {
          _searching = false;
          _products = result!;
        });
      });
  }
}
