import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/controller/shake_controller.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:get/get.dart';
import 'package:shake/shake.dart';

class CreateNewProject extends StatefulWidget {
  CreateNewProject({Key? key}) : super(key: key);

  @override
  State<CreateNewProject> createState() => _CreateNewProjectState();
}

class _CreateNewProjectState extends State<CreateNewProject> {
  var photomosaicImage = Get.arguments;
  final shake_controller = Get.put(ShakeController());
  late ShakeDetector shakeaction;
  var blank = Image.asset('assets/images/empty_image.png');
  bool _isVisible = false;

  @override
  void initState() {
    shakeaction = ShakeDetector.autoStart(onPhoneShake: () {
      //shake_controller.ShakeScreen();
      _isVisible = true;
      print('shaking');
      print(_isVisible);
      // setState(() {
      //   shake_controller.ShakeScreen();
      // });
    });
    super.initState();
  }

  Widget _createNewProjectBodyWidget() {
    return Container(
      //height: MediaQuery.of(context).size.height - 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/prolog_new_project_background_image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 65,
              width: MediaQuery.of(context).size.width,
            ),
            Text(
              "Shake to Watch \nNew Photomasaic!",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 25,
            ),
            Visibility(
              visible: true, //_isVisible,
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(photomosaicImage),
                        fit: BoxFit.contain)),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Get.to(mainScreen());
              },
              icon: Icon(
                Icons.add_circle,
              ),
              style: ElevatedButton.styleFrom(primary: kHotpink),
              label: Text("Create New Project"),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Do you want to Share?',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 14,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showShareDialogPop();
                  },
                  icon: Icon(
                    Icons.share,
                  ),
                  color: kWhiteColor,
                )
              ],
            ),
          ]),
    );
  }

  void showAdDialogPop() {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Color.fromARGB(120, 0, 0, 0),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: ((context, setState) {
          return AlertDialog(
            backgroundColor: kBlackColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.clear),
                      color: kWhiteColor,
                    ),
                  ]),
                  Text(
                    'Too Cool For School',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    constraints: BoxConstraints(maxHeight: 200, maxWidth: 200),
                    child: Image.asset(
                      'assets/images/too_cool.jpeg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
        }));
      },
    ).then((value) {
      setState(() {});
    });
  }

  void showShareDialogPop() {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Color.fromARGB(120, 0, 0, 0),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: ((context, setState) {
          return AlertDialog(
            backgroundColor: kBlackColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(
              'Share your Photomosaic',
              style: TextStyle(
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 7,
                    child: Container(
                      width: double.infinity,
                      color: kTextColor,
                      child: Text(
                        'URL',
                        style: TextStyle(
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          //URL 카피
                        },
                        color: kWhiteColor,
                        icon: Icon(Icons.content_copy),
                      )),
                ],
              ),
            ),
          );
        }));
      },
    ).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('CONGRATULATIONS!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            padding: EdgeInsets.all(16.5),
            onPressed: () {
              Get.to(mainScreen());
            },
          )
        ],
      ),
      body: _createNewProjectBodyWidget(),
    );
  }
}
