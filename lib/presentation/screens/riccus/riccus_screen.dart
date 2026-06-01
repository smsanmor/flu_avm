import 'package:flutter/material.dart';
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


class RiccusVisum extends StatefulWidget {
  const RiccusVisum({super.key});

  @override
  State<RiccusVisum> createState() => _RiccusVisumState();
}

class _RiccusVisumState extends State<RiccusVisum> {

  final scrollController = ScrollController();

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
}

class _RiccusGrid extends StatelessWidget {

  const _RiccusGrid();

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
     ), 
     itemBuilder: (context, index) {
       return GestureDetector(
        onTap: () {
          context.push('/petitio/${index+1}');
        },
        child: Container(
          color: Colors.blue, 
          child: Center(child: Text('${index + 1}')),
          )
        );
     },

    );
  }
}