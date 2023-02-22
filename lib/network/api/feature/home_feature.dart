import 'package:logger/logger.dart';
import '../../../feature/model/app_response.dart';
import '../dio_manager/dio_manage_class.dart';

class HomeFeature {
  HomeFeature._();

  static final HomeFeature getInstance = HomeFeature._();
  Logger log = Logger();

  Future<AppResponse> getModels(
      {required String url, required Map<String, String> header}) async {
    var res = await DioManagerClass.getInstance.dioGetMethod(
      url: url,
      header: header,
    );
    return AppResponse.fromJson(res.data);
  }
}
