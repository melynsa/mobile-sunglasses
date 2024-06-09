import 'dart:js';

import 'package:flutter/widgets.dart';
import 'package:sunglasses/cart/cart_page.dart';
import 'package:sunglasses/landing/landing_page.dart';
import 'package:sunglasses/home/home_page.dart';
import 'package:sunglasses/home/product_tile.dart';
import 'package:sunglasses/product_details/product_details.dart';
import 'package:sunglasses/form/auth.dart';

final Map<String, WidgetBuilder> routes = {
HomePage.routeName:(context) => const HomePage(),
LoginScreen.routeName:(context) => LoginScreen(),
};