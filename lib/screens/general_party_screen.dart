import 'package:event_app/screens/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GeneralPartyPage extends StatefulWidget {
  const GeneralPartyPage({Key? key}) : super(key: key);

  @override
  State<GeneralPartyPage> createState() => _GeneralPartyPageState();
}

class _GeneralPartyPageState extends State<GeneralPartyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.menu_outlined),

        // ),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.account_circle,
                size: 30,
              ));
        }),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_active_outlined),
          ),
        ],
      ),
      drawer: DrawerScreen(),
    );
  }
}
