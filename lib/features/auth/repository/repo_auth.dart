import 'package:fetchdatafromapi/base/api_base.dart';

class AuthRepo {
  final String _apikey = "/api/login";
  final ApiBase _apiBase = ApiBase();

  Future<dynamic> login(String? email, String? password) async {
    final response = await _apiBase
        .postLogin(_apikey, {"email": email, "password": password});
    print(response);
    return response;
  }
}
