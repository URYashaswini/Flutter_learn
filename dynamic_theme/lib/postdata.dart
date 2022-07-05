import 'package:http/http.dart' as http;

postData() async {
  var response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      body: {"id": 1.toString(), "name": "yashu", "email": "yashu@gmail.com"});
  print(response.body);
}
