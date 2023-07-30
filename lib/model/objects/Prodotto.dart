
import 'Categoria.dart';

class Prodotto {
  int id;
  String nome;
  String codiceBarre;
  double prezzo;
  int quantita;
  String descrizione;
  Categoria categoria;
  double versione;


  Prodotto({ required this.id, required this.nome, required this.codiceBarre, required this.prezzo, required this.quantita,
    required this.descrizione, required this.categoria, required this.versione});

  factory Prodotto.fromJson(Map<String, dynamic> json) {
    return Prodotto(
      id: json['id'],
      nome: json['nome'],
      codiceBarre: json['codiceBarre'],
      prezzo: json['prezzo'],
      quantita: json['quantita'],
      descrizione: json['descrizione'],
      categoria: Categoria.fromJson(json['categoria']),
      versione: json['versione']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': nome,
    'codiceBarre': codiceBarre,
    'prezzo': prezzo,
    'quantita': quantita,
    'descrizione': descrizione,
    'categoria': categoria.toJson(),
    'versione': versione
  };

  @override
  String toString() {
    return nome + codiceBarre;
  }
}