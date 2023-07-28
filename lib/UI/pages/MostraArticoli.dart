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
  int paginaCorrente = 0;
  List<Prodotto> _products = [];
  late int? pagineTotali;

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
              buttonText: 'Cerca per tipologia',
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
                  //_countNumPagine();
                  //paginaCorrente = 0;
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
    return Text("Nessun prodotto disponibile");
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

  /*Widget yesResults() {
    return Scrollbar(
        child: Column(
            children: [
              Container(
                height: 340,
                child:
                PageView.builder(
                  itemCount: pagineTotali, // Numero totale di pagine
                  itemBuilder: (context, paginaCorrente) {
                    return ListView.builder(
                      itemCount: _products.length,
                      itemBuilder: (context, index) {
                        Prodotto prod = _products[index];
                        return ProdottoSpecifiche(
                          key: UniqueKey(),
                          prodotto: _products[index],
                        );
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        paginaCorrente =
                        paginaCorrente > 0 ? paginaCorrente - 1 : 0;
                        _search();
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      setState(() {
                        paginaCorrente = paginaCorrente < pagineTotali! - 1
                            ? paginaCorrente + 1
                            : paginaCorrente;
                        _search();
                      });
                    },
                  ),
                ],
              )
            ]
        )
    );
  }*/

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
  /*void _countNumPagine() {
    Model.sharedInstance.getNumPagine(_searchFieldController.text)?.then((ris) {
      setState(() {
        pagineTotali = ris;
      });
    });
  }*/
}
