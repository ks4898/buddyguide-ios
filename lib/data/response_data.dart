class ResponseData {
  static final List<Map<String, String>> _responseList = [];

  List<Map<String, String>> get responseList {
    return _responseList;
  }

  void addResponse(String location, String option) {
    _responseList.add({
      "loc": location,
      "opt": option,
    });
  }
}
