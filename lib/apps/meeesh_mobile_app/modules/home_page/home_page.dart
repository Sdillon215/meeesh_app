import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 640,
      child: Text(
        'Through an “everything you need and nothing you '
        'don’t” approach to our Lifestyle Vehicles, we '
        'are able to offer the best bang-for-your-'
        'buck camper vans on the market.',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
