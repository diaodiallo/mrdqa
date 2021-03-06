import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          leading: Icon(FontAwesomeIcons.info),
          title: Text("Instructions"),
          onTap: () {
            Navigator.pushReplacementNamed(this.context, this.routes.instructions);
          },
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.infoCircle),
          title: Text("Facility Information"),
          onTap: () {
            Navigator.pushReplacementNamed(this.context, this.routes.facilityInformation);
          },
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.signal),
          title: Text("Indicators"),
          onTap: () {
            Navigator.pushReplacementNamed(this.context, this.routes.indicator);
          },
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.car),
          title: Text("Supervisions"),
          onTap: () {
            Navigator.pushReplacementNamed(this.context, this.routes.supervisions);
          },
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.clipboard),
          title: Text("Data Entry"),
          onTap: () {
            Navigator.pushReplacementNamed(this.context, this.routes.dataEntry);
          },
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.chartPie),
          title: Text("Dashboards"),
          onTap: () {
            Navigator.pushReplacementNamed(this.context, this.routes.dashboards);
          },
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.database),
          title: Text("Database Test"),
          onTap: () {
            Navigator.pushReplacementNamed(this.context, this.routes.databaseTest);
          },
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.wrench),
          title: Text("Configuration"),
          onTap: () {
            Navigator.pushReplacementNamed(this.context, this.routes.configRouteName);
          },
        ),
        Divider(),
      ],
    );
  }

}