import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gamepedia/constants/color.dart';
import 'package:gamepedia/provider/gameprovider.dart';
import 'package:provider/provider.dart';

import 'gameInfoScreen.dart';

class GameDataScreen extends StatefulWidget {
  const GameDataScreen({Key? key}) : super(key: key);

  @override
  _DataWidgetState createState() => _DataWidgetState();
}

class _DataWidgetState extends State<GameDataScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<GameProvider>(context);
    return Expanded(
        child: ListView.builder(
            // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2, childAspectRatio: 3.0 / 4.6),
            itemCount: prov.gdata.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, GameInfoScreen.routeName,
                      arguments: prov.gdata[index]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // decoration: BoxDecoration(
                      //     backgroundBlendMode: BlendMode.darken,
                      //     // color: Colors.black12,
                      //     borderRadius: BorderRadius.circular(6.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(6.0),
                                child: Image.network(
                                  prov.gdata[index].thumbnail.toString(),
                                  fit: BoxFit.contain,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              prov.gdata[index].title.toString(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: MyColors.primaryTextColor),
                            ),
                            Text(
                              prov.gdata[index].shortDescription.toString(),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: MyColors.primaryTextColor),
                                      color: MyColors.primaryTextColor,
                                      borderRadius: BorderRadius.circular(6.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      prov.gdata[index].platform.toString(),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: MyColors.primaryTextColor),
                                      color: MyColors.primaryTextColor,
                                      borderRadius: BorderRadius.circular(6.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      prov.gdata[index].genre.toString(),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              prov.gdata[index].publisher.toString(),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Divider()
                          ],
                        ),
                      ),
                    ),
                  ));
            }));
  }
}
