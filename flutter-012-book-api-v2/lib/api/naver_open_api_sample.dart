import 'dart:convert';
import 'package:book/models/naver_book_dto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore_for_file: constant_identifier_names

/// 네이버 개발자 센터에 애플리 케이션을 등록하고
/// Client_ID 와 Client_Secret 를 확인하고
/// 아래 항목에 설정한 후
/// api/naver_open_api_sample.dart
/// api/naver_open_api.dart 로 이름 변경하여 사용하기
///
const CLIENT_ID = "YOUR NAVER CLIENT ID";
const CLIENT_SECRET = "YOUR NAVER CLIENT SECRET";
const NAVER_BOOK_URL = "https://openapi.naver.com/v1/search/book.json";

class NaverOpenAPI {
  /// Future : JS 의 promise 와 같은 역할
  /// 누군가 loadBooks() 함수를 호출하면
  /// 반드시 데이터를 return  해 준다는 약속
  Future<List<NaverBookDto>> loadBooks([search]) async {
    Map<String, String> headers = {
      "X-Naver-Client-Id": CLIENT_ID,
      "X-Naver-Client-Secret": CLIENT_SECRET
    };

    // 검색어가 잇으면 그걸로 검색하고 아니면 자바로 검색해라
    String query = search ??= "자바";

    // ?변수1=값1 & 변수2=값2 & 변수3=값3
    String queryString = Uri(
      queryParameters: {
        "query": query,
        "display": "20",
        "start": "1",
      },
    ).query;

    dynamic response;

    try {
      response = await http.get(
        Uri.parse("$NAVER_BOOK_URL?$queryString"),
        headers: headers,
      );
    } catch (e) {
      debugPrint("http 요청오류");
    }

    if (response?.statusCode == 200) {
      // debugPrint("응답받은 데이터 :  ${response.body.toString()}");
      Iterable resultItems = await json.decode(response.body)["items"];
      var bookList = resultItems.map((dto) {
        var result = NaverBookDto.fromJson(dto);
        return result;
      });
      debugPrint(bookList.toString());
      return bookList.toList();
    } else {
      debugPrint("응답 오류 발생 : ${response.body.toString()}");
      throw Exception("API 연결 문제 발생");
    }
  }
}
