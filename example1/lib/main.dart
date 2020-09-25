import 'package:example1/menuitems.dart';
import 'package:example1/segmentedbutton.dart';
import 'package:flutter/material.dart';
import 'package:selection_menu/components_configurations.dart';
import 'package:selection_menu/selection_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatelessWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          _buildMenu(
            text: 'About Us',
            height: 0.14,
            weight: 0.2,
            type: ButtonType.btnLeftRadius,
            itemsList: aboutUs,
          ),
          _buildMenu(
            text: 'Directory',
            height: 0.19,
            weight: 0.3,
            type: ButtonType.btnNoRadius,
            itemsList: directory,
          ),
          _buildMenu(
            text: 'Translation',
            height: 0.3,
            weight: 0.2,
            type: ButtonType.btnNoRadius,
            itemsList: translation,
          ),
          _buildMenu(
            text: 'Courses & Events',
            height: 0.19,
            weight: 0.2,
            type: ButtonType.btnRightRadius,
            itemsList: courses,
          ),
        ],
      ),
    );
  }

  Widget _buildMenu(
      {String text,
      double height,
      double weight,
      ButtonType type,
      List<MenuItem> itemsList}) {
    return Container(
      child: SelectionMenu<MenuItem>(
        itemsList: itemsList,
        onItemSelected: onItemSelected,
        itemBuilder: itemBuilder,
        componentsConfiguration: DropdownComponentsConfiguration<MenuItem>(
          menuComponent: MenuComponent(builder: (MenuComponentData data) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFF569AC9),
              ),
              child: Column(
                children: <Widget>[
                  data.isSearchEnabled
                      ? Expanded(
                          child: data.searchBar,
                          flex: data.menuFlexValues.searchBar,
                        )
                      : Container(), // Show an nothing (empty) container when search is disabled.
                  Expanded(
                    child: data.listView,
                    flex: data.menuFlexValues.listView,
                  ),
                ],
              ),
            );
          }),
          menuSizeConfiguration: MenuSizeConfiguration(
            maxHeightFraction: height,
            minHeightFraction: 0.0,
            maxWidthFraction: weight,
            minWidthFraction: 0.0,
          ),
          menuPositionAndSizeComponent: MenuPositionAndSizeComponent(
              builder: (MenuPositionAndSizeComponentData data) {
            return MenuPositionAndSize(
              positionOffset:
                  Offset(0.0, data.triggerPositionAndSize.size.height),
              constraints: data.constraints,
            );
          }),
          triggerComponent:
              TriggerComponent(builder: (TriggerComponentData data) {
            return SegmentedButton(
              onTap: data.triggerMenu,
              color: Color(0xFF569AC9),
              login: false,
              text: text,
              type: type,
            );
          }),
        ),
      ),
    );
  }

  Widget itemBuilder(
      BuildContext context, MenuItem item, OnItemTapped onItemTapped) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)
              // borderRadius: index == 0
              //     ? BorderRadius.only(
              //         topLeft: Radius.circular(8.0),
              //         topRight: Radius.circular(8.0),
              //       )
              //     : index == _overall.length
              //         ? BorderRadius.only(
              //             bottomLeft: Radius.circular(8.0),
              //             bottomRight: Radius.circular(8.0),
              //           )
              //         : BorderRadius.zero,
              ),
          onTap: () {},
          title: Text(
            item.text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void onItemSelected(MenuItem item) {
    print(item);
  }
}
