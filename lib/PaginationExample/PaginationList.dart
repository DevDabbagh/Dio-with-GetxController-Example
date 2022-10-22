import 'package:fetch_data_dio/PaginationExample/PaginationController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PaginationExample(
        title: "Pagination",
      ),
    );
  }
}

class PaginationExample extends StatelessWidget {
  String? title;

  PaginationExample({
    this.title,
  });

  PaginationController paginationController = Get.put(PaginationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: GetBuilder<PaginationController>(
        init: paginationController,
        builder: (value) =>
            RefreshIndicator(
              onRefresh: _pullRefresh,
              child: ListView.builder(
                controller: paginationController.controller,
                itemCount: paginationController.list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.blue,
                      height: 100,
                      child: Center(
                        child: Text(paginationController.list[index].name!,
                          style: const TextStyle(color:Colors.white,fontSize: 30),),
                      ),
                    ),
                  );
                },
              ),
            ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    paginationController.initListPage();
  }
}


class Model {
  String? name;

  Model({
    this.name,
  });
}