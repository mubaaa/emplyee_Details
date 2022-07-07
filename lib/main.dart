import 'package:employes_data/model/model_hive.dart';
import 'package:employes_data/service/dio_service.dart';
import 'package:employes_data/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    Hive.registerAdapter(UserModelAdapter());
  }

  if (!Hive.isAdapterRegistered(AddresAdapter().typeId)) {
    Hive.registerAdapter(AddresAdapter());
  }
  if (!Hive.isAdapterRegistered(GeooAdapter().typeId)) {
    Hive.registerAdapter(GeooAdapter());
  }
  if (!Hive.isAdapterRegistered(CmpanyAdapter().typeId)) {
    Hive.registerAdapter(CmpanyAdapter());
  }

  await Hive.openBox<List>("UserDetails");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioService(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: "Poppins"),
        title: "samp",
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
