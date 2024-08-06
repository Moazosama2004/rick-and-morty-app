import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_app/business_logic/character_cubit/character_cubit.dart';
import 'package:rickandmorty_app/core/constants/colors.dart';
import 'package:rickandmorty_app/data/models/character/character.dart';
import 'package:rickandmorty_app/presentation/widgets/character_item.dart';
import 'package:rickandmorty_app/presentation/widgets/character_view_body.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  late List<CharacterModel> allCharacters;
  @override
  void initState() {
    super.initState();
    allCharacters = BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(builder: (ctx, state) {
      if (state is CharacterLoaded) {
        allCharacters = state.characters;
        return buildLoadedListWidgets();
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          // crossAxisSpacing: 1,
          // mainAxisSpacing: 1
        ),
        shrinkWrap: true,
        itemCount: allCharacters.length,
        itemBuilder: (ctx, index) {
          return CharacterItem(
            characterModel: allCharacters[index],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Rick And Morty',
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: buildBlocWidget(),
    );
  }
}
