import 'package:demo/providers/data_providers.dart';
import 'package:demo/providers/home_provider.dart';
import 'package:demo/providers/wishlist.dart';
import 'package:demo/screens/add_new_address.dart';
import 'package:demo/screens/cart_screen.dart';
import 'package:demo/screens/check_out.dart';
import 'package:demo/screens/detail_accounte.dart';
import 'package:demo/screens/detailes_screen.dart';
import 'package:demo/screens/home_screen.dart';
import 'package:demo/screens/location_screen.dart';
import 'package:demo/screens/login_screen.dart';
import 'package:demo/screens/my_orders.dart';
import 'package:demo/screens/products_screen/products_SeeAll.dart';
import 'package:demo/screens/profile_screen.dart';
import 'package:demo/screens/recipet_screen.dart';
import 'package:demo/screens/saved_address.dart';
import 'package:demo/screens/search_screen.dart';
import 'package:demo/screens/sign_up_screen.dart';
import 'package:demo/screens/spilash_screen.dart';
import 'package:demo/screens/wishlist_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
      EasyLocalization(
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
            create: (_) => WishListProviders())
    ]

       , child: MaterialApp(
          debugShowCheckedModeBanner: false,
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
            CheckOutScreen.id: (context) => CheckOutScreen(),
            ProfileScreen.id: (context) => ProfileScreen(),
            DetailAccount.id: (context) => DetailAccount(),
            AddNewAddress.id: (context) => AddNewAddress(),
            SavedAddress.id: (context) => SavedAddress(),
            WishListScreen.id: (context) => WishListScreen(),
            MyOrdersScreen.id: (context) => MyOrdersScreen(),
            ReceiptScreen.id: (context) => ReceiptScreen(),

          },
        ),
      );




  }
}
