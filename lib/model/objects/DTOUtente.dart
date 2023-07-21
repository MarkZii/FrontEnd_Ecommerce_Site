class DTOUtente {
  String codiceFiscale;
  String nome;
  String cognome;
  String email;
  String numeroTelefonico;
  String indirizzo;
  String password;


  DTOUtente({required this.codiceFiscale, required this.nome, required this.cognome, required this.email, required this.numeroTelefonico, required this.indirizzo, required this.password});

  factory DTOUtente.fromJson(Map<String, dynamic> json) {
    return DTOUtente(
      codiceFiscale: json['codiceFiscale'],
      nome: json['nome'],
      cognome: json['cognome'],
      email: json['email'],
      numeroTelefonico: json['numeroTelefonico'],
      indirizzo: json['indirizzo'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
    'codiceFiscale': codiceFiscale,
    'nome': nome,
    'cognome': cognome,
    'email': email,
    'numeroTelefonico': numeroTelefonico,
    'indirizzo': indirizzo,
    'password': password,
  };

  @override
  String toString() {
    return codiceFiscale + " " + cognome;
  }


}