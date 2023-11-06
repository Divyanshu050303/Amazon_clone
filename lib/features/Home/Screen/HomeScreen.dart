import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/Providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='/name';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
  final user=Provider.of<UserProvider>(context).user;
    return Center(
      child: Text(user.toJson()),
    );
  }
}
