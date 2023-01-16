import 'package:flutter/material.dart';
import 'package:gamepedia/constants/color.dart';
import 'package:gamepedia/screens/gameInfoScreen.dart';
import 'package:provider/provider.dart';
import 'provider/gameprovider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'screens/gamedatascreen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<GameProvider>(
            create: (_) => GameProvider(),
          ),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            themeMode: ThemeMode.dark,
            theme: ThemeData.dark().copyWith(
              primaryColor: Color.fromRGBO(89, 217, 121, 1),
              scaffoldBackgroundColor: MyColors.backgroundColor,
            ),
            home: const MyHomePage(title: 'Gamepedia'),
            routes: {
              GameInfoScreen.routeName: (context) => const GameInfoScreen(),
            }));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<GameProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.backgroundColor,
          title: Text(
            widget.title,
            style: const TextStyle(color: MyColors.primaryTextColor),
          ),
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: prov.getBooks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: MyColors.primaryTextColor,
                    ));
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return const Center(
                        child: Text(
                            'Error! Please check your connection or try again later'));
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    return const GameDataScreen();
                  }
                  return Container();
                }),
          ],
        ));
  }
}
