import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrdqa_tool/models/Config.dart';
import 'package:mrdqa_tool/services/ConfigManager.dart';
import 'package:mrdqa_tool/services/SqliteDatabaseManager.dart';

class ConfigurationPage extends StatefulWidget {
  static String routeName = '/configuration';

  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();

}

class _ConfigurationPageState extends State<ConfigurationPage> {
  final _formKey = GlobalKey<FormState>();
  ConfigManager _configManager;
  TextEditingController _baseUrlTextController;
  TextEditingController _passwordController;
  TextEditingController _usernameController;
  Config _config;
  //String _baseUrl;

  @override
  void initState(){
    super.initState();
    this._config =  new Config();
    _configManager = new ConfigManager();
    Future<Config> con = _configManager.getConfig();
    con.then((data) {
      setState(() {
        print(data.getBaseUrl());
        _baseUrlTextController = new TextEditingController(text: data.getBaseUrl());
        _passwordController = new TextEditingController(text: data.getPassword());
        _usernameController = new TextEditingController(text: data.getUsername());
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Configuration'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.cloud_upload_rounded),
                            hintText: "DHIS2 Base URL without trailing /",
                            labelText: "DHIS2 URL",
                          ),
                          controller: _baseUrlTextController,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.lock),
                            labelText: "Username",
                          ),
                          controller: _usernameController,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.lock),
                            labelText: "Password",
                          ),
                          controller: _passwordController,
                          obscureText: true,
                        ),
                        new RaisedButton(child: const Text('Save'),onPressed: (){
                          if (_formKey.currentState.validate()){
                            _config.setBaseUrl(_baseUrlTextController.text);
                            _config.setUsername(_usernameController.text);
                            _config.setPassword(_passwordController.text);
                            _configManager.saveConfig(_config);
                          }
                        }),
                      ],
                    ),
                  ),
                ),


                /*Container(
                  padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                  child: new RaisedButton(child: const Text('Save'),onPressed: (){
                    if (_formKey.currentState.validate()){
                      //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                      String baseUrl = _baseUrlTextController.text;
                      debugPrint('Saving to SQLite: '+baseUrl);

                      //_addToSqliteDb();

                      //Config config = new Config();
                    }
                  }),
                )*/
              ]
          ),
        ),
    );
  }
}