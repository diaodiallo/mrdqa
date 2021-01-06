import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrdqa_tool/models/Config.dart';

class ConfigurationPage extends StatefulWidget {
  static String routeName = '/configuration';

  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();

}

class _ConfigurationPageState extends State<ConfigurationPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _baseUrlTextController;
  TextEditingController _passwordController;
  TextEditingController _usernameController;
  Config _config;
  String _baseUrl;

  @override
  void initState(){
    this._config =  new Config();
    this._baseUrl = this._config.getBaseUrl();
    super.initState();
    _baseUrlTextController = new TextEditingController(text: this._baseUrl);
    _passwordController = new TextEditingController();
    _usernameController = new TextEditingController();
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
                          //initialValue: "45",
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
                        ),
                        new RaisedButton(child: const Text('Save'),onPressed: (){
                          if (_formKey.currentState.validate()){
                            //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                            String baseUrl = _baseUrlTextController.text;
                            debugPrint('Saving to SQLite: '+baseUrl);

                            //_addToSqliteDb();

                            //Config config = new Config();
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