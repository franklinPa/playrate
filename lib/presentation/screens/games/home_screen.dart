import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playrate/presentation/screens/providers/games/games_providers.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _HomeView(),
      )
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView(
  );

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    
    super.initState();
    ref.read(upcomingProvider.notifier).loadNextPageSize();
  }

  @override
  Widget build(BuildContext context) {

    final upcoming = ref.watch(upcomingProvider);

    return ListView.builder(
      itemCount: upcoming.length,
      itemBuilder: (context, index) {
        final game = upcoming[index];
        return ListTile(
          title: Text(game.name),
        );
      },
    );
  }
}