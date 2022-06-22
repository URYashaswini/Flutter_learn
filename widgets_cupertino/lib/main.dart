import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
  //runApp(myAppp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(Object context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_solid),
            label: "Articles",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.eye_solid),
            label: "Views",
          )
        ],
      ),
      tabBuilder: (context, i) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: (i == 0) ? Text("Articles") : Text("Views"),
              ),
              child: Center(
                child: CupertinoButton(
                  child: Text(
                    "The tab is #$i",
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .actionTextStyle
                        .copyWith(fontSize: 32),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (context) {
                      return DetailScreen(i == 0 ? 'Airticles' : 'Views');
                    }));
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class DetailScreen extends StatefulWidget {
  const DetailScreen(this.topic);
  final String topic;

  @override
  State<StatefulWidget> createState() {
    return DetailScreenState();
  }
}

class DetailScreenState extends State<DetailScreen> {
  bool switchvalue = false;
  @override
  Widget build(context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Details"),
      ),
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(75),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(widget.topic)),
                    const Expanded(child: Text('Switch')),
                    CupertinoSwitch(
                      value: switchvalue,
                      activeColor: CupertinoColors.activeBlue,
                      onChanged: (value) {
                        setState(() {
                          switchvalue = value;
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) =>
                                CupertinoAlertDialog(
                              title: const Text('Alert'),
                              content: Text('Switch state changed to $value'),
                              actions: <CupertinoDialogAction>[
                                CupertinoDialogAction(
                                  isDefaultAction: true,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        });
                      },
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class myAppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Text("Hello world",
              style:
                  CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle),
        ),
      ),
    );
  }
}
