import 'package:flutter/material.dart';
//import '../../model/Model.dart';


class ChiSiamo extends StatelessWidget {

  ChiSiamo({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16), // Spazio tra l'immagine e il testo
            Text(
              "Una nuova visione ceramica, contemporanea ma nella tradizione\n",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
                "Giuseppe Bucco e Flavio Cavalli sono legati da una solida amicizia e condividono lo stesso saper fare, entrambi sono maestri ceramisti diplomati presso l’Istituto Statale d’Arte per la ceramica di Nove. Qui la ceramica è tradizione radicata, si lavora da trecento anni. Ma l’approccio di Giuseppe e Flavio a questa secolare storia dell’artigianato è definita da una lettura decisamente nuova, orientata dalla ricerca e dall’autenticità della manifattura. I due ceramisti intendono unire al valore delle tecniche della tradizione l’innovazione di forme espressive e materiche nuove, armonizzando design e sperimentazione.\n\n"
                "Gli inizi sono assai spontanei, nello scantinato del nonno di Flavio viene allestito un laboratorio artigianale, è qui che la loro ricerca creativa diventa realtà produttiva e predilige la lavorazione di una nuova ceramica, il grès porcellanato definito dalla bellezza e dall’introduzione di una linea più contemporanea."
                "È il 1977 e in questo laboratorio ha inizio la storia artigiana di Lineasette."
                "Dieci anni dopo le collezioni dei due ceramisti veneti incontrano il favore di non pochi estimatori, Flavio e Giuseppe sono artisti e artigiani molto apprezzati e la loro intuizione creativa, la loro idea di dare alla tradizione ceramica un profilo decisamente nuovo è apprezzata e riconosciuta anche in un territorio di classica tradizione."
                "Lo scantinato non è più il luogo appropriato per creare, Il loro laboratorio viene trasferito a Marostica nel vicentino, è un’ampia costruzione in acciaio e cemento progettata da Aldo Loss. È qui che la narrazione ceramica si sviluppa assieme alla ricerca creativa.\n\n"
                "Oggi Lineasette è un brand dalla storia aziendale importante, ne custodisce il valore Emanuele Bucco, figlio di Giuseppe, portando avanti un nuovo modo di fare ceramica, proponendo originali collezioni di oggetti di design in grès porcellanato, dalla linea pura ed essenziale, realizzate nel segno dell’autorialità italiana."
                "Di stile, opaca e monocromatica: è la nuova definizione ceramica che caratterizza la produzione di Lineasette. Ogni creazione è di esclusiva lavorazione artigianale, il grès viene lavorato grazie ad un particolare sistema, è cotto ad altissime temperature e rispetto alla ceramica tradizionale conserva un valore tecnico superiore che non consente deteriormanento e garantisce resistenza e inalterabilità.\n\n"
                "Le collezioni spaziano dalla creazione di vasi, centrotavola, piccole sculture decorative e di design, oggetti d’arte che si caratterizzano per bellezza e funzionalità, definiti da un rivestimento monocromatico che esalta superfici ruvide e opache, che dia l’effetto puro del “non lavorato” e l’eleganza di gradevoli giochi in chiaroscuro."
                "Il concept progettuale dei designer di Lineasette è d’impronta contemporanea ma prende forma attraverso i gesti della tradizione ceramica, del fatto a mano, dal colaggio delle argille ai rivestimenti a engobbio. Un saper fare dal quale scaturisce, per ogni creazione, l’eleganza di forme dal tratto inconfondibile, libere e armoniche.",
              style: TextStyle(
                fontSize: 21,
                color: Colors.black,
                // TextAlign will align the text within the Text widget.
                // In this case, we want the text to be center-aligned.
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}