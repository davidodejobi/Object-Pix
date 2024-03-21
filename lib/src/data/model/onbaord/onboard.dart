class Onboard {
  final String title;
  final String description;
  final String image;

  Onboard({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<Onboard> onboard = [
  Onboard(
    image: '1',
    title: 'Photo but Made Easy',
    description:
        'Do you need to take photos but you don\'t want to spend extra time cropping them?',
  ),
  Onboard(
    image: '2',
    title: 'Effortless Image Capture',
    description: 'Need an app that takes images for you with ease',
  ),
  Onboard(
    image: '3',
    title: 'Efficient AI Image Capture',
    description:
        'Object does that for you efficiently in a minimalistic way using AI',
  ),
];
