import 'dart:async';

import 'package:front_end_ecommerce/UI/pages/Carrello.dart';
import 'package:front_end_ecommerce/UI/pages/MostraArticoli.dart';
import 'package:front_end_ecommerce/UI/pages/Registrazione.dart';
import 'package:flutter/material.dart';
import '../../UI/pages/ChiSiamo.dart';
import 'package:front_end_ecommerce/model/support/Constants.dart';
import 'ChiSiamo2.dart';
import 'User.dart';
//import 'Acquisti.dart';


class Home extends StatefulWidget {
  final String title;

  Home({required Key key, required this.title}) : super(key: key);

  _LayoutState createState() => _LayoutState(title);
}

class _LayoutState extends State<Home> {
  String title="";
  bool _showMessage = false;
  String _message = '';
  
  _LayoutState(String title) {
    this.title = Constants.APP_NAME;
  }

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

  /**
   * Nota che uno scaffold contiene un appBar e un
   * body. l'appbar viene visualizzato nella parte
   * superiore della pagina, mentre il "body" nella
   * sua parte inferiore e contiene il contenuto
   * principale dell'applicazione.
   */

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end, // Allineamento orizzontale a sinistra
                  children: [
                    IconButton(
                        icon: Icon(Icons.login),
                        color: Colors.grey,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Registrazione(key: UniqueKey(),)),
                          );
                        }),
                    IconButton(
                        icon: Icon(Icons.shopping_cart_checkout),
                        color: Colors.grey,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Carrello(key: UniqueKey(),)),
                          );
                        }),
                    IconButton(
                        icon: Icon(Icons.account_circle),
                        color: Colors.grey,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => User(key: UniqueKey(),)),
                          );
                        }),
                    /*AnimatedOpacity(
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
                    ),*/
                  ],
                ),
              ),
            ],
          ),
          bottom: TabBar(
            indicatorColor: Colors.orangeAccent,
            /**
             * La tabBar rappresenta la barra delle schede, e mostra le etichette
             * alle pagine. E viene visualizzato nel bottom dell'appbar.
             */
            labelColor: Colors.black,


            tabs: [
              Tab(text:"Home"),
              Tab(text:"Chi siamo"),
              Tab(text:"Tutti prodotti"),
            ],
          ),
        ),
          body: TabBarView(
          /**
           * Dentro TabBarView viene rappresentato il contenuto di ciascuna scheda
           * Questa cosa è fatta in ordine di scrittura.
           * QUINDI NOTA COME ALL'INIZIO VIENE FATTO VEDERE SOLAMENTE LE ICONE PRESENTI
           * DENTRO TabBar, POI UNA VOLTA CHE SI CLICCA IN UNA SPECIFICA ICONA SI MOSTRA
           * TALE PAGINA E SI NASCODONO LE ALTRE.
           */
          children: [
            ChiSiamo2(key: UniqueKey()),
            ChiSiamo(key: UniqueKey()),
            MostraArticoli(key: UniqueKey()),
          ],
        ),
      ),
    );
  }

}