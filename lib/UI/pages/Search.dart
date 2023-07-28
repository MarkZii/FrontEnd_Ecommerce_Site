
/*import 'package:daniele_project2/UI/CardProdotto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/Model.dart';
import '../../model/objects/Prodotto.dart';
import '../InputField.dart';


class Search extends StatefulWidget {

  Search(): super();

  @override
  _SearchState createState() => _SearchState();

}

class _SearchState extends State<Search> {
  bool _searching = false;
  List<Prodotto>? _prodotti;
  int paginaCorrente = 0;
  late int? pagineTotali;

  TextEditingController _searchFieldController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            top(),
            bottom()
          ],
        ),
      ),
    );
  }

  Widget top() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Flexible(
            child: InputField(
              labelText: "Cerca prodotto",
              controller: _searchFieldController,
              onSubmit: (value) {
                paginaCorrente = 0;
                _countNumPagine();
                _search();
              },
            ),
          ),
          TextButton(
            child:
            Text("Cerca"),
            onPressed: () {
              _countNumPagine();
              paginaCorrente = 0;
              _search();
            },
          ),
        ],
      ),
    );
  }

  Widget bottom() {
    return !_searching ?
    _prodotti == null ?
    SizedBox.shrink() :
    _prodotti!.length == 0 ?
    noResults() :
    yesResults() :
    CircularProgressIndicator();
  }

  Widget noResults() {
    return Container (
      height: 300,
      child:
        Center(
          child:
            Container (
              height: 100,
              width:600,
              child:
                Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.0), // Raggio di bordo arrotondato
                    ),
                  child:
                      Center(
                        child:
                          Text (
                            "Nessun risultato disponibile per \""+ _searchFieldController.text+ "\"",
                            style:
                              TextStyle(
                                fontSize: 25
                              )
                        )
                    )
                )
            )
        )
    );
  }

  Widget yesResults() {
    return Scrollbar(
        child:
        Column(
            children: [
              Container(
                height: 340,
                child:
                  PageView.builder(
                    itemCount: pagineTotali, // Numero totale di pagine
                    itemBuilder: (context, paginaCorrente) {
                      return ListView.builder(
                        itemCount: _prodotti!.length,
                        itemBuilder: (context, index) {
                          Prodotto prod = _prodotti![index];
                          return CardProdotto(prod: prod);
                        },
                      );
                    },
                  ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        paginaCorrente =
                        paginaCorrente > 0 ? paginaCorrente - 1 : 0;
                        _search();
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      setState(() {
                        paginaCorrente = paginaCorrente < pagineTotali! - 1
                            ? paginaCorrente + 1
                            : paginaCorrente;
                        _search();
                      });
                    },
                  ),
                ],
              )
            ]
        )
    );
  }

  Future<void> _search() async {
    setState(() {
      _searching = true;
      _prodotti = null; //RESET
    });
    List<Prodotto>? products=await Model.sharedInstance.searchProduct(_searchFieldController.text, paginaCorrente);
    if(products!=null){
      setState(() {
        _searching = false;
        _prodotti = products;
      });
    };
  }


  void _countNumPagine() {
     Model.sharedInstance.getNumPagine(_searchFieldController.text)?.then((ris) {
      setState(() {
        pagineTotali = ris;
      });
    });
  }
}*/

