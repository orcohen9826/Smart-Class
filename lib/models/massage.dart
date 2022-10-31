class Massage {
  String text;
  String senderName;

  Massage(this.text, this.senderName);

  Massage.fromMap(Map<String, dynamic> map) {
    this.text = map["text"];
    this.senderName = map["sender"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> info = {"text": text, "sender": senderName};
    return info;
  }
}
