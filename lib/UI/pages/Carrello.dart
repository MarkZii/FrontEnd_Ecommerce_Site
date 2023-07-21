import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_ecommerce/UI/widgets/ProductCardProdottoAcquistato.dart';
import 'package:front_end_ecommerce/model/objects/ProdottoAcquisto.dart';

import '../../model/Model.dart';
import '../widgets/ClickableButton.dart';

class Carrello extends StatefulWidget {
  const Carrello({required Key key}) : super(key: key);

  @override
  _CarrelloState createState() => _CarrelloState();
}

class _CarrelloState extends State<Carrello> {
  bool _searching = false;
  bool _showMessage = false;
  String _message = '';
  double totale=0;
  List<ProdottoAcquisto> _products = [];

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

  void _search() {
    setState(() {
      _searching = true;
      _products = [];
    });

    Model.sharedInstance.searchCarrello().then((result) {
      setState(() {
        _searching = false;
        _products = result!;
        if(_products.length!=0){
          totale=0;
          for(ProdottoAcquisto prod in result){
            this.totale=this.totale+prod.prodotto.prezzo;
          }
        }else{
          this.totale=0;
        }
      });
    });
  }

  void _acquista() {
    setState(() {
      _searching = true;
      _products = [];
    });

    Model.sharedInstance.acquista().then((result) {
      setState(() {
        _searching = false;
        _products = [];

        String message;
        if (result == true) {
          message = 'Acquisto eseguito';
        } else {
          //print("result: "+result.toString());
          message = 'Acquisto NON eseguito';
        }

        mostraMessaggioTemporaneo(message);
      });
    });
  }

  Widget top() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        children: [
          ClickableButton(
            onClick: () {
              _search();
            },
            buttonText: 'Aggiorna',
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
        ],
      ),
    );
  }

  Widget back(){
    return Padding(
        padding: EdgeInsets.all(20), // Aggiungi il padding desiderato
        child: IconButton(

          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
    );
  }
  Widget option() {
    return Center(
      child: TextButton(
        onPressed: () {
          _acquista();
        },
        style: TextButton.styleFrom(
          textStyle: TextStyle(fontSize: 20),
          primary: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text("Acquista ora"+". Prezzo totale: "+totale.toString()+"€."),
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
    return Text('No_results!');
  }

  Widget yesResults() {
    return Expanded(
      child: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return ProductCardProdottoAcquistato(
            key: UniqueKey(),
            quantita: _products[index].quantita!,
            product: _products[index],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(
          children: [
            back(),
            option(),
            top(),
            bottom(),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(Duration.zero, () {
        // Esegui l'azione desiderata qui
        _search();
      });
    });
  }
}