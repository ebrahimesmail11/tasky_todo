import 'package:flutter/material.dart';
import 'package:tasky_todo/features/home/ui/widgets/home_app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBarWidget(),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}