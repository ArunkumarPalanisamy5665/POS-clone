import 'dart:math';


import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/network/api_helper.dart';
import '../models/failure_model.dart';
import '../models/login_user_model.dart';


class UserRepository {
  final ApiHelper apiHelper;

  UserRepository(this.apiHelper);

  // Future<Either<FailureModel, LoginUserModel>> loginUserApi(String endpoints, Map<String, dynamic> paramData,) async {
  //   try {
  //     final response = await apiHelper.post(endpoints, data: paramData);
  //
  //     return response.fold((failure) {
  //         return Left(failure);
  //         },
  //       (data) {
  //         try {
  //           if (data != null) {
  //             final verifiedUser = LoginUserModel.fromJson(data);
  //
  //             if (verifiedUser.success == true) {
  //               return Right(verifiedUser);
  //             } else {
  //               return Left(
  //                 FailureModel.fromApiResponse(
  //                   data,
  //                 ),
  //               );
  //             }
  //           }
  //           return Left(
  //             FailureResponse(message: 'Invalid response', success: false),
  //           );
  //         } catch (e) {
  //           return Left(FailureResponse(message: e.toString(), success: false));
  //         }
  //       },
  //     );
  //   } catch (e) {
  //     return Left(FailureResponse(message: e.toString(), success: false));
  //   }
  // }



