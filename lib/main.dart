import 'package:demo/examples/example.dart';

import 'package:demo/providers/add_new_address.dart';
import 'package:demo/providers/all_address_providers.dart';
import 'package:demo/providers/checkOutProviders.dart';
import 'package:demo/providers/data_providers.dart';
import 'package:demo/providers/delete_address.dart';
import 'package:demo/providers/home_provider.dart';
import 'package:demo/providers/locations_providers.dart';
import 'package:demo/providers/my_orderProviders.dart';
import 'package:demo/providers/profile_provider.dart';
import 'package:demo/providers/searsh_providers.dart';
import 'package:demo/providers/update_address.dart';
import 'package:demo/providers/wishlist.dart';
import 'package:demo/screens/add_new_address.dart';
import 'package:demo/screens/cart_screen.dart';
import 'package:demo/screens/detail_accounte.dart';
import 'package:demo/screens/detailes_screen.dart';
import 'package:demo/screens/home_screen.dart';
import 'package:demo/screens/location_screen.dart';
import 'package:demo/screens/login_screen.dart';
import 'package:demo/screens/my_orders.dart';
import 'package:demo/screens/products_screen/products_SeeAll.dart';
import 'package:demo/screens/profile_screen.dart';
import 'package:demo/screens/saved_address.dart';
import 'package:demo/screens/search_screen.dart';
import 'package:demo/screens/sign_up_screen.dart';
import 'package:demo/screens/spilash_screen.dart';
import 'package:demo/screens/wishlist_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Firebase.initializeApp();

  runApp(EasyLocalization(
    child: MyApp(),
    path: 'resources/langs',
    saveLocale: true,
    supportedLocales: [
      Locale('en', 'US'),
      Locale('ar', 'AR'),
    ],
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataProviders>(
           create: (_) => DataProviders()),
        ChangeNotifierProvider<HomeProviders>(
           create: (_) => HomeProviders()),
        ChangeNotifierProvider<WishListProviders>(
            create: (_) => WishListProviders()),
        ChangeNotifierProvider<LocationsProviders>(
            create: (_) => LocationsProviders()),
        ChangeNotifierProvider<ProfileProviders>(
            create: (_) => ProfileProviders()),
        ChangeNotifierProvider<AddNewAddressProviders>(
            create: (_) => AddNewAddressProviders()),
        ChangeNotifierProvider<UpdateAddressProviders>(
            create: (_) => UpdateAddressProviders()),
        ChangeNotifierProvider<AllAddressProviders>(
            create: (_) => AllAddressProviders()),
        ChangeNotifierProvider<DeleteProviders>(
            create: (_) => DeleteProviders()),
        ChangeNotifierProvider<CheckProviders>(
            create: (_) => CheckProviders()),
            ChangeNotifierProvider<MyOrdersProviders>(
            create: (_) => MyOrdersProviders()),
        ChangeNotifierProvider<SearchProviders>(
            create: (_) => SearchProviders())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'pacifo'),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialRoute: SpilashScreen.id,
        routes: {
          SpilashScreen.id: (context) => SpilashScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          DetailsScreen.id: (context) => DetailsScreen(),
          SearchScreenn.id: (context) => SearchScreenn(),
          LocationScreen.id: (context) => LocationScreen(),
          CartScreen.id: (context) => CartScreen(),
          SeeAllProducts.id: (context) => SeeAllProducts(),
          ProfileScreen.id: (context) => ProfileScreen(),
          DetailAccount.id: (context) => DetailAccount(),
          AddNewAddress.id: (context) => AddNewAddress(),
          SavedAddress.id: (context) => SavedAddress(),
          WishListScreen.id: (context) => WishListScreen(),
          MyOrdersScreen.id: (context) => MyOrdersScreen(),
           MyFatora.id: (context) => MyFatora(),
        },
      ),
    );
  }
}
