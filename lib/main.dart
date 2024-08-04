import 'package:auth_repository/auth_repository.dart';
import 'package:database_api/database_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pocofino/app/app_router.dart';
import 'package:pocofino/app/app_theme.dart';
import 'package:pocofino/firebase_options.dart';
import 'package:product_repository/product_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter(
    authRepository: AuthRepository(
      firebaseAuth: FirebaseAuth.instance,
      googleSignIn: GoogleSignIn(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(
            firebaseAuth: FirebaseAuth.instance,
            googleSignIn: GoogleSignIn(),
          ),
        ),
        RepositoryProvider(
            create: (context) => ProductRepository(
                  databaseApi: DatabaseApi.instance..clearCachedData(),
                )),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter.config,
        theme: AppTheme.theme,
      ),
    );
  }
}
