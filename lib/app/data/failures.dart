abstract class Failure implements Exception{
  final String message;
  Failure(this.message);
}


class NotExistsCurrency extends Failure{
  NotExistsCurrency(super.message);
}

class GetExchangeError extends Failure{
  GetExchangeError(super.message);
}