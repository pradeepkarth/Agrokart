/// Base class for all failures in the application.
/// 
/// Extend this class to represent specific failure types.
abstract class Failure {
  /// Creates a [Failure] with an error [message].
  Failure(this.message);

  /// The error message associated with this failure.
  final String message;
}

/// Represents an authentication failure.
/// 
/// Used when an error occurs during authentication.
class AuthFailure extends Failure {
  /// Creates an [AuthFailure] with an error [message].
  AuthFailure(super.message);
}
