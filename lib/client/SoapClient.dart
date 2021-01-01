import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

class SoapClient {
  static const endpoint = 'http://momratkt.com/MomraMobileWS/MomraMobileWS.asmx';

  Future<XmlDocument> post(XmlElement request) async {
    final response = await http.post(endpoint,
        headers: {'Content-Type': 'text/xml'},
        body: _soapEnvelope(request).toString());
    return parse(response.body);
  }

  XmlNode _soapEnvelope(Object body) {
    final uri = "http://schemas.xmlsoap.org/soap/envelope/";
    final xml = XmlBuilder();
    xml.element("Envelope", namespace: uri, nest: () {
      xml.namespace(uri, 'soapenv');
      xml.element("Header", namespace: uri);
      xml.element("Body", namespace: uri, nest: body);
    });
    return xml.build();
  }
}