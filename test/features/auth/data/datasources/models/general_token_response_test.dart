import 'dart:convert';

import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/json_reader.dart';
import '../../../../../helpers/paths.dart';

void main() {
  const generalTokenResponse = GeneralTokenResponse(
    diagnostic: Diagnostic(status: "200", message: "Success"),
    data: DataGeneralToken(
      token:
          "lazycatlabs.eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJhdXRoX2FwcCIsImlhdCI6MTY5OTExMDMxOSwiZXhwIjoxNjk5NzE1MTE5fQ.SlybkWOQs9JJpTG-tRYJapalESGNE63atPEfw6ry7NdcoZFkjYDAdlYfnIBlp9eUISAjSc7IUtvKGks0jEJ27V_iUBdKcS0aTVvtd8g1yW14UBGW6jKsOn9QtgxWnPELP0GZ1TRzObZW3bYAXpiVsC9o0LnONmq5ehMUgHVYknF_wTfHwSB2pb77pAZguwK4I9MI4BoqcvcuET36MEgYs9vY-e0f2y50nHN4kbjVe9iFay0GeNIRQsWzzmyN5Xd9Zv5HiSCgbB80UA6SrneoExBi-fNIlxrOxJRaVt16-1ElXu04W5Y_FIoY-jekmMWusE54csh3Woo6ChQQJEopfuU6prdP50TN7UpqiH_o3R77MdgcYBdJ-puZOt-XsplOHNAjDtp2rpo9UExQUlOVxQFuvSKkanxaOSsAXYuOaEh9iBoq0LQ_JiaIbrZBn7EVxKhFnUJokv7SvPMg2LG7p7wczgxYjnuxG0fDRRjK2vAQyAj0rIigd6xpA6g-ii5VWRsk_sMJw-QJW_ivZdQZwjlXeH-EcVeTaZ9yn2zmmavF6sxDxC1SDGGkbKjUpfIdQYa-t82sPO0HUd_OBQ8ZiBGmSV1gi-8lAat1XtJTgsgM0zTxqK5kwekc3gsoZfVdlhJ8SyN6ohyOMU8Hv8M2H7lG8u1DTq1jj7rb1BEtwGw",
      tokenType: "Bearer",
    ),
  );

  test('from json, should return a valid model from json', () {
    /// arrange
    final jsonMap = json.decode(jsonReader(pathGeneralTokenResponse200));

    /// act
    final result =
        GeneralTokenResponse.fromJson(jsonMap as Map<String, dynamic>);

    /// assert
    expect(result, equals(generalTokenResponse));
  });

  test('to json, should return a json map containing proper data', () {
    /// act
    final result = generalTokenResponse.toJson();

    /// arrange
    final exceptedJson = {
      "diagnostic": {
        "status": "200",
        "message": "Success",
      },
      "data": {
        "token":
            "lazycatlabs.eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJhdXRoX2FwcCIsImlhdCI6MTY5OTExMDMxOSwiZXhwIjoxNjk5NzE1MTE5fQ.SlybkWOQs9JJpTG-tRYJapalESGNE63atPEfw6ry7NdcoZFkjYDAdlYfnIBlp9eUISAjSc7IUtvKGks0jEJ27V_iUBdKcS0aTVvtd8g1yW14UBGW6jKsOn9QtgxWnPELP0GZ1TRzObZW3bYAXpiVsC9o0LnONmq5ehMUgHVYknF_wTfHwSB2pb77pAZguwK4I9MI4BoqcvcuET36MEgYs9vY-e0f2y50nHN4kbjVe9iFay0GeNIRQsWzzmyN5Xd9Zv5HiSCgbB80UA6SrneoExBi-fNIlxrOxJRaVt16-1ElXu04W5Y_FIoY-jekmMWusE54csh3Woo6ChQQJEopfuU6prdP50TN7UpqiH_o3R77MdgcYBdJ-puZOt-XsplOHNAjDtp2rpo9UExQUlOVxQFuvSKkanxaOSsAXYuOaEh9iBoq0LQ_JiaIbrZBn7EVxKhFnUJokv7SvPMg2LG7p7wczgxYjnuxG0fDRRjK2vAQyAj0rIigd6xpA6g-ii5VWRsk_sMJw-QJW_ivZdQZwjlXeH-EcVeTaZ9yn2zmmavF6sxDxC1SDGGkbKjUpfIdQYa-t82sPO0HUd_OBQ8ZiBGmSV1gi-8lAat1XtJTgsgM0zTxqK5kwekc3gsoZfVdlhJ8SyN6ohyOMU8Hv8M2H7lG8u1DTq1jj7rb1BEtwGw",
        "tokenType": "Bearer",
      },
    };

    /// assert
    expect(result, equals(exceptedJson));
  });
}
