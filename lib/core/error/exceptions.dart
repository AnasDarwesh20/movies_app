import 'package:movie/core/network/error_message_model.dart';

class ServerException implements Exception    //هنا نكون كلاس لحالة اذا عاد ال api ب ايرور
{
  final ErrorMessageModel errorMessageModel ;

  const ServerException({
    required this.errorMessageModel ,
  });
}



class LocalDatabaseException implements Exception    //هنا نكون كلاس لحالة اذا عاد ال local database ب ايرور
 {
  final String message ;

  const LocalDatabaseException({
    required this.message ,
  });
}