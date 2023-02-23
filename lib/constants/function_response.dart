class FunctionResponse {
  bool success;
  dynamic data;
  String message;
  int count;

  FunctionResponse({
    this.success = false,
    this.data,
    this.message = 'Could not process your request.',
    this.count = 0,
  });
}
