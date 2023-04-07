import 'package:cubos_moedas/app/data/exchange.dart';
import 'package:cubos_moedas/app/data/exchanges_request.dart';
import 'package:cubos_moedas/app/data/failures.dart';
import 'package:dio/dio.dart';
import 'currency.dart';

class ExchangeRepository {
  final _dio = Dio(
    BaseOptions(baseUrl: 'https://economia.awesomeapi.com.br/json'),
  );
  Future<List<Exchange>> get(ExchangesRequest request) async {
    try {
      final params = request.targets
          .map((t) => '${t.abbr}-${request.base.abbr}')
          .join(','); //To preenchendo essa lista = ['USD-BRL']

      final response =
          await _dio.get('/last/$params'); //Pego o objeto json da requisição

      return (response.data.values as Iterable)
          //Estou formatando a saída dos dados
          //O request é utilizado apenas para auxiliar na captação dos dados
          //para uma Lista de Exchange
          .map(
            (data) => Exchange(
              base: Currency.parse(data['codein']),
              target: Currency.parse(data['code']),
              bid: double.parse(data['bid']),
            ),
          )
          .toList();
    } on DioError catch (error) {
      //Estamos tratando a questão dos erros aqui, utilizando try catch
      if (error.response?.statusCode == 404) {
        throw GetExchangeError(
            'Não é possível pegar essa cotação, verifique as moedas');
      }
      rethrow;
    }
  }

  Future<List<Exchange>> getHistory(Exchange exchange, {int page = 1}) async {
    final countItems = 7 * page;

    final params = '${exchange.target.abbr}-${exchange.base.abbr}';

    final response = await _dio.get('/daily/$params/$countItems');
    try {
      return (response.data as Iterable).skip((page - 1) * 7).map(
        (data) {
          final timestamp = int.parse(data['timestamp']);

          return Exchange(
            base: exchange.base,
            target: exchange.target,
            bid: double.parse(data['bid']),
            date: DateTime.fromMillisecondsSinceEpoch(timestamp * 1000),
          );
        },
      ).toList();
    } on DioError catch (error) {
      //Estamos tratando a questão dos erros aqui, utilizando try catch
      if (error.response?.statusCode == 404) {
        throw GetExchangeError(
            'Não é possível pegar essa cotação, verifique as moedas');
      }
      rethrow;
    }
  }
}
