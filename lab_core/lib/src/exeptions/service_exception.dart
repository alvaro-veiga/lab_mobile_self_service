class ServiceExcception implements Exception {
  final String message;

  ServiceExcception({this.message = 'Service error'});
}