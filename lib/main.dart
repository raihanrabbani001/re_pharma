import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:re_pharma/models/navigation_item_model.dart';
import 'package:re_pharma/viewmodels/barang_viewmodel.dart';
import 'package:re_pharma/views/layout_view.dart';
import 'package:re_pharma/views/navigation_view.dart';
import 'package:re_pharma/viewmodels/navigation_viewmodel.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'models/barang_model.dart';

Future main() async {
  // testing
  sqfliteFfiInit();
  final data = BarangModel('jqr901', 'Vitamin C', 'A35', 'a');

  final barangvm = BarangViewModel();

  await barangvm.insertData(data);
  await barangvm.updateData(3, BarangModel('aaa', 'bebas', 'bebas juga', 'narkoboy'));
  await barangvm.deleteData(3);
  final d = await barangvm.getData();
  print(d);
  // end
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => NavigationViewModel())],
    child: const MyApp(),
  ));
  doWhenWindowReady(() {
    const initialSize = Size(1280, 720);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/Beranda',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => NavigationView(
        selectedIndex: context.watch<NavigationViewModel>().index,
        onDestinationChanged: (index) {
          context.read<NavigationViewModel>().setIndex(index);
        },
        destination: [
          NavigationItemModel(
            header: 'Main',
            prefix: Icons.abc,
            label: 'Beranda',
          ),
          NavigationItemModel(
            header: 'Transaksi',
            prefix: Icons.abc,
            label: 'Penjualan',
          ),
          NavigationItemModel(
            prefix: Icons.abc,
            label: 'Pembelian',
          ),
          NavigationItemModel(
            header: 'Data Master',
            prefix: Icons.abc,
            label: 'Pelanggan',
          ),
          NavigationItemModel(
            prefix: Icons.abc,
            label: 'Supplier',
          ),
          NavigationItemModel(
            prefix: Icons.abc,
            label: 'Margin',
          ),
          NavigationItemModel(
            prefix: Icons.abc,
            label: 'Barang',
          ),
        ],
        child: child,
      ),
      routes: [
        GoRoute(
          path: '/Beranda',
          builder: (context, state) => const Text("Beranda"),
        ),
        GoRoute(
          path: '/Penjualan',
          builder: (context, state) => const Text("Penjualan"),
        ),
        GoRoute(
          path: '/Pembelian',
          builder: (context, state) => const LayoutView(),
        ),
        GoRoute(
          path: '/Pelanggan',
          builder: (context, state) => const Text("Pelanggan"),
        ),
        GoRoute(
          path: '/Supplier',
          builder: (context, state) => const Text("Supplier"),
        ),
        GoRoute(
          path: '/Margin',
          builder: (context, state) => const Text("Margin"),
        ),
        GoRoute(
          path: '/Barang',
          builder: (context, state) => const LayoutView(),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Re Pharma',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light, seedColor: Colors.green),
        useMaterial3: true,
      ),
    );
  }
}
