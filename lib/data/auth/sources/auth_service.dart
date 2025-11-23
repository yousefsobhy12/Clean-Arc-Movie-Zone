import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuthException, FirebaseAuth;
import 'package:movie_zone/core/constants/api_url.dart';
import 'package:movie_zone/core/errors/firebase_errors.dart';
import 'package:movie_zone/core/network/dio_client.dart';
import 'package:movie_zone/data/auth/models/signin_req_params.dart';
import 'package:movie_zone/data/auth/models/signup_req_params.dart';
import 'package:movie_zone/data/auth/models/user_model.dart';
import 'package:movie_zone/service_locator.dart';

abstract class AuthService {
  Future<Either<String, Map<String, dynamic>>> signup(SignupReqParams params);
  Future<Either<String, Map<String, dynamic>>> signin(SigninReqParams params);
  Future<Either<FirebaseError, UserModel>> firebaseSignup({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<FirebaseError, UserModel>> firebaseSignin(
    String email,
    String password,
  );
}

class AuthApiServiceImpl extends AuthService {
  @override
  Future<Either<String, Map<String, dynamic>>> signup(
    SignupReqParams params,
  ) async {
    try {
      var response = await serviceLocator<DioClient>().post(
        ApiUrl.signupUrl,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      final message =
          e.response?.data?['message']?.toString() ?? 'Unknown error';
      return Left(message);
    } catch (e) {
      return Left('Unexpected error: $e');
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> signin(
    SigninReqParams params,
  ) async {
    try {
      var response = await serviceLocator<DioClient>().post(
        ApiUrl.signinUrl,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      final message =
          e.response?.data?['message']?.toString() ?? 'Unknown error';
      return Left(message);
    }
  }

  @override
  Future<Either<FirebaseError, UserModel>> firebaseSignup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = getUserColl();
      final userModel = UserModel(
        id: credential.user!.uid,
        name: name,
        email: email,
        password: password,
      );
      await user.doc(credential.user!.uid).set(userModel);
      return right(userModel);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return left(FirebaseError.fromFirebase(error));
      } else {
        return left(FirebaseError(errorMessage: "Error in register: $error"));
      }
    }
  }

  @override
  Future<Either<FirebaseError, UserModel>> firebaseSignin(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = getUserColl();
      final doc = await user.doc(credential.user!.uid).get();
      final userModel = doc.data()!;
      return right(userModel);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return left(FirebaseError.fromFirebase(error));
      } else {
      }
        return left(FirebaseError(errorMessage: "Error in login: $error"));
    }
  }

  CollectionReference<UserModel> getUserColl() => FirebaseFirestore.instance
      .collection("user")
      .withConverter<UserModel>(
        fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
        toFirestore: (usermodel, _) => usermodel.toJson(),
      );
}
