import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currPage = 0;
  final PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    //   Timer.periodic(
    //     const Duration(seconds: 3),
    //     (timer) {
    //       int? nextPage = controller.page?.toInt();

    //       if (nextPage == null) return;

    //       if (nextPage == 4) {
    //         nextPage = 0;
    //       } else {
    //         nextPage++;
    //       }

    //       controller.animateToPage(
    //         nextPage,
    //         duration: const Duration(milliseconds: 500),
    //         curve: Curves.ease,
    //       );
    //     },
    //   );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (currPage > 0) currPage--;
              });

              controller.animateToPage(
                currPage,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            icon: const Icon(Icons.arrow_left),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                if (currPage < 4) currPage++;
              });

              controller.animateToPage(
                currPage,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            icon: const Icon(Icons.arrow_right),
          ),
        ],
      ),
      body: PageView(controller: controller, children: [
        Image.asset(
          'asset/img/image_1.jpeg',
          fit: BoxFit.cover,
        ),
        Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'asset/img/image_3.jpeg',
          fit: BoxFit.cover,
        ),
        Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'asset/img/image_5.jpeg',
          fit: BoxFit.cover,
        ),
      ]),
    );
  }
}
