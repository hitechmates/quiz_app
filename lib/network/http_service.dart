// import 'dart:convert';

// import 'package:get/get_connect/http/src/response/response.dart';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

enum MyHttpMethod {
  get,
  post,
  delete,
  put,
}

class HttpService {
  static const String _baseUrl = "run.mocky.io";
  // static const Headers = {HttpHeaders.authorizationHeader: 'Bearer '};

  Future<dynamic> callAPI(
      MyHttpMethod httpMethod, String apiName, dynamic body) async {
    var uri = Uri.https(_baseUrl, apiName);
    var res;

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
      return _returnResponse(res);
    } else {
      throw "Error in calling service";
    }
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      // case 400:
      //   throw BadRequestException(response.body.toString());
      // case 401:
      // case 403:
      //   throw UnauthorisedException(response.body.toString());
      // case 500:
      default:
        print('ERROR: ${response.statusCode}');
      // throw FetchDataException(
      //     'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
