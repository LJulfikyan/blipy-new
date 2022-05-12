

class LangStrings{
  Map<String, dynamic>? data;

  LangStrings(this.data);


  factory LangStrings.fromJson(Map<String, dynamic> json) {
    return LangStrings(json);
  }

}