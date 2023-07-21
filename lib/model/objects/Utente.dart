class Utente {
  int? id;
  String codiceFiscale;
  String? nome;
  String? cognome;
  String? email;
  String? telefono;
  String? indirizzo;
  String? password;


  Utente({this.id, required this.codiceFiscale, this.nome, this.cognome,  this.email,  this.telefono, this.indirizzo, this.password});

  factory Utente.fromJson(Map<String, dynamic> json) {
    /*DateTime? dt;
    if(json["dataNascita"]!= null) {
      List<dynamic> data = json["dataNascita"];
      dt = DateTime(data[0], data[1], data[2]);
    }*/
    return Utente(
      id: json['id'],
      codiceFiscale: json['codiceFiscale'],
      nome: json['nome'],
      cognome: json['cognome'],
      email: json['email'],
      telefono: json['telefono'],
      indirizzo: json['indirizzo'],
      password: json['password']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'codiceFiscale': codiceFiscale,
    'nome': nome,
    'cognome': cognome,
    'email': email,
    'telefono': telefono,
    'indirizzo': indirizzo,
    'password': password
  };

  @override
  String toString() {
    return codiceFiscale;
  }
}