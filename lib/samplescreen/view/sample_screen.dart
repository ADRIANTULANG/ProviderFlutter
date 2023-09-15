// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';

// import 'dart:convert';

// List<StoreModel> storeModelFromJson(String str) =>
//     List<StoreModel>.from(json.decode(str).map((x) => StoreModel.fromJson(x)));

// String storeModelToJson(List<StoreModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class StoreModel {
//   String name;
//   String rate;

//   StoreModel({
//     required this.name,
//     required this.rate,
//   });

//   factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
//         name: json["name"],
//         rate: json["rate"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "rate": rate,
//       };
// }

// class OrderAppController extends GetxController {
//   @override
//   void onInit() async {
//     var data = jsonEncode([
//       {"name": "store1", "rate": "1"},
//       {"name": "store2", "rate": "2"},
//       {"name": "store3", "rate": "3"},
//       {"name": "store4", "rate": "4"},
//     ]);
//     stores.assignAll(await storeModelFromJson(data));
//     storesMaster.assignAll(stores);
//     super.onInit();
//   }

//   RxList<StoreModel> stores = <StoreModel>[].obs;
//   RxList<StoreModel> storesMaster = <StoreModel>[].obs;

//   Timer? debounce;

//   searchStore({required String keyword}) async {
//     stores.clear();
//     if (keyword != '') {
//       for (var i = 0; i < storesMaster.length; i++) {
//         if (storesMaster[i].name.toLowerCase().toString().contains(keyword) ||
//             storesMaster[i].rate.toLowerCase().toString().contains(keyword)) {
//           stores.add(storesMaster[i]);
//         }
//       }
//     } else {
//       stores.assignAll(storesMaster);
//     }
//   }
// }

// class OrderApp extends GetView<OrderAppController> {
//   const OrderApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(OrderAppController());
//     return Scaffold(
//       body: SafeArea(
//         child: SizedBox(
//           height: 100.h,
//           width: 100.w,
//           child: Padding(
//             padding: EdgeInsets.only(left: 5.w, right: 5.w),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 SizedBox(
//                   height: 7.h,
//                   width: 100.w,
//                   child: TextField(
//                     onChanged: (value) {
//                       controller.searchStore(keyword: value);
//                     },
//                     decoration: InputDecoration(
//                         fillColor: Colors.white,
//                         filled: true,
//                         contentPadding: EdgeInsets.only(left: 3.w),
//                         alignLabelWithHint: false,
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8)),
//                         hintText: 'Search'),
//                   ),
//                 ),
//                 Expanded(
//                     child: SizedBox(
//                   child: Obx(
//                     () => ListView.builder(
//                       itemCount: controller.stores.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Padding(
//                           padding:
//                               EdgeInsets.only(left: 5.w, right: 5.w, top: 2.h),
//                           child: SizedBox(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   controller.stores[index].name,
//                                 ),
//                                 SizedBox(
//                                   height: .5.h,
//                                 ),
//                                 Text(
//                                   controller.stores[index].rate,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
