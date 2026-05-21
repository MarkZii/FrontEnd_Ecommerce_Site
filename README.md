### Frontend
The application's frontend is a cross-platform client developed in **Dart** using the **Flutter** framework. It is designed to interface with the backend REST APIs through a custom networking layer.

Core technologies and concepts include:
* **Flutter & Dart:** Creation of a reactive user interface based on visual components (Widgets) and state management using `StatefulWidget` and `setState`.
* **REST API Management:** Implementation of a custom `RestManager` based on Dart's `http` package. It centrally handles network requests (GET, POST, PUT, DELETE), dynamic insertion of the JWT token (Bearer token) in HTTP headers, and JSON body serialization.
* **Data Deserialization:** Strict mapping of JSON data from the backend into strongly typed Dart objects (e.g., `Prodotto.fromJson`, `Utente.fromJson`, `Acquisto.fromJson`).

---

## ⚙️ Core Features (Frontend)

The user interface guides the customer through the entire store interaction process:

### 1. Navigation and Informational Pages
* **Main Layout (`Home.dart`):** Uses a `TabBar` system for smooth navigation between the storefront, home, and informational sections.
* **"About Us" Section:** Dedicated pages for the storytelling of the artisan brand ("Lineasette"), presenting the company's history, craftsmanship, and values.

### 2. Authentication and Access (`Registrazione.dart`)
* Integrated management of the Login and Registration flow in a single interface.
* Client-side field validation (e.g., email format checking, password match verification) before sending data to the backend.
* Visual user feedback via popup Dialogs in case of incorrect credentials or an already existing email.

### 3. Catalog Browsing (`MostraArticoli.dart`)
* Display of all available items with dynamic detail rendering.
* Flexible search via an input bar, with the ability to filter results by "name" or explore by "type/category" using a switch button.

### 4. Shopping Cart and Checkout (`Carrello.dart`)
* Display of the list of products added to the cart with dynamic, real-time calculation of the total price.
* Buttons to update the cart status and proceed to checkout ("Buy now").
* Handling of backend responses (e.g., out-of-stock items or price changes) communicated to the user through clear system messages.

### 5. User Area and Order History (`User.dart` & `Prodotti.dart`)
* Access to the personal area to view the history of all past purchases.
* Ability to inspect the details of each individual order (list of products purchased in that specific transaction).

---

## 🧠 Technical Highlights (Frontend)
* **Internationalization (i18n):** The app is set up for multi-language support (Italian and English) via the `AppLocalizations` class, which dynamically loads text strings from local JSON files.
* **Centralized Design System:** Typographical styles (e.g., `BigBoldTitleStyle`, `ParagraphStyle`) are grouped in `TextStyles.dart` to ensure visual consistency across the app and facilitate future UI modifications.
* **Token Security:** Once obtained after login, the JWT token is kept in the network layer (`RestManager`) and automatically applied to all authenticated API calls to ensure secure communications.
