import 'package:front_end_ecommerce/model/objects/Prodotto.dart';
import 'package:front_end_ecommerce/UI/widgets/WidgetAcquisto.dart';
import 'package:flutter/material.dart';

import '../../model/objects/ProdottoAcquisto.dart';


class ProdottoSpecificheAcquisto extends StatelessWidget {
  final ProdottoAcquisto prodotto;
  ProdottoSpecificheAcquisto({required Key key, required this.prodotto}) : super(key: key);

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
          padding: EdgeInsets.all(8),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Text(
                      "Nome: "+prodotto.prodotto.nome,
                      style: TextStyle(
                        fontSize: 22,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),

                    Text(
                      "Codice a barre: "+prodotto.prodotto.codiceBarre,
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      "Quantità aquistate: "+prodotto.quantita.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      "Prezzo x unità: "+prodotto.prezzo.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      "Categoria: "+prodotto.prodotto.categoria.nome,
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