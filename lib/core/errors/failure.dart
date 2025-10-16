import 'package:dio/dio.dart';

abstract class Failures {
  final String message;

  Failures(this.message);
}

class ServerFailure extends Failures {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout');
      case DioExceptionType.badResponse:
        return ServerFailure('Bad Response: ${error.response?.statusCode}');
      case DioExceptionType.cancel:
        return ServerFailure('Request Cancelled');
      case DioExceptionType.unknown:
        if (error.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        } else {
          return ServerFailure('Unexpected Error, Please try again!');
        }
      default:
        return ServerFailure('Unknown Error: ${error.message}');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your request was not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure('There is a problem with server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('There was an error , please try again');
    }
  }
}

// import 'package:dio/dio.dart';

// abstract class Failure {
//   final String error;

//   Failure(this.error);
// }

// class ServerFailure extends Failure {
//   ServerFailure(super.error);
//   factory ServerFailure.fromDioError(DioException dioException) {
//     switch (dioException.type) {
//       case DioExceptionType.connectionTimeout:
//         return ServerFailure("ServerFailure with Api Server");
//       case DioExceptionType.sendTimeout:
//         return ServerFailure("sendTimeout with Api Server");
//       case DioExceptionType.receiveTimeout:
//         return ServerFailure("receiveTimeout with Api Server");
//       case DioExceptionType.badCertificate:
//       // TODO: Handle this case.
//       case DioExceptionType.badResponse:
//         return ServerFailure.fromResponse(
//           dioException.response!.statusCode,
//           dioException.response!.data,
//         );
//       case DioExceptionType.cancel:
//         return ServerFailure(" ServerFailure with Api Server was canceled");
//       case DioExceptionType.connectionError:
//         return ServerFailure(" ServerFailure with Api Server have an error");
//       case DioExceptionType.unknown:
//         if (dioException.message!.contains('SocketException')) {
//           return ServerFailure('No Internet Connection');
//         } else {
//           return ServerFailure('Unexpected Error, Please try again!');
//         }
//       default:
//         return ServerFailure('Opps There was an Error, Please try again');
//     }
//   }
//   factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
//     if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
//       return ServerFailure(response['error']['message']);
//     } else if (statusCode == 404) {
//       return ServerFailure('Your request not found, Please try later!');
//     } else if (statusCode == 500) {
//       return ServerFailure('Internal Server error, Please try later');
//     } else {
//       return ServerFailure('Opps There was an Error, Please try again');
//     }
//   }
// }
