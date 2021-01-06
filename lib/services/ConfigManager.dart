import 'package:mrdqa_tool/models/Config.dart';

import 'SqliteDatabaseManager.dart';

class ConfigManager{
  final sqliteDb = SqliteDatabaseManager.instance;

  Future<Config> getConfig() async {
    List<Map> configurations = await sqliteDb.queryAllRows('configuration');
    List<Config> configs = new List();
    for (var i = 0; i < configurations.length; i++){
      Config config = new Config();
      config.setBaseUrl(configurations[i]["base_url"]);
      config.setBaseUrl(configurations[i]["dhis_username"]);
      config.setBaseUrl(configurations[i]["dhis_password"]);
      configs.add(config);
    }
    return configs.first;
  }
  Future<void> saveConfig(Config config) async {
    var data = {'base_url': config.getBaseUrl(), 'username': config.getUsername(), 'password': config.getPassword()};//data to be encrypted
    sqliteDb.insert('configuration', data);
  }
}