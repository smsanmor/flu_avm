import 'package:flutter/material.dart';

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
      ],
    );
  }
}