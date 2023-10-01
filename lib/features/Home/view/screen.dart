import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import 'package:behomie/features/Home/viewmodel/viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          tr('app.title'),
          style: TextStyle(
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextButton(
              child: Text(
                tr('app.changeLang'),
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: () => setState(() {
                if (context.locale.languageCode == 'en') {
                  context.setLocale(const Locale('th'));
                } else {
                  context.setLocale(const Locale('en'));
                }
              }),
            ),
          )
        ],
      ),
      body: Consumer(builder: (BuildContext context, WidgetRef ref, child) {
        final counter = ref.watch(homeViewModelProvider);

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('app.description').tr(),
              Text(
                "Value: $counter",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'app.counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ).plural(counter),
              FloatingActionButton(
                onPressed: () =>
                    ref.read(homeViewModelProvider.notifier).increment(),
                tooltip: tr('Increment'),
                child: const Icon(Icons.add),
              ),
            ],
          ),
        );
      }),
    );
  }
}
