import 'package:kenalbandung/const/constants.dart';
import 'package:kenalbandung/services/api_service.dart';
import 'package:kenalbandung/viewmodels/base_model.dart';

class WisataBelanjaViewModel extends BaseModel {
  List data_wisata = [];

  void initdata() async {
    setBusy(true);
    apiService = new ApiService(baseurl: baseurl);
    getDataWisata();
    setBusy(false);
  }

  void getDataWisata() async {
    setBusy(true);
    final data = await apiService!.getWisataBelanja();
    print(data);
    if (data['code'] == 200) {
      data_wisata = data['data'];
    }
    setBusy(false);
  }
}
