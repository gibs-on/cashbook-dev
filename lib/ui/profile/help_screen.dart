import 'package:cashbook/stores/profile_store.dart';
import 'package:cashbook/ui/profile/question_details.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);
  static const routeName = '/help-screen';

  @override
  Widget build(BuildContext context) {
    var routeData = ModalRoute.of(context);
    if (routeData == null) {
      Navigator.of(context).pop();
    }
    final ProfileStore profileStore =
        routeData!.settings.arguments as ProfileStore;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Help & Support'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: profileStore.helpQNA.length,
            itemBuilder: (BuildContext context, int index) {

              return Card(
                child: InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                      QuestionDetailScreen.routeName,
                      arguments: profileStore.helpQNA[index]),
                  child: ListTile(
                    title: Text(
                      profileStore.helpQNA[index].question,
                      softWrap: true,
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
