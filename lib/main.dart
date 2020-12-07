import 'package:flutter/material.dart';
import 'package:restapi_flutter/constants.dart';
import 'package:restapi_flutter/presentation/ui/poke_list_page.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: PokeListPage(),
    );
  }
}
