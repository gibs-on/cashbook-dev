import 'package:cashbook/stores/profile_store.dart';
import 'package:flutter/material.dart';

class QuestionDetailScreen extends StatelessWidget {
  const QuestionDetailScreen({Key? key}) : super(key: key);

  static const routeName = '/question-detail-screen';

  @override
  Widget build(BuildContext context) {
    final routeData = ModalRoute.of(context);
    if (routeData == null) {
      Navigator.of(context).pop();
    }
    final HelpQNA helpQNA = routeData!.settings.arguments as HelpQNA;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),

        body: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(

            child: Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    helpQNA.question,
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  Text(
                    helpQNA.answer,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                  ),
                  // Card(
                  //
                  //   child: Container(
                  //     child: Align(
                  //       alignment:FractionalOffset.bottomCenter,
                  //       child: Container(
                  //       child: Column(
                  //         children: <Widget>[
                  //            Column(
                  //             children: <Widget>[
                  //               const ListTile(
                  //
                  //                 leading: Icon(Icons.album),
                  //                 title: Text('The Enchanted Nightingale'),
                  //                 subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  //               ),
                  //               Row(
                  //                 mainAxisAlignment: MainAxisAlignment.end,
                  //                 children: <Widget>[
                  //                   TextButton(
                  //                     child: const Text('BUY TICKETS'),
                  //                     onPressed: () {/* ... */},
                  //                   ),
                  //                   const SizedBox(width: 8),
                  //                   TextButton(
                  //                     child: const Text('LISTEN'),
                  //                     onPressed: () {/* ... */},
                  //                   ),
                  //                   const SizedBox(width: 8),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //
                  //         ],
                  //       ),
                  //     ),),
                  //
                  //
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
