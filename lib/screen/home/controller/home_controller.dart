import 'package:get/get.dart';
import 'package:recepi_app_with_dio/screen/home/repo/home_repo.dart';

import '../models/response/district_response.dart';

class HomeController extends GetxController {

  //Loading
  var isLoading = false.obs;

  //Variable
  var dropdownvalue = ''.obs;

  //Repo
  HomeRepo homeRepo = HomeRepo();

  //Response
  Rx<DistrictResponse>? districtResponse = DistrictResponse().obs;
  Rx<DistrictResponse>? subDistrictResponse = DistrictResponse().obs;

  @override
  void onInit() {
    super.onInit();
    getAllDistrictList();
  }

  Future<void> getAllDistrictList() async {
    isLoading.value = true;
    var response = await homeRepo.getAllDistrictList();
    isLoading.value = false;
    if (response.status == 200) {
      districtResponse?.value = response;
    } else {
      // CustomAlertPopUp.errorAlert(
      //     context: Get.context!,
      //     message: response.message ?? "Error",
      //     onOkTapFunction: () {});
    }
  }

  Future<void> getSubDistrcit(String district) async {
    isLoading.value = true;
    var response = await homeRepo.getSubDistrcits(district);
    isLoading.value = false;
    if (response.status == 200) {
      subDistrictResponse?.value = response;
    } else {
      // CustomAlertPopUp.errorAlert(
      //     context: Get.context!,
      //     message: response.message ?? "Error",
      //     onOkTapFunction: () {});
    }
  }
}
