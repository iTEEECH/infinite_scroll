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
    _fetchAllCharacters();
    _controller.addListener(_onListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_onListener);
    _controller.dispose();
    super.dispose();
  }

  void _onListener() {
    if (_isBottom && !_isLoading) _fetchAllCharacters();
  }

  bool get _isBottom {
    if (!_controller.hasClients) return false;
    final double max = _controller.position.maxScrollExtent;
    final double current = _controller.offset;
    return current >= (max * 0.8);
  }

  Future<void> _fetchAllCharacters() async {
    setState(() => _isLoading = true);

    final repository = CharacterRepositoryImpl();
    final List<Character> results = await repository.fetchAll(page: _page);

    if (context.mounted) {
      setState(() {
        _characters.addAll(results);
        _page++;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Infinite scroll')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: CharacterList(characters: _characters, controller: _controller, isLoading: _isLoading),
        ),
      ),
    );
  }
}
