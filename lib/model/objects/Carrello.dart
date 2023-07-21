class Constants {
  // app info
  static final String APP_VERSION = "0.0.1";
  static final String APP_NAME = "Ecommerce autoricambi";

  // addresses
  static final String ADDRESS_ECOMMERCE_SERVER = "localhost:8081";
  static final String ADDRESS_AUTHENTICATION_SERVER = "localhost:8080";

  // authentication
  static final String REALM = "ecommerce";
  static final String CLIENT_ID = "client";
  static final String CLIENT_SECRET = "7F2SaVRzPa0g2Oezue0OXVe4l5kj3s4r";
  static final String REQUEST_LOGIN = "/realms/" + REALM + "/protocol/openid-connect/token";
  static final String REQUEST_LOGOUT = "/realms/" + REALM + "/protocol/openid-connect/logout";
  //static final String RUOLO_FARMACIA="farmacia";
  static final String RUOLO_CLIENTE="cliente";
  //static final String RUOLO_GESTORE="gestore";
  static final String RUOLO_ADMIN="admin";

  // requests
  static final String REQUEST_VIEW_CARRELLO= "/carrello";
  static final String REQUEST_ADD_CARRELLO= "/carrello";
  static final String REQUEST_MODIFY_CARRELLO= "/carrello";
  static final String REQUEST_DELETE_CARRELLO= "/carrello";
  static final String REQUEST_VIEW_ACQUISTI= "/acquisti";
  static final String REQUEST_VIEW_PRODOTTI = "/prodotti";
  static final String REQUEST_VIEW_PRODOTTI_NOME = "/prodotti/ricercaNome";
  static final String REQUEST_VIEW_PRODOTTI_CODICEBARRE = "/prodotti/ricercaCodiceBarre";
  static final String REQUEST_VIEW_PRODOTTI_CATEGORIA = "/prodotti/ricercaCategoria";
  static final String REQUEST_VIEW_PRODOTTI_RICERCAID = "/prodotti/ricercaID";
  static final String REQUEST_ADD_PRODOTTO= "/prodotti";
  static final String REQUEST_MODIFY_PRODOTTO= "/prodotti";
  static final String REQUEST_DELETE_PRODOTTO= "/carrello";
  static final String REGISTRAZIONE="/registrazione";

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

  static final String GET_INFORMATION_PHARMACY = '/farmacia';
}