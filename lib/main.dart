import 'package:flutter/material.dart';
import 'package:neomorphic_music_player/boxshadow.dart';
import 'package:neomorphic_music_player/custom_icon_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              primaryContainer: Colors.black,
              seedColor: Colors.indigoAccent,
              brightness: Brightness.dark,
              onPrimaryContainer: Colors.white70),
          useMaterial3: true,
        ),
        home: const App());
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(icon: Icons.arrow_back),
                  const Text(
                    "PLAYING NOW",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  CustomIconButton(icon: Icons.menu),
                ],
              ),
            ),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black45, width: 10),
                  color: Theme.of(context).colorScheme.background,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(5, 5),
                        blurRadius: 15,
                        spreadRadius: 4),
                    BoxShadow(
                        color: Theme.of(context).colorScheme.background,
                        offset: const Offset(-5, -5),
                        blurRadius: 15,
                        spreadRadius: 2)
                  ]),
              child: const Icon(
                Icons.flutter_dash_rounded,
                size: 100,
                color: Colors.grey,
              ),
            ),
            const Column(
              children: [
                Text(
                  "Dança do 4",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Os Demonios do Sambizanga",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey),
                ),
              ],
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "1:17",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "2:47",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                StatefulBuilder(builder: (context, state) {
                  var currentValue = 0.6;
                  return Slider(
                      value: currentValue,
                      onChanged: (v) => state(() => currentValue = v));
                }),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomIconButton.large(
                        icon: Icons.skip_previous,
                        size: const Size(80, 80),
                      ),
                      CustomIconButton.large(
                        icon: Icons.pause,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: const Size(80, 80),
                      ),
                      CustomIconButton.large(
                        icon: Icons.skip_next,
                        size: const Size(80, 80),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
