import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gamepedia/constants/color.dart';
import 'package:gamepedia/models/gamedata.dart';
import 'package:url_launcher/url_launcher.dart';

class GameInfoScreen extends StatelessWidget {
  const GameInfoScreen({Key? key}) : super(key: key);
  static const routeName = 'gameinfo';

  @override
  Widget build(BuildContext context) {
    final GameData results =
        ModalRoute.of(context)!.settings.arguments as GameData;
    return Scaffold(
      appBar: AppBar(
        title: Text(results.title.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Image.network(results.thumbnail.toString()),
            SizedBox(
              height: 10,
            ),
            Text(results.shortDescription.toString()),
            Text(results.genre.toString()),
            Text(results.platform.toString()),
            Text("Released On: ${results.releaseDate}"),
            Text("Publisher: ${results.publisher}"),
            Text("Developer: ${results.developer}"),
            ElevatedButton(
                child: Text('Play Now!'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        MyColors.primaryTextColor)),
                onPressed: () =>
                    launchUrl(Uri.parse(results.gameUrl.toString()))),
          ],
        ),
      ),
    );
  }
}
