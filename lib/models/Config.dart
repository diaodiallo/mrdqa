import 'package:flutter/material.dart';

/**
 * Config object to be stored locally but some settings to be pulled from DHIS2.
 */
class Config{
  String _baseUrl = 'https://play.dhis2.org/2.35.1';
  String _username = 'admin'; //to be encrypted and stored locally
  String _password = 'district3'; //to be encrypted and stored locally

  String getBaseUrl() {return this._baseUrl;}
  String getUsername() => this._username;
  String getPassword() => this._password;

  setBaseUrl(String baseUrl){
    _baseUrl = baseUrl;
  }

  setUsername(String username) {
    _username = username;
  }

  setPassword(String password) {
    _password = password;
  }
}