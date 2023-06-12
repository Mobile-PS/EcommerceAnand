import 'package:http/http.dart' as http;

class ApiUtils {
  http.Request createGetRequest(String url) =>
      http.Request('GET', Uri.parse(url));

  http.Request createGetRequestWithParams(
      String url, Map<String, dynamic> queryParams) {
    var uri = Uri.parse(url);
    uri = uri.replace(queryParameters: queryParams);
    return http.Request('GET', uri);
  }

  http.Request createPostRequest(String url) =>
      http.Request('POST', Uri.parse(url));

  http.Request createPostRequestWithParams(
      String url, Map<String, dynamic> queryParams) {
    var uri = Uri.parse(url);
    uri = uri.replace(queryParameters: queryParams);
    return http.Request('POST', uri);
  }

  http.Request createDeleteRequest(String url) =>
      http.Request('DELETE', Uri.parse(url));

  http.Request createDeleteRequestWithParams(
      String url, Map<String, dynamic> queryParams) {
    var uri = Uri.parse(url);
    uri = uri.replace(queryParameters: queryParams);
    return http.Request('DELETE', uri);
  }

  http.Request createPutRequest(String url) =>
      http.Request('PUT', Uri.parse(url));

  http.Request createPutRequestWithParams(
      String url, Map<String, dynamic> queryParams) {
    var uri = Uri.parse(url);
    uri = uri.replace(queryParameters: queryParams);
    return http.Request('PUT', uri);
  }
}
