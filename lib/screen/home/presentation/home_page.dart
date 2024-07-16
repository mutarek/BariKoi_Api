import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recepi_app_with_dio/screen/home/controller/home_controller.dart';
import 'package:recepi_app_with_dio/screen/home/models/response/district_response.dart';

import '../../../global/widget/custom_dropdown_item.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: Obx(() => Padding(
              padding: EdgeInsets.all(14),
              child: Column(
                children: [
                  controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomDropDownItem<Places>(
                          lists:
                              controller.districtResponse?.value.places ?? [],
                          hint: "Select Division",
                          onChanged: (selectedValue) {
                            controller
                                .getSubDistrcit(selectedValue?.name ?? "");
                            // Handle the selected value here
                            // controller.divisionId = selectedValue!.id!.toInt();
                            // controller.zealaId = 0;
                            // controller.thanaId = 0;
                            // print('Selected value: ${selectedValue?.toJson()}');
                            // controller.responseListDistrict.value = [];
                            // controller.responseListThana.value = [];
                            // controller.getDistrict(selectedValue!.id!.toInt());
                          },
                          displayTextExtractor: (item) => item.name ?? '',
                          valueConverter: (value) {
                            return Places.fromJson(
                                value as Map<String, dynamic>);
                          },
                        ),
                  SizedBox(height: 20),
                  Text("Sub District"),
                  SizedBox(height: 20),
                  controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomDropDownItem<Places>(
                          lists: controller.subDistrictResponse?.value.places ??
                              [],
                          hint: "Select Sub District",
                          onChanged: (selectedValue) {},
                          displayTextExtractor: (item) => item.name ?? '',
                          valueConverter: (value) {
                            return Places.fromJson(
                                value as Map<String, dynamic>);
                          },
                        ),
                ],
              ),
            )));
  }
}
