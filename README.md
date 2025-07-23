# 🌍 Explore Countries App

A Flutter + Dart app to fetch and search for countries using **Flutter BLoC**, **Cubit, **GraphQL**, and **Google Fonts**.

---

## 🚀 Installation Guide

1. **Clone the repository**
   ```bash
   git clone https://github.com/talented-vicky/explore_countries_app.git
   cd explore_countries_app

2. **Get dependencies**
    flutter pub get

3. **Run the app**
    flutter run 


## 🧠 State Management (BLoC)
This app uses flutter_bloc for managing state.

🔁 Flow
    - CountryCubit is used to manage and emit CountryState:
    - CountryInit: Default state
    - CountryLoading: Shows loading spinner
    - CountryLoaded: Shows list of countries
    - CountryError: Displays error message


## 📦 Files Involved
    - country_cubit.dart: Handles business logic and emits states
    - country_state.dart: Defines possible states (Init, Loading, Loaded, and Error)
    - country_repository.dart: Interacts with API (GraphQL)
    - country.dart: Country model
    - UI Widgets listen to CountryCubit via BlocBuilder


## 🔎 Search Feature
CountryCubit.searchCountries(String param) filters the fetched countries based on the name.

## 📦 Dependencies
    - flutter_bloc
    - graphql_flutter
    - equatable
    - google_fonts
    - cupertino_icons

## 📄 License
This is a demo app, so please feel free to use, fork, and improve.