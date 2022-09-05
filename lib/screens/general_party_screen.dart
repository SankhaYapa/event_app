import 'package:event_app/components/event_card.dart';
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
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff5669FF),
        title: Center(child: Text("General events and Partys")),
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.menu_outlined),

        // ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child:
                  // Consumer<ItemProvider>(
                  //   builder: (context, value, child)
                  //    {
                  //     return
                  //     value.allItems.isEmpty
                  //         ? Center(child: Text('No Items')) :
                  ListView.builder(
                padding: EdgeInsets.all(10),
                physics: BouncingScrollPhysics(),
                itemCount: 10, //value.allItems.length,
                itemBuilder: (context, index) => EventCard(
                  imageLink:
                      "https://ekrutassets.s3.ap-southeast-1.amazonaws.com/blogs/images/000/004/370/original/H1_Event_marketing.jpg",
                  model: null,
                  // rname: value.allRooms[index].rname,
                  //model: value.allItems[index],
                ),
                //      );
                //},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
