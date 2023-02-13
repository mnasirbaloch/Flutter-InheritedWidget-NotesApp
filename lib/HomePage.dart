import 'package:flutter/material.dart';
import 'package:flutter_inherited_widget_notes_app/MyInheritedWidget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.1),
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.lightBlue,
        ),
        actions: const [
          Icon(
            Icons.all_inclusive,
            color: Colors.lightBlue,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        color: Colors.black.withOpacity(0.1),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "My Lists",
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("/allTasksList");
                        },
                        child: createItemCard(
                          buildContext: context,
                          iconData: Icons.more_horiz,
                          title: "All Tasks",
                          itemCount:
                              "${MyInheritedWidget.of(context).state.itemCount} Items",
                          bgColor: const Color(0xffFDFAF5),
                          // bgColor: Colors.transparent,
                          textColor: const Color(0xffEEBA66),
                          iconContainerColor: const Color(0xffFCF1DF),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: createItemCard(
                        buildContext: context,
                        iconData: Icons.more_horiz,
                        title: "Personal Stuff",
                        itemCount: "0 Items",
                        bgColor: const Color(0xffF5FBFB),
                        iconContainerColor: const Color(0xffDEF2F1),
                        textColor: const Color(0xff75CBCA),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: createItemCard(
                        buildContext: context,
                        iconData: Icons.sunny,
                        title: "Ideas",
                        itemCount: "0 Items",
                        bgColor: const Color(0xffeafbf9),
                        textColor: const Color(0xff26bfb2),
                        iconContainerColor: const Color(0xff95eae2),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: createItemCard(
                        buildContext: context,
                        iconData: Icons.work,
                        title: "Work",
                        itemCount: "0 Items",
                        bgColor: const Color(0xfffeedfa),
                        iconContainerColor: const Color(0xfff9c9ef),
                        textColor: const Color(0xffe97fd9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}

Widget createItemCard(
    {required BuildContext buildContext,
    required IconData iconData,
    required String title,
    required String itemCount,
    required Color bgColor,
    required Color iconContainerColor,
    required Color textColor}) {
  double width = MediaQuery.of(buildContext).size.width;
  double height = MediaQuery.of(buildContext).size.height;
  return Material(
    elevation: 5,
    color: bgColor,
    child: Container(
      width: width * 0.4,
      height: height * 0.30,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconContainerColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Material(
              elevation: 5,
              color: iconContainerColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Icon(
                iconData,
                color: textColor,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FittedBox(
            child: Text(
              title,
              style: TextStyle(color: textColor),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          FittedBox(
            child: Text(
              itemCount,
              style: TextStyle(
                color: textColor,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget noTaskFound(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.darken),
              filterQuality: FilterQuality.low,
              image: const AssetImage(
                "images/cato.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Add Your Task First",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}
