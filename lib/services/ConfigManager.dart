import 'package:mrdqa_tool/models/Config.dart';

import 'SqliteDatabaseManager.dart';

class ConfigManager{
  final _sqliteDb = SqliteDatabaseManager.instance;

  Future<Config> getConfig() async {
    List<Map> configurations = await _sqliteDb.queryAllRows('configuration');
    List<Config> configs = new List();
    for (var i = 0; i < configurations.length; i++){
      Config config = new Config();
      config.setBaseUrl(configurations[i]["base_url"]);
      config.setUsername(configurations[i]["dhis_username"]);
      config.setPassword(configurations[i]["dhis_password"]);
      configs.add(config);
    }
    return configs.first;
  }
  Future<void> saveConfig(Config config) async {
    var data = {'base_url': config.getBaseUrl(), 'dhis_username': config.getUsername(), 'dhis_password': config.getPassword()};//@Todo data to be encrypted
    _sqliteDb.insert('configuration', data);
  }
}