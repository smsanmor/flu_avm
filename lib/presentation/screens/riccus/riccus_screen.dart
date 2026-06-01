import 'package:flu_avm/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RiccusScreen extends StatelessWidget {
  const RiccusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RiccusVisum(),
    );
  }
}


class RiccusVisum extends ConsumerStatefulWidget {
  const RiccusVisum({super.key});

  @override
  ConsumerState<RiccusVisum> createState() => _RiccusVisumState();
}

class _RiccusVisumState extends ConsumerState<RiccusVisum> {

  bool oneratusEst = false;

  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels + 200 > scrollController.position.maxScrollExtent) {
        vadeProximamPagina();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          title: Text('Riccus'),
          backgroundColor: Theme.of(context).secondaryHeaderColor.withValues(alpha: 0.5),
        ),

        _RiccusGrid()
      ],
    );
  }

  Future vadeProximamPagina() async {

    if  (oneratusEst) return;

    oneratusEst = true;

    await Future.delayed(const Duration(seconds: 2));

    ref.read(riccuIdsProvider.notifier).update((state) => [
      ...state,
      ...List.generate(30, (index) => state.length + index + 1)
    ]);

    oneratusEst = false;

    movereScrollAdDescendit();
  }

  void movereScrollAdDescendit() {
    if (scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;
  
    scrollController.animateTo(
      scrollController.position.pixels +200,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn
    );
  }

}

class _RiccusGrid extends ConsumerWidget {

  const _RiccusGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final riccuIds = ref.watch(riccuIdsProvider);

    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
     ),
     itemCount: riccuIds.length,
     itemBuilder: (context, index) {
       return GestureDetector(
        onTap: () {
          context.push('/petitio/${index+1}');
        },
        child: Image.network(
          "https://rickandmortyapi.com/api/character/avatar/${index + 1}.jpeg",
          fit: BoxFit.contain,
          )
        );
     },

    );
  }
}