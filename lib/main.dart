import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/api/api_services.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/imports.dart';
import 'package:movie_app/view/screens/dashboard/bloc/bottom_nav_cubit.dart';
import 'package:movie_app/view/screens/dashboard/dashboard_screen.dart';
import 'package:movie_app/view/screens/home/bloc/movie_list_cubit.dart';
import 'package:movie_app/view/screens/movie_detail/bloc/movie_detail_cubit.dart';
import 'package:movie_app/view/screens/video_player/bloc/video_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final apiServices = ApiServices();
  MovieRepository movieRepository = MovieRepository(apiServices: apiServices);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavCubit>(create: (context) => BottomNavCubit()),
        BlocProvider<MovieListCubit>(
          create: (context) => MovieListCubit(movieRepository),
        ),
        BlocProvider<MovieDetailCubit>(
          create: (context) => MovieDetailCubit(movieRepository),
        ),

        BlocProvider<VideoCubit>(
          create: (context) => VideoCubit(movieRepository),
        ),
      ],
      child: MyApp(),
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.shortestSide > 600;
    final bool isLargeTablet = MediaQuery.of(context).size.shortestSide > 800;
    Size designSize;
    if (isLargeTablet) {
      designSize = const Size(1024, 1366);
    } else if (isTablet) {
      designSize = const Size(768, 1024);
    } else {
      designSize = const Size(411.4, 866.3);
    }

    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      fontSizeResolver:
          (size, util) =>
              _fontSizeResolver(size, isTablet, isLargeTablet, util),
      builder:
          (context, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.noScaling),
            child: MaterialApp(
              navigatorKey: navigatorKey,
              title: AppConstants.appName,
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              theme: light(context),
              builder: FlutterSmartDialog.init(
                loadingBuilder: (string) => const Loading(),
                builder: (context, child) {
                  return child ?? const SizedBox();
                },
              ),
              home: const DashboardScreen(),
            ),
          ),
    );
  }

  double _fontSizeResolver(size, isTablet, isLargeTablet, ScreenUtil util) {
    double scaleFactor = 1.0;
    if (isTablet || isLargeTablet) {
      scaleFactor = 1.0;
    } else {
      scaleFactor = util.scaleText;
    }
    return size * scaleFactor;
  }
}
