// * Flutter & Dart Package Importz * //
import 'package:flutter/material.dart';

// * File Importz * //

import 'package:meesh_app/apps/meeesh_mobile_app/meesh_mobile_app.dart';

import 'apps/widgets/app_state.dart';

void main() async {
  runApp(
    const AppStateWidget(
      child: MaterialApp(
        title: 'Meesh`s siq fuckin App',
        debugShowCheckedModeBanner: false,
        home: MeeshApp(),
      ),
    ),
  );
}