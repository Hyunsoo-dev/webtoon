class WebtoonModel {
  final String id, title, thumb;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
  // WebtoonModel({
  //   required this.id,
  //   required this.title,
  //   required this.thumb,
  // });
}
