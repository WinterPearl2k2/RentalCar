class EndPoint {
  const EndPoint._();

  static const restUrlEmpty = '';

  //Auth
  static const restUrlRegister = '/auth/register';
  static const restUrlLogin = '/auth/login';
  static const restUrlRefreshToken = '/auth/refreshToken';
  static const restUrlForgotPassword = '/auth/forgotPassword';
  static const restUrlVerifyCode = '/auth/verifyCode';
  static const restUrlResetPassword = '/auth/resetPassword';
  static const restUrlChangePassword = '/auth/changePassword';
  static const restUrlLogout = '/auth/logout';
  static const restUrlCheckAuthentication = '/auth/checkAuthentication';
  static const restUrlCheckValidResume = '/auth/checkValidResume';
  static const restUrlVerifyInformation = '/auth/verifyInformation';

  //Contract
  static const restUrlGetRentalCars = '/getRentalCar';
  static const restUrlCancelRentalCar = '/cancelRentalCar';
  static const restUrlSignContract = '/signContract';
  static const restUrlGetRentalContract = '/getRentalContract';
  static const restUrlGetLeaseContract = '/getLeaseContract';
  static const restUrlGetNotification = '/getNotification';

  //Profile
  static const restUrlGetUser = '/profile/getUserProfile';
  static const restUrlUpdateUser = '/profile/updateUserProfile';

  //car
  static const restUrlCreateCar = '/createCar';
  static const restUrlUpdateCar = '/updateCar';
  static const restUrlDeleteCar = '/deleteCar';
  static const restUrlGetTopCar = '/getTopCar';
  static const restUrlGetAllCar = '/getAllCar';
  static const restUrlGetCarById = '/getCarById';
  static const restUrlGetAllCarByIdUser = '/getAllCarByIdUser';
  static const restUrlRentalCar = '/rentalCar';
  static const restUrlGetDateTimeCar = '/getDateTimeCar';
  static const restUrlGetSearchCar = '/getSearchCar/?name=';
  static const restUrlCreateCarReview = '/createCarReview';
  static const restUrlGetCarReview = '/getCarReview';
  static const restUrlUploadImage = '/uploadImage';

  //goong io
  static const restUrlGoong =
      'https://rsapi.goong.io';
}
