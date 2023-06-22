// ignore_for_file: public_member_api_docs, sort_constructors_first
class OnBorading {
  String image, title, description;
  OnBorading({
    required this.description,
    required this.image,
    required this.title,
  });
}

List<OnBorading> onBoradingInfoList = [
  OnBorading(
    description:
        "Seize control of your schedule and accomplish more with our feature-rich TO DO app. Your goals, our priority.",
    image: "assets/animated/todo1.json",
    title: "Control  your schedule",
  ),
  OnBorading(
    description:
        "Unleash the potential of your day with our elegant TO DO app, your gateway to effective time management",
    image: "assets/animated/todo2.json",
    title: "Time management",
  ),
  OnBorading(
    description:
        "Experience the beauty of simplicity. Our TO DO app streamlines your tasks and brings harmony to your busy life.",
    image: "assets/animated/todo3.json",
    title: "Task management",
  ),
  OnBorading(
    description:
        "Organize your life, one task at a time. Experience the magic of our TO DO app and witness your dreams unfold, our priority.",
    image: "assets/animated/todo1.json",
    title: "Control  your schedule 3",
  ),
];
