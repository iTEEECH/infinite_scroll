import 'package:flutter/material.dart';
import 'package:infinite_scroll/src/features/character/character.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final ScrollController _controller = ScrollController();
  final List<Character> _characters = <Character>[];
  int _page = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_loadMore);
    _fetchCharacters(_page);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _fetchCharacters(int page) async {
    final repository = CharacterRepositoryImpl();
    final List<Character> result = await repository.fetchAllCharacters(page);

    if(context.mounted) {
      setState(() {
        _characters.addAll(result);
        _isLoading = false;
        _page++;
      });
    }
  }

  bool _loadMore() {
     if (_controller.position.pixels == _controller.position.maxScrollExtent && !_isLoading) {
       _page++;
       _fetchCharacters(_page);
       return true;
     }
     return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disney Character'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ),
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) => _loadMore(),
            child: _isLoading
                ? const CharacterLoader()
                : CharacterList(
                controller: _controller,
                characters: _characters,
            ),
          ),
        ),
      ),
    );
  }
}
