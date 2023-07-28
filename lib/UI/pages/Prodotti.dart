import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_ecommerce/UI/widgets/ProdottoSpecificheAcquisto.dart';
import 'package:front_end_ecommerce/UI/widgets/ProductCardProdottoAcquistato.dart';
import 'package:front_end_ecommerce/model/objects/Acquisto.dart';
import 'package:front_end_ecommerce/model/objects/ProdottoAcquisto.dart';
import '../../model/Model.dart';
import '../../model/objects/Acquisto.dart';
import '../widgets/AcquistoSpecifiche.dart';
import '../widgets/ClickableButton.dart';
import '../widgets/InputField.dart';
import '../widgets/MessaggioDialogo.dart';
import '../widgets/ProdottoSpecifiche.dart';
import '../widgets/SquareIconButton.dart';

class Prodotti extends StatefulWidget {
  List<ProdottoAcquisto> prodottoAcquisto;
  Prodotti(UniqueKey key, this.prodottoAcquisto) : super(key: key);

  @override
  _ProdottiState createState() => _ProdottiState(prodottoAcquisto);
}

class _ProdottiState extends State<Prodotti> {
  List<ProdottoAcquisto> prodottoAcquisto;

  _ProdottiState(this.prodottoAcquisto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            top(),
            yesResults(prodottoAcquisto),
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
              Text(
                "Elenco prodotti acquistati",
                style: TextStyle(
                  fontSize: 30,
                  color: Theme
                      .of(context)
                      .primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget yesResults(List<ProdottoAcquisto> prodottoAcquisto) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: prodottoAcquisto.length,
          itemBuilder: (context, index) {
            return ProdottoSpecificheAcquisto(
              key: UniqueKey(),
              prodotto: prodottoAcquisto[index],
            );
          },
        ),
      ),
    );
  }
}