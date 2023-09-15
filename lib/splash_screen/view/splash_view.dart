import 'package:flutter/material.dart';
import 'package:flutterbloc/splash_screen/controller/splash_item_change.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../controller/splash_controller.dart';
import '../controller/splash_list_controller.dart';
import '../controller/splash_loading_controller.dart';
import '../controller/splash_new_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SplashloadingController>(context, listen: false).setData();
      // if you use true then everytime notifyListeners fires it will run this code, which is undesirable
    });
  }

  @override
  Widget build(BuildContext context) {
    print("reread all the UI");
    return Scaffold(
      body: Consumer<SplashloadingController>(
          builder: (context, splashLoadingController, child) {
        return Container(
          padding: EdgeInsets.only(top: 5.h),
          height: 100.h,
          width: 100.w,
          child: splashLoadingController.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<SplashListController>(
                  builder: (context, splashListController, child) {
                  print("Render upper code");
                  return ListView.builder(
                    itemCount: splashListController.listahan.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Consumer<SplashItemChangeController>(
                                  builder: (context, splashItemChangeController,
                                      child) {
                                    print('Render lower code');
                                    return Text(splashListController
                                        .listahan[index].name
                                        .toString());
                                  },
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(splashListController.listahan[index].age
                                    .toString()),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(splashListController
                                    .listahan[index].userModelBool
                                    .toString()),
                              ],
                            ),
                            IconButton(
                                onPressed: () async {
                                  context
                                          .read<SplashListController>()
                                          .listahan[index]
                                          .name =
                                      await context
                                          .read<SplashItemChangeController>()
                                          .changeElement(
                                              name: "kulas", index: index);
                                },
                                icon: Icon(Icons.edit))
                          ],
                        ),
                      );
                    },
                  );
                }),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Consumer<SplashController>(
          //       builder: (context, splashController, child) {
          //         // Use the provided value (splashController) to build your UI
          //         print('Upper code');
          //         return Container(
          //           height: 100,
          //           width: 100,
          //           color: splashController.colorBool ? Colors.red : Colors.blue,
          //           child:
          //               child, // Add child here to prevent the lower Consumer from rebuilding
          //         );
          //       },
          //       child: Consumer<SplashNewController>(
          //         builder: (context, splashnewcontroller, child) {
          //           print('Lower code');
          //           return Center(
          //               child: Text(
          //             splashnewcontroller.counter.toString(),
          //             style:
          //                 TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          //           ));
          //         },
          //       ),
          //     ),
          //   ],
          // ),
        );
      }),
      floatingActionButton: Container(
        width: 100.w,
        color: Colors.black,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () {
                  context.read<SplashController>().insideCounterMethod();
                }),
            SizedBox(
              width: 1.w,
            ),
            FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {
                  context.read<SplashNewController>().counterMethod();
                }),
            SizedBox(
              width: 1.w,
            ),
            FloatingActionButton(
                backgroundColor: Colors.purple,
                onPressed: () {
                  context.read<SplashListController>().adddToList();
                }),
            SizedBox(
              width: 1.w,
            ),
            FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  final desiredWidget =
                      context.findAncestorWidgetOfExactType<SplashView>();
                  print("is SplashView is in the widget tree?" +
                      desiredWidget.toString());
                }),
            SizedBox(
              width: 1.w,
            ),
            FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  final desiredWidget =
                      context.findAncestorWidgetOfExactType<SplashView>();
                  print("is SplashView is in the widget tree?" +
                      desiredWidget.toString());
                }),
          ],
        ),
      ),
    );
  }
}
