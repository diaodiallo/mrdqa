import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mrdqa_tool/menus/MenuManager.dart';
import 'package:mrdqa_tool/routes/Routes.dart';

class FacilityInformationPage extends StatefulWidget {
  static String routeName = '/facility_information';

  @override
  _FacilityInformationPageState createState() => _FacilityInformationPageState();

}

class _FacilityInformationPageState extends State<FacilityInformationPage> {
  //String _heading = "Enter details for health facilities selected for review.  Select the number of facilities using the drop-down combo box below. (Click on the facility number to jump to the health facility page)";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Facility Information"),
      ),
      drawer: Drawer(
        child: MenuManager(context, Routes()).getDrawer(),
      ),
        body: Center(
          child: Container(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: FutureBuilder(
                      future: rootBundle.loadString('assets/facility_info_page_title.md'),
                      builder: (BuildContext context, AsyncSnapshot<String> snapshot){

                        if (snapshot.hasData){
                          return Markdown(
                            data: snapshot.data,
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )
                ),
              ],
            ),
          ),
        ),
    );
  }

}
