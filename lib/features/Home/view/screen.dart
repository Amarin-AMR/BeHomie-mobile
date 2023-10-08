import 'package:behomie/features/Home/model/example_user.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

import 'package:behomie/network/connectivity_status.dart';
import 'package:behomie/features/Home/viewmodel/viewmodel.dart';

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
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, child) {
          final user = ref.watch(homeViewModelProvider);
          var connectivityStatusProvider =
              ref.watch(connectivityStatusNotifierProvider);

          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              ref
                  .read(connectivityStatusNotifierProvider.notifier)
                  .checkInternet();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    connectivityStatusProvider == ConnectivityStatus.isConnected
                        ? 'Is Connected to Internet'
                        : 'Is Disconnected from Internet',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  backgroundColor: connectivityStatusProvider ==
                          ConnectivityStatus.isConnected
                      ? Colors.green
                      : Colors.red,
                ),
              );
            },
          );

          return user.when(
            data: (data) {
              List<ExampleUser> userList = data.listUser ?? [];
              return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        child: ListTile(
                          title: Text(
                            '${userList[index].name} ',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          subtitle: Text(
                            '${userList[index].description}',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
                    );
                  });
            },
            error: (error, s) => Text(error.toString()),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );

          // return Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       const Text('app.description').tr(),
          //       Text(
          //         '',
          //         style: Theme.of(context).textTheme.headlineMedium,
          //       ),
          //             Text(
          //               "Value: $counter",
          //               style: Theme.of(context).textTheme.headlineMedium,
          //             ),
          // Text(
          //   'app.counter',
          //   style: Theme.of(context).textTheme.headlineMedium,
          // ).plural(counter),
          //       FloatingActionButton(
          //         onPressed: () async {
          //           // refresh;
          //           // ref
          //           //     .read(connectivityStatusNotifierProvider.notifier)
          //           //     .checkInternet();
          //         },
          //         tooltip: tr('Increment'),
          //         child: const Icon(Icons.add),
          //       ),
          //     ],
          //   ),
          // );
        },
      ),
    );
  }
}
