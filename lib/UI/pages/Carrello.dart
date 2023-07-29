import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end_ecommerce/UI/widgets/ProductCardProdottoAcquistato.dart';
import 'package:front_end_ecommerce/model/objects/ProdottoAcquisto.dart';
import '../../model/Model.dart';
import '../widgets/ClickableButton.dart';
import '../widgets/MessaggioDialogo.dart';

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

  /*void mostraMessaggioTemporaneo(String messaggio) {
    setState(() {
      _message = messaggio;
      _showMessage = true;
    });

    Timer(Duration(seconds: 3), () {
      setState(() {
        _showMessage = false;
      });
    });
  }*/

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

        showDialog(
          context: context,
          builder: (context) => MessaggioDialogo(
            titleText: "Message",
            bodyText: result,
          ),
        );
        /*String message;
        if (result == true) {
          message = 'Acquisto eseguito';
        } else {
          //print("result: "+result.toString());
          message = 'Acquisto NON eseguito';
        }*/

        //mostraMessaggioTemporaneo(result);
      });
    });
  }

  Widget top() {
    return Padding(
      padding: EdgeInsets.only(
        top: 3.0,
        left: 30.0,
        right: 30.0,
        bottom: 0.0,
      ),
      child: Column(
        children: [
          ElevatedButton(
            child: Text('Aggiorna'),
            onPressed: () {
              _search();
              print(_products);

            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.orangeAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
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
    return Padding(
        padding: EdgeInsets.only(
          top: 0.0,
          left: 30.0,
          right: 30.0,
          bottom: 0.0,
        ),
      child: Row(
        children: [
          ElevatedButton(
            child: Text('Acquista ora'),
              onPressed: () {
                _acquista();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
            ),
          AnimatedOpacity(
            opacity: _showMessage ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: Container(
              padding: EdgeInsets.only(
                top: 0.0,
                left: 10.0,
                right: 0.0,
                bottom: 0.0,
              ),
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
    return Text('      Non ci sono prodotti da mostare.');
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          back(),
          Padding(
            padding: EdgeInsets.only(
              top: 3.0,
              left: 30.0,
              right: 30.0,
              bottom: 0.0,
            ),
            child: Text("Carrello con totale spesa: "+totale.toString()+"€.",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          option(),
          top(),
          bottom(),
        ],
      ),
    );
  }
  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
            back(),
            Padding(
              padding: EdgeInsets.only(
                top: 3.0,
                left: 30.0,
                right: 30.0,
                bottom: 3.0,
              ),
              child: Row(
                children: [
                  Text(
                    "Carrello con totale spesa: "+totale.toString()+"€.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  option(),
                  top(),
                  bottom(),
                ],
              ),
            ),
          ],
        ),
      );
  }*/

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