import 'dart:convert';

import 'package:fetchdatafromapi/features/fetch_data/model/usermodel.dart';
import 'package:http/http.dart';

class UserRepository {
  String userUrl = 'https://reqres.in/api/users?page=2';

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)["data"];
      return result.map((e) => UserModel.fromJson(e)).toList();
    }else{
        throw Exception(response.reasonPhrase);
    }
  }
}
