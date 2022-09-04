import 'package:event_app/components/event_card.dart';
import 'package:flutter/material.dart';

class PrivatePartyScreen extends StatefulWidget {
  const PrivatePartyScreen({Key? key}) : super(key: key);

  @override
  State<PrivatePartyScreen> createState() => _PrivatePartyScreenState();
}

class _PrivatePartyScreenState extends State<PrivatePartyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5669FF),
        title: Center(child: Text('Events')),
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
