import 'dart:async';
import 'dart:developer';

import 'package:api_repository/api_repository.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:database_api/database_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pocofino/app/app_router.dart';
import 'package:pocofino/app/app_theme.dart';
import 'package:pocofino/app/view/app.dart';
import 'package:pocofino/firebase_options.dart';
import 'package:product_repository/product_repository.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    runAppIn();
  }, (error, trace) {
    Fluttertoast.showToast(msg: "$error");
    log("An unhandled exception occured", error: error, stackTrace: trace);
  });
}

void runAppIn() {
  final databaseApi = DatabaseApi.instance..clearCachedData();

  runApp(App(
    authRepository: AuthRepository(
      firebaseAuth: FirebaseAuth.instance,
      googleSignIn: GoogleSignIn(),
      apiRepository: ApiRepository(),
    ),
    databaseApi: databaseApi,
    productRepository: ProductRepository(
      databaseApi: databaseApi,
    ),
  ));
}
