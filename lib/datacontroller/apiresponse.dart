class ApiResponse<T>{
  bool isSuccessful;
  T data;
  String message;
  int responseCode;

  ApiResponse({this.isSuccessful,this.data,this.message,this.responseCode});

}