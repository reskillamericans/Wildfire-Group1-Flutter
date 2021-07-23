class Failure{
  final String? message;
  Failure({this.message});

  @override
  String toString() {
    return this.message!;
  }
}