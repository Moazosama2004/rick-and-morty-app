import 'package:flutter/material.dart';

class CharactersView  extends StatelessWidget {
  const CharactersView ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Moaz Osama'),
        leading: const Icon(
          Icons.search,
        ),
      ),
    );
  }
}