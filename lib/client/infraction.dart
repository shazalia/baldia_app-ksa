// import 'dart:async';
//
// import 'package:http/http.dart' as http;
// import 'package:xml/xml.dart' as xml;
//
// // Build out SOAP envelope, replace the string/int fields as appropriate.
// var envelope = '''
// <?xml version="1.0" encoding="utf-8"?>
// <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
//   <soap:Body>
//     <AuthenticateCredential xmlns="http://foo.com/barr/320/Default">
//       <UserName>string</UserName>
//       <Password>string</Password>
//       <CurrentSystemLoginID>int</CurrentSystemLoginID>
//       <CurrentCustomerID>int</CurrentCustomerID>
//     </AuthenticateCredential>
//   </soap:Body>
// </soap:Envelope>
// ''';
//
// // Send the POST request, with full SOAP envelope as the request body.
// http.Response response = await http.post (
// 'http://127.0.0.1:1337/service.asmx',
// headers: {
// 'Content-Type': 'text/xml; charset=utf-8',
// 'SOAPAction': 'AuthenticateCredential'
// },
// body: envelope
// );
//
// // The server's response should be the raw XML output.
// var rawXmlResponse = response.body;
//
// // Use the xml package's 'parse' method to parse the response.
// xml.XmlDocument parsedXml = xml.parse (rawXmlResponse);
