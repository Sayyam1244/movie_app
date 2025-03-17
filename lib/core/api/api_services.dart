import 'package:http/http.dart' as http;
import 'package:movie_app/core/api/api_exceptions.dart';
import 'package:movie_app/imports.dart';

class ApiServices {
  Future getApi({required String url}) async {
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        try {
          return jsonDecode(response.body)['message'];
        } catch (e) {
          return "Server error please try again later";
        }
      }
    } catch (e) {
      return ExceptionHandler.handleApiException(e);
    }
  }

  // Future postApi({
  //   required String url,
  //   required MapBody body,
  //   MapHeader? header,
  // }) async {
  //   try {
  //     Map infoMap = await deviceInfoMap();
  //     MapHeader hdr =
  //         header ??
  //         {
  //           'Content-Type': 'application/json',
  //           'locale': AppLocale.localeValue.value,
  //           ...infoMap,
  //         };
  //     log("header>>>>>>>>>> $hdr");

  //     final response = await http
  //         .post(Uri.parse(url), body: jsonEncode(body), headers: hdr)
  //         .timeout(const Duration(seconds: 20));

  //     if (response.statusCode == 200 || response.statusCode == 429) {
  //       try {
  //         return jsonDecode(response.body);
  //       } catch (e) {
  //         return response.reasonPhrase;
  //       }
  //     }
  //     if (response.statusCode == 404) {
  //       try {
  //         return jsonDecode(response.body);
  //       } catch (e) {
  //         return response.reasonPhrase;
  //       }
  //     } else {
  //       return response.reasonPhrase;
  //     }
  //   } catch (e) {
  //     log("POST ERROR $e");
  //     return ExceptionHandler.handleApiException(e);
  //   }
  // }

  // Future patchApi({
  //   required String url,
  //   required MapBody body,
  //   MapHeader? header,
  // }) async {
  //   Map infoMap = await deviceInfoMap();
  //   MapHeader hdr =
  //       header ??
  //       {
  //         'Content-Type': 'application/json',
  //         'locale': AppLocale.localeValue.value,
  //         if (AppUser().userModel.authToken != null)
  //           'Authorization': 'bearer ${AppUser().userModel.authToken}',
  //         ...infoMap,
  //       };
  //   log("header>>>>>>>>>> $hdr");

  //   try {
  //     final String b = jsonEncode(body);
  //     var response = await http
  //         .patch(Uri.parse(url), body: b, headers: hdr)
  //         .timeout(const Duration(seconds: 20));
  //     if (response.statusCode == 401) {
  //       return await AuthRepo.getUser().then((v) {
  //         if (v['Success']) {
  //           AppUser().userModel = UserModel.fromJson(v["response"]);
  //           return patchApi(url: url, body: body);
  //         } else {
  //           return {
  //             "Success": false,
  //             "message":
  //                 "User session has been expired. please relaunch the app",
  //           };
  //         }
  //       });
  //     }
  //     if (response.statusCode == 200) {
  //       return jsonDecode(response.body);
  //     } else if (response.statusCode == 500) {
  //       return jsonDecode(response.body)['message'];
  //     } else {
  //       return response.reasonPhrase;
  //     }
  //   } catch (e) {
  //     return ExceptionHandler.handleApiException(e);
  //   }
  // }
}
