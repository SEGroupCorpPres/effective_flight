import 'package:dio/dio.dart';
import 'package:effective_flight/app/presentation/pages/app.dart';
import 'package:effective_flight/core/api_service.dart';
import 'package:effective_flight/core/constants/colors.dart';
import 'package:effective_flight/features/presentation/bloc/offers/offers_bloc.dart';
import 'package:effective_flight/features/presentation/bloc/ticket/ticket_bloc.dart';
import 'package:effective_flight/features/presentation/bloc/ticket_offers/ticket_offers_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TicketBloc(ApiService(Dio()))
            ..add(
              FetchTickets(),
            ),
        ),
        BlocProvider(
          create: (context) => OffersBloc(ApiService(Dio()))
            ..add(
              FetchOffers(),
            ),
        ),
        BlocProvider(
          create: (context) => TicketOffersBloc(ApiService(Dio()))
            ..add(
              FetchTicketOffers(),
            ),
        ),
      ],
      child: const CupertinoApp(
        title: 'Flutter Demo',
        theme: CupertinoThemeData(
          applyThemeToAll: true,
          brightness: Brightness.dark,
          primaryColor: AppColors.primaryColor,
          barBackgroundColor: AppColors.black,
          scaffoldBackgroundColor: AppColors.black,
          textTheme: CupertinoTextThemeData(
            tabLabelTextStyle: TextStyle(
              color: CupertinoColors.white,
              fontSize: 13,
            ),
            actionTextStyle: TextStyle(
              color: AppColors.grey6,
              fontStyle: FontStyle.italic,
            ),
            textStyle: TextStyle(
              color: CupertinoColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            navLargeTitleTextStyle: TextStyle(
              color: CupertinoColors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        home: App(),
      ),
    );
  }
}
