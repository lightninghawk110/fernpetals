class PincodeModel {
  final String message;
  final String status;
  final List<PostOffice> postOffice;
  final String? requestUri;

  PincodeModel({
    required this.message,
    required this.status,
    required this.postOffice,
    this.requestUri,
  });

  factory PincodeModel.fromJson(dynamic json) {
    if (json is List) {
      // Handle the case where json is a list
      if (json.isEmpty) {
        throw Exception('Empty response list');
      }

      final firstItem = json[0];
      if (firstItem is Map<String, dynamic>) {
        return PincodeModel.fromJson(firstItem);
      } else {
        throw Exception('Invalid list item type');
      }
    } else if (json is Map<String, dynamic>) {
      // Handle the case where json is a map
      String status = json["Status"];
      if (status == "Error") {
        return PincodeModel(
          message: json['Message'],
          status: json['Status'],
          postOffice: [],
        );
      } else if (status == "404") {
        return PincodeModel(
          message: json['Message'],
          status: json['Status'],
          postOffice: [],
          requestUri: json['RequestUri'],
        );
      } else {
        var postOfficeJson = json['PostOffice'];
        List<PostOffice> postOffices = [];
        if (postOfficeJson != null) {
          if (postOfficeJson is List) {
            postOffices = List<PostOffice>.from(
                postOfficeJson.map((x) => PostOffice.fromJson(x)));
          } else if (postOfficeJson is Map<String, dynamic>) {
            postOffices.add(PostOffice.fromJson(postOfficeJson));
          }
        }
        return PincodeModel(
          message: json['Message'],
          status: json['Status'],
          postOffice: postOffices,
        );
      }
    } else {
      throw Exception('Invalid JSON type');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'Message': message,
      'Status': status,
      'PostOffice': List<dynamic>.from(postOffice.map((x) => x.toJson())),
      if (requestUri != null) 'RequestUri': requestUri,
    };
  }
}

class PostOffice {
  final String name;
  final String? description;
  final String branchType;
  final String deliveryStatus;
  final String circle;
  final String district;
  final String division;
  final String region;
  final String block;
  final String state;
  final String country;
  final String pincode;

  PostOffice({
    required this.name,
    this.description,
    required this.branchType,
    required this.deliveryStatus,
    required this.circle,
    required this.district,
    required this.division,
    required this.region,
    required this.block,
    required this.state,
    required this.country,
    required this.pincode,
  });

  factory PostOffice.fromJson(Map<String, dynamic> json) {
    return PostOffice(
      name: json['Name'],
      description: json['Description'],
      branchType: json['BranchType'],
      deliveryStatus: json['DeliveryStatus'],
      circle: json['Circle'],
      district: json['District'],
      division: json['Division'],
      region: json['Region'],
      block: json['Block'],
      state: json['State'],
      country: json['Country'],
      pincode: json['Pincode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Description': description,
      'BranchType': branchType,
      'DeliveryStatus': deliveryStatus,
      'Circle': circle,
      'District': district,
      'Division': division,
      'Region': region,
      'Block': block,
      'State': state,
      'Country': country,
      'Pincode': pincode,
    };
  }
}
