import 'package:http/http.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/http_interceptor.dart';

class WebClient {
  WebClient();

  void procurarTransacoes() async {
    final Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);
    final Response response = await client.get(Uri.http("192.168.0.9:8080", "transactions"));
    //print(response.body);
  }
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print(data);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print(data);
    return data;
  }
}
