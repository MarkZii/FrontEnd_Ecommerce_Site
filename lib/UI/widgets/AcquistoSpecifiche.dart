import 'package:front_end_ecommerce/model/objects/Prodotto.dart';
import 'package:front_end_ecommerce/UI/widgets/WidgetAcquisto.dart';
import 'package:flutter/material.dart';
import 'package:front_end_ecommerce/model/objects/ProdottoAcquisto.dart';

import '../../model/objects/Acquisto.dart';


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
                      "Utente: "+acquisto.utente.codiceFiscale,
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),

                    Text(
                      "Data: "/*+acquisto.data.toString()*/,
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ),
      ),
    );
  }


}
