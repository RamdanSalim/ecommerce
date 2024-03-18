import 'package:ecommerce/data/models/product_adpater.dart';
import 'package:ecommerce/resource/di.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:ecommerce/utils/string_contants.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:ecommerce/resource/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'data/adapter/cart_adapter.dart';
import 'data/models/product_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAgHw7exD57N8zxFAKnPAbMyjhnB0c71o4",
          appId: "1:1017563269786:android:3fff22058586cd0412ad23",
          messagingSenderId: "1017563269786",
          projectId: "ecommerce-test-f3852"));
  initDB();

  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapterAdapter());
  await Hive.openBox<ProductAdapter>(StrConst.hiveCart);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    GeneratedRoutes generatedRoutes = GeneratedRoutes();
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, child) => MaterialApp(
        title: 'Ecommerce',
        theme: ThemeData(
          fontFamily: 'Manrope',
        ),
        onGenerateRoute: generatedRoutes.generatedRoutes,
        initialRoute: '/',
      ),
    );
  }
}
