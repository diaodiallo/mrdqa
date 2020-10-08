import 'package:flutter/material.dart';
import 'package:mrdqa_tool/routes/Routes.dart';

class MenuManager {
  BuildContext context;
  Routes routes;

  MenuManager(this.context, this.routes);

  Widget getDrawer(){

    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 20)),
        ListTile(
          leading: Icon(Icons.info),
          title: Text("Instructions"),
          onTap: () {
            Navigator.pushReplacementNamed(this.context, this.routes.instructions);
          },
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text("Facility Information"),
          onTap: () {
            Navigator.pushReplacementNamed(this.context, this.routes.facilityInformation);
          },
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text("Indicators"),
          onTap: () {
            Navigator.pushReplacementNamed(this.context, this.routes.indicator);
          },
        ),
        Divider(),
      ],
    );
  }

}