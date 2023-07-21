import 'package:front_end_ecommerce/model/objects/Prodotto.dart';
import 'package:front_end_ecommerce/UI/widgets/WidgetAcquisto.dart';
import 'package:flutter/material.dart';


class ProdottoSpecifiche extends StatelessWidget {
  final Prodotto prodotto;


  ProdottoSpecifiche({required Key key, required this.prodotto}) : super(key: key);

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
                      "Nome: "+prodotto.nome,
                      style: TextStyle(
                        fontSize: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),

                    Text(
                      "CB: "+prodotto.codiceBarre,
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                WidgetAcquisto(
                  key: UniqueKey(),
                  id: prodotto.id,
                  quantita: prodotto.quantita,
                  codiceBarre: prodotto.codiceBarre,
                  prezzo: prodotto.prezzo!,
                )
              ],
            ),
          )
        ),
      ),
    );
  }


}
