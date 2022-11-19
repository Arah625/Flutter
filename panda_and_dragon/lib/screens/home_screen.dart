import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panda_and_dragon/screens/screens.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var myList = [1, 2, 3, 4];

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final screen = const [
    Center(
      child: Text(
        'Bądź odważny. \n \nNigdy nie wiesz, dokąd może cię doprowadzić pierwsze spotkanie.',
      ),
    ),
    Center(
      child: Text('2'),
    ),
    Center(
      child: Text('3'),
    ),
    Center(
      child: Text('4'),
    ),
    Center(
      child: Text('5'),
    ),
  ];

  // final screen = const [
  //   HomeScreen(),
  //   SearchScreen(),
  //   AddScreen(),
  //   AboutScreen()
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customTopAppBar(),
      drawer: _Drawer(),
      body: screen[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.purple, Colors.red],
          ),
        ),
        child: BottomAppBar(
          elevation: 0,
          color: Colors.transparent,
          child: SizedBox(
            height: 56,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBottomBar(
                    text: AppLocalizations.of(context).home,
                    icon: CupertinoIcons.home,
                    iconSelectedColor: Colors.white,
                    selected: _selectedIndex == 0,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                  ),
                  IconBottomBar(
                    text: AppLocalizations.of(context).spring,
                    icon: CupertinoIcons.tree,
                    iconSelectedColor: Colors.green,
                    selected: _selectedIndex == 1,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                  ),
                  IconBottomBar(
                    text: AppLocalizations.of(context).summer,
                    icon: CupertinoIcons.sun_max_fill,
                    iconSelectedColor: Colors.amber,
                    selected: _selectedIndex == 2,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                  ),
                  IconBottomBar(
                    text: AppLocalizations.of(context).autumn,
                    icon: CupertinoIcons.leaf_arrow_circlepath,
                    iconSelectedColor: Colors.brown.shade700,
                    selected: _selectedIndex == 3,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    },
                  ),
                  IconBottomBar(
                    text: AppLocalizations.of(context).winter,
                    icon: CupertinoIcons.snow,
                    iconSelectedColor: Colors.blue,
                    selected: _selectedIndex == 4,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 4;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar customTopAppBar() {
    return AppBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(35))),
      title: Center(
        child: Text(
          AppLocalizations.of(context).topAppBarTitle,
          style: const TextStyle(fontFamily: 'Kalam'),
        ),
        // ignore: prefer_const_literals_to_create_immutables
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: GestureDetector(
            onTap: (() {
              print('Clicked Avatar');
            }),
            child: CircleAvatar(
              backgroundImage: AssetImage('images/pdt.png'),
              radius: 25,
            ),
          ),
        ),
      ],
      backgroundColor: Colors.blueAccent.shade700,
      foregroundColor: Colors.black,
    );
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: myList.length + 1, // + 1 is to handle your Header
//            itemCount: listLength + 1, // + 1 is to handle your Header
        itemBuilder: (context, index) {
          return index == 0
              ? SizedBox(
                  height: 60,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    color: Colors.blueAccent.shade700,
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Stories list",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Kalam',
                            fontSize: 25),
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: 80, // Change this size to make it bigger or smaller
                  child: Card(
                    color: Colors.blueAccent.shade700,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: myList
                              .map((i) => new Text(i.toString()))
                              .toList(),
                          // child: Text(myMap[index][]
                          //   "Index $index",
                          //     style: const TextStyle(
                          //       color: Colors.white,
                          //       fontSize: 18,
                          // ),
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}

class BottomNavigationBarHS extends StatefulWidget {
  const BottomNavigationBarHS({super.key});

  @override
  State<BottomNavigationBarHS> createState() => _BottomNavigationBarHSState();
}

class _BottomNavigationBarHSState extends State<BottomNavigationBarHS> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Colors.purple, Colors.red]),
      ),
      child: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: SizedBox(
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBottomBar(
                  text: AppLocalizations.of(context).spring,
                  icon: Icons.home,
                  iconSelectedColor: Colors.green,
                  selected: _selectedIndex == 0,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                ),
                IconBottomBar(
                  text: AppLocalizations.of(context).summer,
                  icon: Icons.search,
                  iconSelectedColor: Colors.amber,
                  selected: _selectedIndex == 1,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                ),
                IconBottomBar(
                  text: AppLocalizations.of(context).autumn,
                  icon: Icons.add,
                  iconSelectedColor: Colors.brown.shade300,
                  selected: _selectedIndex == 2,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                ),
                IconBottomBar(
                  text: AppLocalizations.of(context).winter,
                  icon: Icons.info,
                  iconSelectedColor: Colors.blue,
                  selected: _selectedIndex == 3,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconSelectedColor;
  final bool selected;
  final Function() onPressed;

  const IconBottomBar(
      {super.key,
      required this.text,
      required this.icon,
      required this.iconSelectedColor,
      required this.selected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? iconSelectedColor : Colors.grey,
          ),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              height: 0.1,
              color: selected ? iconSelectedColor : Colors.grey),
        )
      ],
    );
  }
}
