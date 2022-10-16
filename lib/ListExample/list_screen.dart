// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../HomeExample/utils/colors.dart';
import 'list_controller.dart';

class ExampleListScreen extends StatelessWidget {
  ExampleListScreen({Key? key}) : super(key: key);

  ListController listController = Get.put(ListController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyColors.bgColor,
      appBar: _buildAppBar(),
      body: GetBuilder<ListController>(builder: (controller) {

        return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: controller.isLoadingRequest
                ? _buildLoading()
                : _buildMainBody());
      }),
    );
  }

  /// AppBar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: MyColors.prColor,
      centerTitle: true,
      title: const Text("Restful API - Dio"),
    );
  }

  /// Floating Action Button
  // FloatingActionButton _buildFAB() {
  //   return FloatingActionButton(
  //     onPressed: () {
  //       homeController.isListViewScrollToTheDown.value
  //           ? homeController.scrollListViewUpward()
  //           : homeController.scrollListViewDownward();
  //     },
  //     backgroundColor: MyColors.prColor,
  //     child: FaIcon(
  //       homeController.isListViewScrollToTheDown.value
  //           ? FontAwesomeIcons.arrowUp
  //           : FontAwesomeIcons.arrowDown,
  //     ),
  //   );
  // }

  /// When Internet is't Okay, show thsi widget
  Center _buildNoInternetConnection(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 180,
            height: 180,
            child: Lottie.asset('assets/b.json'),
          ),
          // MaterialButton(
          //   onPressed: () => _materialOnTapButton(context),
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          //   color: MyColors.prColor,
          //   child: const Text(
          //     "Try Again",
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.w300,
          //         fontSize: 12),
          //   ),
          // )
        ],
      ),
    );
  }

  /// Main Body
  RefreshIndicator _buildMainBody() {
    return RefreshIndicator(
      color: MyColors.prColor,
      onRefresh: () {
        return listController.getCurrencies();
      },
      child: listController.listCurrencies.isEmpty
          ? Text("empty",style: TextStyle(fontSize: 50),)
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: listController.listCurrencies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    padding: const EdgeInsetsDirectional.all(20),
                    child: Text(
                      listController.listCurrencies[index].dValue,
                      style: const TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ),
                );
              },
            ),
    );
  }

  // _buildOldCard(){
  // return  Card(
  //     child: ListTile(
  //       leading: Container(
  //         width: 50,
  //         height: 50,
  //         decoration: BoxDecoration(
  //           color: Colors.grey[400],
  //           borderRadius: BorderRadius.circular(7),
  //         ),
  //         child: Center(
  //           child: Text(homeController.posts[index].id.toString()),
  //         ),
  //       ),
  //       title: Text(
  //         homeController.posts[index].title,
  //       ),
  //       subtitle: Text(
  //         homeController.posts[index].body,
  //         style: const TextStyle(
  //           fontWeight: FontWeight.w300,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  /// Loading Widget
  Center _buildLoading() {
    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: Lottie.asset(
          'assets/a.json',
        ),
      ),
    );
  }

  /// onTap Func of "Try Again Button"
// void _materialOnTapButton(BuildContext context) async {
//   if (await InternetConnectionChecker().hasConnection == true) {
//     homeController.getPosts();
//   } else {
//     showCustomSnackBar(context);
//   }
// }

}
