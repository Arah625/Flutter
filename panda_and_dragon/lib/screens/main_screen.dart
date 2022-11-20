import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panda_and_dragon/screens/about_application_screen.dart';
import 'package:panda_and_dragon/screens/screens.dart';
import 'package:panda_and_dragon/themes/themes.dart';
import 'package:panda_and_dragon/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Home');

  final pages = const [
    HomeScreen(),
    SpringScreen(),
    SummerScreen(),
    AutumnScreen(),
    WinterScreen(),
  ];

  final pageTitles = const ['Home', 'Winter', 'Summer', 'Autumn', 'Winter'];

  void onNavigationItemSelected(index) {
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const _SideDrawer(),
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: ValueListenableBuilder(
            valueListenable: title,
            builder: (BuildContext context, String value, _) {
              return Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              );
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: const Avatar.large(),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const AvatarScreen();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (BuildContext context, int value, _) {
            return pages[value];
          }),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: onNavigationItemSelected,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(CupertinoIcons.refresh_thin),
        onPressed: () {},
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Card(
      color: (brightness == Brightness.light) ? Colors.transparent : null,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16.0, bottom: 8, left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavigationBarItem(
                index: 0,
                label: AppLocalizations.of(context).home,
                icon: CupertinoIcons.home,
                isSelected: (selectedIndex == 0),
                onTap: handleItemSelected,
              ),
              _NavigationBarItem(
                index: 1,
                label: AppLocalizations.of(context).spring,
                icon: CupertinoIcons.tree,
                isSelected: (selectedIndex == 1),
                onTap: handleItemSelected,
              ),
              _NavigationBarItem(
                index: 2,
                label: AppLocalizations.of(context).summer,
                icon: CupertinoIcons.sun_max_fill,
                isSelected: (selectedIndex == 2),
                onTap: handleItemSelected,
              ),
              _NavigationBarItem(
                index: 3,
                label: AppLocalizations.of(context).autumn,
                icon: CupertinoIcons.leaf_arrow_circlepath,
                isSelected: (selectedIndex == 3),
                onTap: handleItemSelected,
              ),
              _NavigationBarItem(
                index: 4,
                label: AppLocalizations.of(context).winter,
                icon: CupertinoIcons.snow,
                isSelected: (selectedIndex == 4),
                onTap: handleItemSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    Key? key,
    required this.onTap,
    required this.index,
    required this.label,
    required this.icon,
    this.isSelected = false,
  }) : super(key: key);

  final ValueChanged<int> onTap;
  final int index;
  final String label;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (() {
        onTap(index);
      }),
      child: SizedBox(
          width: 75,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 20,
                color: isSelected ? AppColors.secondary : null,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                label,
                style: isSelected
                    ? const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary)
                    : const TextStyle(fontSize: 11),
              ),
            ],
          )),
    );
  }
}

class _SideDrawer extends StatelessWidget {
  const _SideDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          drawerHeader(context),
          drawerMenuItems(context),
        ],
      ),
    ));
  }

  Widget drawerHeader(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const Avatar.large(),
        Text(AppLocalizations.of(context).appTitle)
      ],
    ));
  }

  Widget drawerMenuItems(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          leading: const Avatar.small(),
          title: Text(AppLocalizations.of(context).profile),
          onTap: () {
            //chowanie szuflady po przejsciu
//            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const AvatarScreen();
                },
              ),
            );
          },
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          leading: const Icon(CupertinoIcons.heart_fill),
          title: Text(AppLocalizations.of(context).favourites),
          onTap: () {Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const FavouritesScreen();
                },
              ),
            );},
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text(AppLocalizations.of(context).settings),
          onTap: () {Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const SettingsScreen();
                },
              ),
            );},
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          leading: const Icon(CupertinoIcons.info_circle_fill),
          title: Text(AppLocalizations.of(context).about),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const AboutApplication();
                },
              ),
            );
          },
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
