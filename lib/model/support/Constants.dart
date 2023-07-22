class Constants {
  // app info
  static final String APP_VERSION = "0.0.1";
  static final String APP_NAME = "Autoricambi";

  // addresses
  static final String ADDRESS_ECOMMERCE_SERVER = "localhost:8081";
  static final String ADDRESS_AUTHENTICATION_SERVER = "localhost:8080";

  // authentication
  static final String REALM = "ecommerce";
  static final String CLIENT_ID = "client";
  static final String CLIENT_SECRET = "FrKJmmauCQfW3uA8iawXWH0AUtmdfVNy";
  static final String REQUEST_LOGIN = "/realms/" + REALM + "/protocol/openid-connect/token";
  static final String REQUEST_LOGOUT = "/realms/" + REALM + "/protocol/openid-connect/logout";
  static final String RUOLO_CLIENTE="client";
  static final String RUOLO_ADMIN="admin";

  // requests
  static final String REQUEST_VIEW_PRODOTTI = "/api/prodotti/getall";
  static final String REQUEST_VIEW_PRODOTTI_NOME = "/api/prodotti/ricercaNome";
  static final String REQUEST_VIEW_PRODOTTI_CATEGORIA = "/api/prodotti/ricercaCategoria";
  static final String REQUEST_VIEW_CARELLO = "/api/carrello/visualizza";
  static final String REQUEST_ADD_CARELLO = "api/carrello/aggiungi";
  static final String REQUEST_REMOVE_CARELLO = "api/carrello/rimuovi";
  static final String REQUEST_ACQUISTA = "api/carrello/acquisto";
  static final String REQUEST_VIEW_AQUISTI = "/prodotti";
  static final String REQUEST_ADD_CLIENTE = "api/registrazione";

  // states
  static final String STATE_CLUB = "club";

  // responses
  static final String RESPONSE_ERROR_MAIL_PHARMACY_ALREADY_EXISTS = "ERROR_MAIL_PHARMACY_ALREADY_EXISTS";
  static final String RESPONSE_ERROR_MAIL_USER_ALREADY_EXISTS = "ERROR_MAIL_USER_ALREADY_EXISTS";

  // messages
  static final String MESSAGE_CONNECTION_ERROR = "connection_error";
  static final String ERROR_DATE_INVALID="ERROR_INVALID_DATE";
  static final String ERROR_BOOKING_UNAVAILABLE="ERROR_BOOKING_UNAVAILABLE";


  // links
  static final String LINK_RESET_PASSWORD = "***";
  static final String LINK_FIRST_SETUP_PASSWORD = "***";

}