import 'package:flutter/material.dart';

class PageSelectorExample extends StatelessWidget {
  const PageSelectorExample({super.key});

  static const kIcons = <Icon>[
    Icon(Icons.event),
    Icon(Icons.home),
    Icon(Icons.android),
    Icon(Icons.alarm),
    Icon(Icons.face),
    Icon(Icons.language),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: kIcons.length,
      // Use a Builder here, otherwise DefaultTabController.of(context) below
      // returns null.
      child: Builder(
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              const TabPageSelector(), // هذه عباره عن نقاط تظهر باعلى الصفحة للتنقل بحيث عندما انتقل للصفحة او العنصر الجانبي تصبح جميع النقاط فارغه والعنصر الذي انا فيه تصبح باللون الاسود 
              Expanded(
                child: IconTheme( // استخدمها بحيث عندي قائمة من الايقونات واريد ان اجعل جميعها بنفس اللون ونفس الحجم وغيره من 
                  data: IconThemeData(
                    size: 128.0,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: const TabBarView(children: kIcons), // والمعنى هو عرض الايقونات والنقاط المتواجده فوقها بنفس السير  Row() عملها نفس ال
                ),
              ),
              ElevatedButton(
                onPressed: () { // زر الانتقال الى اخر الصفحة
                  final TabController controller =
                      DefaultTabController.of(context);
                  if (!controller.indexIsChanging) {
                    controller.animateTo(kIcons.length - 1);
                  }
                },
                child: const Text('SKIP'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

