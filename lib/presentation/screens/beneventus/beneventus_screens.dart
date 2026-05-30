import 'package:flu_avm/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BeneventusScreens extends ConsumerWidget {
  const BeneventusScreens({super.key});

@override
  Widget build(BuildContext context, WidgetRef ref) {

    final bool estTenebrisModus = ref.watch(estTenebrisModusProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.data_object_rounded, size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    'Flu Avm',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    //icon: Icon(Icons.dark_mode_outlined)
                    onPressed: () {
                      //ref.read(estTenebrisModusProvider.notifier).update((statumTheme) => !estTenebrisModus);
                      ref.read(estTenebrisModusProvider.notifier).state =
                          !estTenebrisModus;
                    },
                    icon: Icon(
                      estTenebrisModus
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode_outlined,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}