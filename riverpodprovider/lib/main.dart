import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final providerProvider = Provider<String>((ref) => "Number");
final numberProvider = StateProvider<int>((ref) => 0);
 void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final text = ref.watch(providerProvider);
    final count = ref.watch(numberProvider);
    ref.listen(numberProvider, (previous, next) {
      if (next % 5 == 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "The current value $next is multiple of 5",
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          backgroundColor: Colors.amber,
        ));
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverPod Statemanagement'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: () {
              // ref.invalidate(numberProvider);
              ref.refresh(numberProvider);
            },
            iconSize: 30,
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(numberProvider.notifier).state++;
          ref.read(numberProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add_outlined),
      ),
      body: Center(
          child: Text(
        '$text: $count ',
        style: const TextStyle(fontSize: 30, color: Colors.teal),
      )),
    );
  }
}
// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final text = ref.watch(providerProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('RiverPod Statemanagement'),
//       ),
//       body: Center(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextButton(
//                 child: Text(
//                   text,
//                   style: const TextStyle(fontSize: 30),
//                 ),
//                 onPressed: () {},
//               )
//             ]),
//       ),
//     );
//   }
// }
