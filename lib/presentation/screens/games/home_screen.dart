import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child: _HomeView(),
      ),
      bottomNavigationBar: CustomBottomNavigationBar()
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

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
    // final upcoming = ref.watch(upcomingProvider);
    final slideShowGames = ref.watch(gamesSlideshowProvider);

    return Column(
      children: [
        const CustomAppbar(),
        
        GamesSlideshow(
          games: slideShowGames
        ),
      ],
    );
  }
}
