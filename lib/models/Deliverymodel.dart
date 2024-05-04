// ignore_for_file: public_member_api_docs, sort_constructors_first
class Delivery {
  static List<String> l1 = [
    "04:00 pm - 09:00 pm",
    "05:00 pm - 11:00 pm",
  ];
  static List<String> l2 = [
    "06:00 pm - 07:00 pm",
    "07:00 pm - 08:00 pm",
    "08:00 pm - 09:00 pm",
    "09:00 pm - 10:00 pm",
  ];
  static List<String> l3 = [
    "11:00 pm - 11:59 pm",
  ];
  static List<String> l4 = [
    "06:00 pm - 09:00 pm",
    "07:00 pm - 11:00 pm",
  ];

  String name;
  double value;
  String date;
  List<String> timelist;
  Delivery({
    required this.date,
    required this.name,
    required this.value,
    required this.timelist,
  });
}
