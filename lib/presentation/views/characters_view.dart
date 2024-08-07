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
  late List<CharacterModel> searchedForCharacters;
  bool isSearching = false;
  final searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  Widget buildSearchField() {
    return Container(
      height: 40,
      child: TextField(
        controller: searchTextController,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.only(left: 20),
          fillColor: Colors.grey.shade900,
          hintText: 'Find a Character ... ',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          hintStyle: TextStyle(color: kWhite, fontSize: 18),
        ),
        style: TextStyle(color: Colors.white, fontSize: 18),
        onChanged: (searchedChatacter) {
          addSearchedForItemsToSearchedList(searchedChatacter);
        },
      ),
    );
  }

  void addSearchedForItemsToSearchedList(String searchedChatacter) {
    searchedForCharacters = allCharacters
        .where((character) =>
            character.name!.toLowerCase().startsWith(searchedChatacter))
        .toList();
    setState(() {});
  }

  List<Widget> buildAppBarAction() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.clear,
            color: Colors.white,
          ),
        )
      ];
    } else {
      return [
        IconButton(
          onPressed: startSearch,
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        )
      ];
    }
  }

  void startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearch() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    searchTextController.clear();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(builder: (ctx, state) {
      if (state is CharacterLoaded) {
        allCharacters = state.characters;
        return buildLoadedListWidgets();
      } else {
        return const Center(
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
        itemCount:
            isSearching ? searchedForCharacters.length : allCharacters.length,
        itemBuilder: (ctx, index) {
          return CharacterItem(
            characterModel: isSearching
                ? searchedForCharacters[index]
                : allCharacters[index],
          );
        });
  }

  Widget buildAppTitle() {
    return Text(
      'Rick And Morty',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: isSearching ? buildSearchField() : buildAppTitle(),
        centerTitle: true,
        leading: isSearching
            ? BackButton()
            : const Icon(
                Icons.menu,
              ),
        actions: buildAppBarAction(),
      ),
      body: buildBlocWidget(),
    );
  }
}
