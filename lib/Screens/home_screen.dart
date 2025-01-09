import 'package:flutter/material.dart';
import 'package:riverpord_example/Components/custom_button.dart';
import 'package:riverpord_example/Examples/Counter%20App/counter_app.dart';
import 'package:riverpord_example/Examples/Crud%20Operation/item_screen.dart';
import 'package:riverpord_example/Examples/Favorite%20App/favorite_screen.dart';
import 'package:riverpord_example/Examples/Multiple%20State/multiple_state.dart';
import 'package:riverpord_example/Examples/Slider/slider_app.dart';
import 'package:riverpord_example/Examples/State%20Notifier%20Provider/search_screen.dart';
import 'package:riverpord_example/Examples/Switch/switch_app.dart';

import '../Examples/Button/button_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(
          spacing: 10,
          children: [
            CustomButton(
              label: "Counter App",
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CounterApp()));
              },
            ),
            CustomButton(
              label: "Switch App",
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SwitchApp()));
              },
            ),
            CustomButton(
              label: "Slider App",
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SliderApp()));
              },
            ),
            CustomButton(
              label: "Show Loading",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ButtonLoading()));
              },
            ),
            Divider(),
            CustomButton(
              label: "Multiple State",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => MultipleState()));
              },
            ),
            CustomButton(
              label: "Search",
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SearchScreen()));
              },
            ),
            CustomButton(
              label: "Item Screen With CRUD Operation",
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ItemScreen()));
              },
            ),
            CustomButton(
              label: "Favorite Screen",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => FavoriteScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
