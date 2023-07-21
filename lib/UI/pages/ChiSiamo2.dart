import 'package:flutter/material.dart';
//import '../../model/Model.dart';


class ChiSiamo2 extends StatelessWidget {

  ChiSiamo2({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 1000, // Larghezza desiderata per il testo giustificato
            height: 500,
            child: RichText(
              text: TextSpan(
                text:  "Libraccio è un'applicazione dedicata agli amanti della lettura, progettata per promuovere l'importanza della lettura e semplificare l'acquisto di libri."
                    "L'applicazione offre un'ampia selezione di libri di varie categorie, tra cui romanzi, saggi, libri per bambini, libri di cucina, guide di viaggio e molti altri."
                    "Gli utenti possono sfogliare il catalogo virtuale e scoprire nuovi titoli, autori e generi che catturano la loro curiosità e interesse."
                    "Una caratteristica distintiva di Libraccio è la sua interfaccia intuitiva e user-friendly, che consente agli utenti di navigare facilmente tra le varie sezioni"
                    "dell'applicazione, cercare libri specifici o esplorare raccomandazioni personalizzate basate sui loro gusti e preferenze."
                    "Grazie all'integrazione con sistemi di pagamento sicuri, gli utenti possono effettuare acquisti direttamente dall'applicazione in modo semplice e conveniente. Una volta"
                    "effettuato l'acquisto, i libri vengono spediti direttamente all'indirizzo desiderato dell'utente, garantendo una comoda esperienza di shopping online."
                    "Inoltre, Libraccio offre funzionalità sociali che consentono agli utenti di condividere le loro letture preferite con amici e familiari, scrivere recensioni, partecipare a"
                    "discussioni su libri e autori, e scoprire eventi letterari locali, come presentazioni di libri e incontri con gli autori."
                    "L'applicazione si impegna a promuovere la lettura come un'attività stimolante e arricchente, fornendo consigli personalizzati, consigli di lettura e accesso a una comunità "
                    "di appassionati di libri. Attraverso Libraccio, gli utenti possono scoprire nuove storie, espandere le proprie conoscenze e sperimentare il piacere di immergersi in un mondo "
                    "di parole e idee."
                    "Sia che siate lettori accaniti alla ricerca del prossimo bestseller, studenti in cerca di risorse educative o genitori che vogliono introdurre i propri figli alla magia"
                    "della lettura."
                    "Libraccio è l'applicazione ideale per soddisfare le vostre esigenze letterarie e alimentare la passione per i libri.",
                style: TextStyle(
                  fontSize: 20.0, // Dimensione del font normale
                ),
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        )
        /*child: Text(

          style: TextStyle(
            fontSize: 16.0, // Dimensione del testo
            fontWeight: FontWeight.bold, // Grassetto
            color: Colors.black, // Colore del testo
          ),
        )*/
      ),
    );
  }
}