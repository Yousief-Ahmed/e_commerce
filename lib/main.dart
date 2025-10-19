import 'package:e_commerce/core/helper_functions/on_generate_route.dart';
import 'package:e_commerce/core/services/custom_bloc_observer.dart';
import 'package:e_commerce/core/services/getit_service.dart';
import 'package:e_commerce/core/services/shared_prefrences_singleton.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:e_commerce/features/splash/presentation/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPref.init();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = CustomBlocObserver();
  setupGetIt();
  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        scaffoldBackgroundColor: Colors.white,
      ),

      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,

        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale('ar'),
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: ongGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
