import 'package:flutter/material.dart';
//import '../../model/Model.dart';


class ChiSiamo2 extends StatelessWidget {

  ChiSiamo2({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('HOME.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 50), // Spazio tra l'immagine e il testo
            Text(
              "Armonia, Essenza, Artigianalità\n",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                ),
              textAlign: TextAlign.center,
            ),
            Text(
                  "Lineasette dal 1977 produce artigianalmente in Italia opere di design in gres\n"
                  "porcellanato, un materiale ceramico resistente e impermeabile che dona\n"
                  "prestigio ed eleganza ad ogni creazione. Cuore, mente e mani attraverso\n"
                  "acqua, terra e fuoco liberano l’essenza più intima spogliando dal superfluo\n"
                  "ogni forma e ricercando la massima qualità in ogni dettaglio.",
              style: TextStyle(
                fontSize: 21,
                color: Colors.black,
                // TextAlign will align the text within the Text widget.
                // In this case, we want the text to be center-aligned.
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}