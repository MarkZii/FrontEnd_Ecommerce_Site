import 'dart:async';

import 'package:flutter/material.dart';

import '../../model/Model.dart';

class WidgetAcquisto extends StatefulWidget {

  final int quantita;
  final String codiceBarre;
  final double prezzo;
  final int id;

  const WidgetAcquisto({
    required Key key,
    required this.quantita,
    required this.codiceBarre,
    required this.prezzo,
    required this.id,
  }) : super(key: key);

  @override
  _WidgetAcquistoState createState() => _WidgetAcquistoState(quantita, codiceBarre, prezzo, id);
}

class _WidgetAcquistoState extends State<WidgetAcquisto> {
  int _id = 0;
  int _quantita = 0;
  String _codiceBarre = "";
  double prezzo=0;
  bool filtroAttivo=false;
  TextEditingController _textEditingController = TextEditingController();
  bool _showMessage = false;
  String _message = '';

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




  _WidgetAcquistoState(int quantita, String codiceBarre, double prezzo, int id) {
    this._id=id;
    this._quantita = quantita;
    this._codiceBarre = codiceBarre;
    this.prezzo=prezzo;
    _textEditingController.text = _quantita.toString();
  }

  void incrementaQuantita() {
    setState(() {
      _quantita++;
      _textEditingController.text = _quantita.toString();
    });
  }

  void decrementaQuantita() {
    if (_quantita > 0) {
      setState(() {
        _quantita--;
        _textEditingController.text = _quantita.toString();
      });
    }
  }

  void effettuaAcquisto() {
    if (_quantita > 0) {
      print(_codiceBarre);
      print("risultato:");
      print(_quantita);
      Model.sharedInstance.aggiungiAlCarrello(_id, _quantita).then((risultato){
        setState(() {


          String message;
          if (risultato == "true") {
            message = 'Aggiunto al carrello!';
          } else {
            print("result: "+risultato.toString());
            message = risultato;
          }

          mostraMessaggioTemporaneo(message);
        });
      });

    }
  }



  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "   prezzo tatale: "+(prezzo*_quantita).toString()+"€ ",
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).primaryColor,
          ),
        ),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: decrementaQuantita,
        ),
        Container(
          width: 60,
          child: TextFormField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            controller: _textEditingController,
            onChanged: (value) {
              setState(() {
                try {
                  _quantita = int.parse(value);
                  print(_quantita);
                } catch (e) {
                  _quantita = 0;
                }
              });
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: incrementaQuantita,
        ),
        ElevatedButton(
          child: Text('AggiungiAlCarrello'),
          onPressed: effettuaAcquisto,
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
    );
  }
}
