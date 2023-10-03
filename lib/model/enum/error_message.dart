class ErrorCodeMessage {
  static getErrorCodeMessage({required int? errorCode}) {
    switch (errorCode) {
      case 401:
        return 'Authentication failed. ';
      case 409:
        return 'User code already in use. ';
      case 412:
        return 'An unexpected error has occurred. ';
      case 422:
        return 'An unexpected error has occurred. ';
      default:
        return 'An unexpected error has occurred. ';
    }
  }
}