  // Future<Either<FailureResponse, SendOtpModel>> sendOtpApi(String endpoints, Map<String, dynamic> paramData,) async {
  //   try {
  //     final response = await apiHelper.post(endpoints, data: paramData);
  //
  //     return response.fold(
  //       (failure) {
  //         return Left(failure);
  //       },
  //       (data) {
  //         try {
  //           if (data != null) {
  //             final otpResponse = SendOtpModel.fromJson(data);
  //             if (otpResponse.success == true) {
  //               return Right(otpResponse);
  //             } else {
  //               return Left(
  //                 FailureResponse.fromApiResponse(
  //                   data,
  //                   fallbackMessage:
  //                       otpResponse.message ?? 'Failed to send OTP',
  //                 ),
  //               );
  //             }
  //           }
  //           return Left(
  //             FailureResponse(message: 'Invalid response', success: false),
  //           );
  //         } catch (e) {
  //           return Left(FailureResponse(message: e.toString(), success: false));
  //         }
  //       },
  //     );
  //   } catch (e) {
  //     return Left(FailureResponse(message: e.toString(), success: false));
  //   }
  // }
  //
  // Future<Either<FailureResponse, ProfileDetailsModel>> getProfileDetailsApi(String endpoints) async {
  //   try {
  //
  //     final response = await apiHelper.get(endpoints);
  //
  //     return response.fold(
  //           (failure) {
  //
  //         return Left(failure);
  //       },
  //           (data) {
  //         try {
  //           if (data != null) {
  //             final otpResponse = ProfileDetailsModel.fromJson(data);
  //
  //             if (otpResponse.success == true) {
  //               return Right(otpResponse);
  //             } else {
  //               return Left(FailureResponse.fromApiResponse(data, fallbackMessage: otpResponse.message ?? 'Failed to send OTP'));
  //             }
  //           }
  //           return Left(FailureResponse(message: 'Invalid response', success: false));
  //         } catch (e) {
  //           return Left(FailureResponse(
  //             message: e.toString(),
  //             success: false,
  //           ));
  //         }
  //       },
  //     );
  //   } catch (e) {
  //     return Left(FailureResponse(
  //       message: e.toString(),
  //       success: false,
  //     ));
  //   }
  // }
  //
  // Future<Either<FailureResponse, CreateUserModel>> createUserApi(String endpoints, Map<String, dynamic> paramData,) async {
  //   try {
  //   final response = await apiHelper.put(endpoints, data: paramData);
  //
  //   return response.fold((failure) => Left(failure), (data) {
  //     try {
  //     if (data != null) {
  //       final verifiedUser = CreateUserModel.fromJson(data);
  //       if (verifiedUser.success == true) {
  //         return Right(verifiedUser);
  //       } else {
  //         return Left(
  //           FailureResponse.fromApiResponse(
  //             data,
  //             fallbackMessage: verifiedUser.message ?? 'User creation failed',
  //           ),
  //         );
  //       }
  //     }
  //     return Left(FailureResponse(message: 'Invalid response', success: false));
  //     } catch (e) {
  //       return Left(FailureResponse(
  //         message: e.toString(),
  //         success: false,
  //       ));
  //     }
  //   });
  //   } catch (e) {
  //     return Left(FailureResponse(
  //       message: e.toString(),
  //       success: false,
  //     ));
  //   }
  // }
  //
  // Future<Either<FailureResponse, UploadProfileModel>> uploadProfilePictureApi(String endpoint, FormData formData,) async {
  //   try {
  //     final response = await apiHelper.put(
  //       endpoint,
  //       data: formData,
  //       isMultipart: true,
  //     );
  //
  //     return response.fold(
  //       (failure) {
  //         return Left(failure);
  //       },
  //       (data) {
  //         try {
  //           if (data != null) {
  //             final verifiedUser = UploadProfileModel.fromJson(data);
  //             if (verifiedUser.success == true) {
  //               return Right(verifiedUser);
  //             } else {
  //               return Left(
  //                 FailureResponse.fromApiResponse(
  //                   data,
  //                   fallbackMessage: verifiedUser.message ?? 'Failed to Upload Profile',
  //                 ),
  //               );
  //             }
  //           }
  //           return Left(FailureResponse(message: 'Invalid response', success: false));
  //         } catch (e) {
  //           return Left(FailureResponse(
  //             message: e.toString(),
  //             success: false,
  //           ));
  //         }
  //       },
  //     );
  //   } catch (e) {
  //     return Left(FailureResponse(message: e.toString(), success: false));
  //   }
  // }
  //
  // Future<Either<FailureResponse, MainUserBookingModule>> mainBookingDetailsApi(String endpoints,) async {
  //   try {
  //     final response = await apiHelper.get(endpoints);
  //
  //     return response.fold(
  //       (failure) {
  //         return Left(failure);
  //       },
  //       (data) {
  //         try {
  //           if (data != null) {
  //             final otpResponse = MainUserBookingModule.fromJson(data);
  //
  //             if (otpResponse.success == true) {
  //               return Right(otpResponse);
  //             } else {
  //               return Left(
  //                 FailureResponse.fromApiResponse(
  //                   data,
  //                   fallbackMessage:
  //                       otpResponse.message ?? 'Failed to send OTP',
  //                 ),
  //               );
  //             }
  //           }
  //           return Left(
  //             FailureResponse(message: 'Invalid response', success: false),
  //           );
  //         } catch (e) {
  //           return Left(FailureResponse(message: e.toString(), success: false));
  //         }
  //       },
  //     );
  //   } catch (e) {
  //     return Left(FailureResponse(message: e.toString(), success: false));
  //   }
  // }
  //
  // Future<Either<FailureResponse, ReRequestCreateBookingModel>> reRequestCreateBookingApi(String endpoints, Map<String, dynamic> dataParams) async {
  //   try {
  //
  //     final response = await apiHelper.patch(endpoints, data: dataParams );
  //
  //     return response.fold(
  //           (failure) {
  //
  //         return Left(failure);
  //       },
  //           (data) {
  //         try {
  //           if (data != null) {
  //             final otpResponse = ReRequestCreateBookingModel.fromJson(data);
  //
  //             if (otpResponse.success == true) {
  //               return Right(otpResponse);
  //             } else {
  //               return Left(FailureResponse.fromApiResponse(data, fallbackMessage: otpResponse.message ?? 'Failed to send OTP'));
  //             }
  //           }
  //           return Left(FailureResponse(message: 'Invalid response', success: false));
  //         } catch (e) {
  //           return Left(FailureResponse(
  //             message: e.toString(),
  //             success: false,
  //           ));
  //         }
  //       },
  //     );
  //   } catch (e) {
  //     return Left(FailureResponse(
  //       message: e.toString(),
  //       success: false,
  //     ));
  //   }
  // }




}
