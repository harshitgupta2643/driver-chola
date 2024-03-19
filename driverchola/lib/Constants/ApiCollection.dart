import 'dart:convert';

import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:http/http.dart' as http;

class ApiCollection {
  //Api for create the User  in database
  static createPhoneNumber(String phoneNo, String dialCode) async {
    // print('dhjbcjdkbcdkj');
    // print(dialCode.runtimeType);
    var response = await http.post(
      Uri.parse('https://chola-web-app.azurewebsites.net/api/auth/enter'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'phoneNo': phoneNo.toString(),
        'countryCode': dialCode.toString(),
        'user_Type': 1,
        'auth_Type': 0,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body).runtimeType);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create PhoneNumber.');
    }
  }

  //Api for Verify Phone Number
  static verifyPhoneNumber() async {
    Map<String, dynamic> x = await Constants.fetchResult();
    print('dhjbcjdkbcdkj');
    // print(dialCode.runtimeType);
    var response = await http.put(
      Uri.parse('https://chola-web-app.azurewebsites.net/api/auth/update'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${x['jwt']}',
      },
      body: jsonEncode({
        'phoneNoVerified': true,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body).runtimeType);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to verify PhoneNumber.');
    }
  }

  //Api for update the Email..

  static createEmail(String email) async {
    Map<String, dynamic> x = await Constants.fetchResult();
    print('dhjbcjdkbcdkj');
    // print(dialCode.runtimeType);
    var response = await http.put(
      Uri.parse('https://chola-web-app.azurewebsites.net/api/auth/update'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${x['jwt']}',
      },
      body: jsonEncode({
        'email': email,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body).runtimeType);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to verify PhoneNumber.');
    }
  }

  static verifyEmail() async {
    Map<String, dynamic> x = await Constants.fetchResult();
    print('dhjbcjdkbcdkj');
    // print(dialCode.runtimeType);
    var response = await http.put(
      Uri.parse('https://chola-web-app.azurewebsites.net/api/auth/update'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${x['jwt']}',
      },
      body: jsonEncode({
        'verified': true,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body).runtimeType);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to verify Email.');
    }
  }

  static createDetails(String firstName, String lastName, int gender,
      String dob, int bloodGroup) async {
    Map<String, dynamic> x = await Constants.fetchResult();
    print('dhjbcjdkbcdkj');
    // print(dialCode.runtimeType);
    var response = await http.put(
      Uri.parse('https://chola-web-app.azurewebsites.net/api/auth/update'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${x['jwt']}',
      },
      body: jsonEncode({
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'dob': dob,
        'bloodGroup': bloodGroup,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body).runtimeType);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update Details.');
    }
  }

  static updateCity(String cityName) async {
    Map<String, dynamic> x = await Constants.fetchResult();
    print('dhjbcjdkbcdkj');
    // print(dialCode.runtimeType);
    var response = await http.put(
      Uri.parse('https://chola-web-app.azurewebsites.net/api/auth/update'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${x['jwt']}',
      },
      body: jsonEncode({
        'cityName': cityName,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body).runtimeType);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update City.');
    }
  }

  static updateResidenceAddress(
      String houseNo,
      String apartment,
      String address1,
      String address2,
      String city,
      String state,
      String country,
      String postalCode) async {
    Map<String, dynamic> x = await Constants.fetchResult();
    print('dhjbcjdkbcdkj');
    var response = await http.put(
      Uri.parse('https://chola-web-app.azurewebsites.net/api/user/document'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${x['jwt']}',
      },
      body: jsonEncode({
        'userId': Constants.user_data['user']['id'],
        'houseNumber': houseNo,
        'apartmentSuit': apartment,
        'address1': address1,
        'address2': address2,
        'city': city,
        'state': state,
        'country': country,
        'postalCode': postalCode,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body).runtimeType);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update Residence Address.');
    }
  }

  static updateAadharCard(
      String aadharCardNo, String aadharFront, String aadharBack) async {
    Map<String, dynamic> x = await Constants.fetchResult();
    print('dhjbcjdkbcdkj');
    var response = await http.put(
      Uri.parse('https://chola-web-app.azurewebsites.net/api/user/document'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${x['jwt']}',
      },
      body: jsonEncode({
        'userId': Constants.user_data['user']['id'],
        'aadharCardNo': aadharCardNo,
        'aadharFront': aadharFront,
        'aadharBack': aadharBack,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body).runtimeType);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update Aadhar Card.');
    }
  }

  static updatePanCard(
      String panCardNo, String panFront, String panBack) async {
    Map<String, dynamic> x = await Constants.fetchResult();
    print('dhjbcjdkbcdkj');
    var response = await http.put(
      Uri.parse('https://chola-web-app.azurewebsites.net/api/user/document'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${x['jwt']}',
      },
      body: jsonEncode({
        'userId': Constants.user_data['user']['id'],
        'panCardNo': panCardNo,
        'panFront': panFront,
        'panBack': panBack,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body).runtimeType);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update PAN Card.');
    }
  }

  static updateDrivingLicense(
    String licenceNo,
    String licenseExpiryDate,
    String licenceFront,
    String licenceBack,
  ) async {
    Map<String, dynamic> x = await Constants.fetchResult();
    print('dhjbcjdkbcdkj');
    var response = await http.put(
      Uri.parse('https://chola-web-app.azurewebsites.net/api/user/document'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${x['jwt']}',
      },
      body: jsonEncode({
        'userId': Constants.user_data['user']['id'],
        'licenceNo': licenceNo,
        'licenseExpiryDate': licenseExpiryDate,
        'licenceFront': licenceFront,
        'licenceBack': licenceBack,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body).runtimeType);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update Driving License.');
    }
  }

  static updateBankDetails(
    String accHolderName,
    String accountNumber,
    String ifsc,
    String branchName,
    String bankName,
  ) async {
    Map<String, dynamic> x = await Constants.fetchResult();
    print('dhjbcjdkbcdkj');
    var response = await http.put(
      Uri.parse('https://chola-web-app.azurewebsites.net/api/user/document'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${x['jwt']}',
      },
      body: jsonEncode({
        'userId': Constants.user_data['user']['id'],
        'userName': accHolderName,
        'accountNumber': accountNumber,
        'ifsc': ifsc,
        'branchName': branchName,
        'bankName': bankName,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body).runtimeType);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update Bank Details.');
    }
  }

  static updateLivePhoto(
    String livePhoto,
  ) async {
    Map<String, dynamic> x = await Constants.fetchResult();
    print('dhjbcjdkbcdkj');
    var response = await http.put(
      Uri.parse('https://chola-web-app.azurewebsites.net/api/user/document'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${x['jwt']}',
      },
      body: jsonEncode({
        'userId': Constants.user_data['user']['id'],
        'livePhoto': livePhoto,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body).runtimeType);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update Live Photo.');
    }
  }

  static updateVehicleDetails(
    String vehicleType,
    String vehicleCompany,
    String vehicleModel,
    String vehicleYear,
    String vehicleColor,
    String licensePlateNo,
    String vehiclePicture,
  ) async {
    Map<String, dynamic> x = await Constants.fetchResult();
    print('dhjbcjdkbcdkj');
    var response = await http.put(
      Uri.parse('https://chola-web-app.azurewebsites.net/api/user/document'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${x['jwt']}',
      },
      body: jsonEncode({
        'userId': Constants.user_data['user']['id'],
        "vehicleType": vehicleType,
        "vehicleCompany": vehicleCompany,
        "vehicleModel": vehicleModel,
        "vehicleYear": vehicleYear,
        "vehicleColor": vehicleColor,
        "licensePlateNo": licensePlateNo,
        "vehiclePicture": vehiclePicture,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body).runtimeType);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update Vehicle Details');
    }
  }

  static updateRc(
    String registrationCard,
    String registrationExpiryDate,
    String registrationFront,
    String registrationBack,
  ) async {
    Map<String, dynamic> x = await Constants.fetchResult();
    print('dhjbcjdkbcdkj');
    var response = await http.put(
      Uri.parse('https://chola-web-app.azurewebsites.net/api/user/document'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${x['jwt']}',
      },
      body: jsonEncode({
        "userId": Constants.user_data['user']['id'],
        "registrationCard": registrationCard,
        "registrationExpiryDate": registrationExpiryDate,
        "registrationFront": registrationFront,
        "registrationBack": registrationBack,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body).runtimeType);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update RC Details');
    }
  }

  static updateCarInsurance(
    String carinsuranceNo,
    String expiryDateCarInsurance,
    String carInsuranceFront,
    String carInsuranceBack,
  ) async {
    Map<String, dynamic> x = await Constants.fetchResult();
    print('dhjbcjdkbcdkj');
    var response = await http.put(
      Uri.parse('https://chola-web-app.azurewebsites.net/api/user/document'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${x['jwt']}',
      },
      body: jsonEncode({
        "userId": Constants.user_data['user']['id'],
        "carinsuranceNo": carinsuranceNo,
        "expiryDateCarInsurance": expiryDateCarInsurance,
        "carInsuranceFront": carInsuranceFront,
        "carInsuranceBack": carInsuranceBack,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body).runtimeType);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update car Insurance Details.');
    }
  }

  static Future<String> onUpdateApi() async {
    try {
      Map<String, dynamic> x = await Constants.fetchResult();
      var response = await http.get(
        Uri.parse('https://chola-web-app.azurewebsites.net/api/update'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${x['jwt']}',
          // Add any additional headers if required
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body)['url'];
      } else {
        throw Exception('Failed to fetch URL');
      }
    } catch (e) {
      throw Exception('Failed to fetch URL: $e');
    }
  }
}
