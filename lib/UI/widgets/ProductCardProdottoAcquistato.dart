import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/Model.dart';
import '../../model/objects/ProdottoAcquisto.dart';

class ProductCardProdottoAcquistato extends StatefulWidget {

  //TextEditingController _textEditingController = TextEditingController();

  //ProductCardProdottoAcquistato({required Key key, required this.product}) : super(key: key);


  final ProdottoAcquisto product;
  final int quantita;

  const ProductCardProdottoAcquistato({
    required Key key,
    required this.quantita,
    required this.product,
  }) : super(key: key);

  @override
  _ProductCartProdottoAcquistatoState createState() =>
      _ProductCartProdottoAcquistatoState(quantita, product);
}


class _ProductCartProdottoAcquistatoState extends State<ProductCardProdottoAcquistato> {
  int _quantita = 0;
  ProdottoAcquisto? _product;
  TextEditingController _textEditingController = TextEditingController();

  _ProductCartProdottoAcquistatoState(int quantita, ProdottoAcquisto product) {
    this._quantita = quantita;
    this._product = product;
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
              padding: EdgeInsets.all(30),
              child: Center(
                //padding: ,
                child:Column(
                  children:[
                    Row(
                      children:[

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CB: "+_product!.prodotto.codiceBarre,
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(
                              "Nome: "+_product!.prodotto.nome,
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(
                              "Prezzo totale: "+_product!.prodotto.prezzo.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(
                              "Quantità: "+_product!.quantita.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                        ]),
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

                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child:ElevatedButton(
                            child: Text('Aggiorna quantita'),
                            onPressed: aggiornaQuantita,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child:ElevatedButton(
                            child: Text('Rimuovi prodotto'),
                            onPressed: rimuoviArticolo,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                          ),
                        ),
                      ]
                    )
                  ]
                )
              )
          ),
        ),
    );
  }

  void aggiornaQuantita() {
    if(_quantita>_product!.quantita!)return;
    print(_quantita);
    Model.sharedInstance.rimuoviDaCarrello(_product!.prodotto.id, _quantita);
    //initState();
  }
  void rimuoviArticolo() {
    if(_quantita>_product!.quantita!)return;
    print(_quantita);
    Model.sharedInstance.rimuoviDaCarrello(_product!.prodotto.id, 0);
    initState();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(Duration.zero, () {
        // Esegui l'azione desiderata qui

      });
    });
  }

}