// import 'dart:convert';

// import 'package:get/get_connect/http/src/response/response.dart';
import 'dart:convert';

import 'package:http/http.dart';

enum MyHttpMethod {
  get,
  post,
  delete,
  put,
}

class HttpService {
  static const String _baseUrl = "api.mocki.io";

  Future<String> callAPI(
      MyHttpMethod httpMethod, String apiName, dynamic body) async {
    var uri = Uri.https(_baseUrl, apiName);

    Response res;

    switch (httpMethod) {
      case MyHttpMethod.get:
        {
          res = await get(uri);
        }
        break;

      case MyHttpMethod.post:
        {
          res = await post(uri,
              body: json.encode(body),
              encoding: Encoding.getByName("application/json"));
        }
        break;

      case MyHttpMethod.delete:
        {
          res = await delete(uri);
        }
        break;

      case MyHttpMethod.put:
        {
          res = await put(uri,
              body: json.encode(body),
              encoding: Encoding.getByName("application/json"));
        }
        break;
    }

    if (res.statusCode == 200) {
      return res.body;
    } else {
      throw "Error in calling service";
    }
  }
}
