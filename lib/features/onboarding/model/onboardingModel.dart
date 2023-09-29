class OnBoardingModel {
  final String text;
  final String image;

  OnBoardingModel({required this.text, required this.image});
}

List<OnBoardingModel> splashData = [
  OnBoardingModel(
      text: "Welcome to Bookstore, Let’s shop!",
      image: "assets/images/splash_1.png"),
  OnBoardingModel(
      text: "We help people connect with stores \naround The World",
      image: "assets/images/splash_2.png"),
  OnBoardingModel(
      text: "We show the easy way to shop. \nJust stay at home with us",
      image: "assets/images/splash_3.png"),
];
