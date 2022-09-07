import 'package:http/http.dart';
import 'dart:convert';
const apiKey= '8EB48211-3394-45E4-8B5C-6E754AAA7171';

class NetworkHelper{
  NetworkHelper({ this.curency1, this.curency2});
  final curency1;
  final curency2;

    Future<double> getRate() async{
      var link= 'https://rest.coinapi.io/v1/exchangerate/$curency1/$curency2?apikey=$apiKey';

      Response response= await get(Uri.parse(link));
      if (response.statusCode== 200){
        var decodeData= jsonDecode(response.body);
        return decodeData['rate'];
      }else{
        print('ERROR 404');
      }


  }
}
