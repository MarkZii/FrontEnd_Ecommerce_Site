import 'package:front_end_ecommerce/model/objects/Prodotto.dart';
import 'package:front_end_ecommerce/UI/widgets/WidgetAcquisto.dart';
import 'package:flutter/material.dart';
import 'package:front_end_ecommerce/model/objects/ProdottoAcquisto.dart';

import '../../model/objects/Acquisto.dart';
import '../pages/Prodotti.dart';
import 'ProdottoSpecificheAcquisto.dart';


class AcquistoSpecifiche extends StatelessWidget {
  final Acquisto acquisto;

  AcquistoSpecifiche({required Key key, required this.acquisto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
        top: 3.0,
        left: 30.0,
        right: 30.0,
        bottom: 3.0,
        ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "Utente: "+acquisto.utente.email.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),

                    Text(
                      "Data: "+acquisto.purchaseTime.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child:ElevatedButton(
                    child: Text('Mostra prodotti'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Prodotti(UniqueKey(), acquisto.prodottoAcquisto),
                        ),
                      );
                      //MaterialPageRoute(builder: (context) => Prodotti(UniqueKey(), acquisto.prodottoAcquisto));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );


  }

  void _showPopupWindow(BuildContext context,  List<ProdottoAcquisto> prodottoAcquisto) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) =>
          Positioned(
            top: 50,
            left: 100,
            child: Material(
              child: Container(
                width: 500,
                height: 500,

                child: Column(
                  children: [
                    ListView.builder(
                    itemCount: prodottoAcquisto.length,
                      itemBuilder: (context, index) {
                        ProdottoSpecificheAcquisto(
                          key: UniqueKey(),
                          prodotto: prodottoAcquisto[index],
                        );
                      },
                    ),
                    /*ElevatedButton(
                      onPressed: () {
                        //Navigator.of(context).pop();
                },
                      child: Text('Chiudi'),
                    ),*/
                  ],
                ),
              ),
            ),
          ),
    );

    Overlay.of(context)?.insert(overlayEntry);
  }
  /*void _showAlertDialog(BuildContext context, List<ProdottoAcquisto> prodottoAcquisto) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: Text('Lista prodotti'),



          content: Container(
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
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Chiudi'),
            ),
          ],
        );
      },
    );
  }*/

}
