// ignore_for_file: public_member_api_docs, sort_constructors_first
class OnBoardModel {
  final String title;
  final String desription;
  final String imageName;
  OnBoardModel({
    required this.title,
    required this.desription,
    required this.imageName,
  });

  String get imageWithPath => 'asset/images/$imageName.png';
}

class OnBoardModes {
  static final List<OnBoardModel> onBoardItems = [
    OnBoardModel(
        title: 'Order Your Food',
        desription: 'Now you can order food any time right from your mobile.',
        imageName: 'ic_chef'),
    OnBoardModel(
        title: 'Order Your Food',
        desription: 'Now you can order food any time right from your mobile.',
        imageName: 'ic_delivery'),
    OnBoardModel(
        title: 'Order Your Food',
        desription: 'Now you can order food any time right from your mobile.',
        imageName: 'ic_order'),
  ];
}
