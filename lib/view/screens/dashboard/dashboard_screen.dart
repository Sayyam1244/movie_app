import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/model/bottom_nav_model.dart';
import 'package:movie_app/imports.dart';
import 'package:movie_app/view/screens/dashboard/bloc/bottom_nav_cubit.dart';
import 'package:movie_app/view/screens/home/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<BottonNavItemModel> bottomNavItems = [
    BottonNavItemModel(
      title: 'Dasboard',
      icon: AssetIcons.dashboard,
      screen: HomeScreen(),
    ),
    BottonNavItemModel(
      title: 'Watch',
      icon: AssetIcons.watch,
      screen: Container(color: Colors.green),
    ),
    BottonNavItemModel(
      title: 'Media Library',
      icon: AssetIcons.library,
      screen: Container(color: Colors.blue),
    ),
    BottonNavItemModel(
      title: 'More',
      icon: AssetIcons.more,
      screen: Container(color: Colors.yellow),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          extendBody: true,
          body: bottomNavItems[selectedIndex].screen,
          bottomNavigationBar: Container(
            height: 75.sp,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(27),
                topRight: Radius.circular(27),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(bottomNavItems.length, (index) {
                final item = bottomNavItems[index];
                final isSelected = selectedIndex == index;
                final color =
                    isSelected
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onPrimaryContainer;
                return IconButton(
                  onPressed: () {
                    context.read<BottomNavCubit>().selectNavItem(index);
                  },
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(item.icon, color: color),
                      8.verticalSpace,
                      Text(
                        item.title,
                        style: bodySmall(context).copyWith(color: color),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
