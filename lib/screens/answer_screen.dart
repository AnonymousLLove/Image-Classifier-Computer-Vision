import 'package:flutter/material.dart';
import 'package:avengers/widgets/hero_card.dart';

class ResultPage extends StatefulWidget {
  final String predictedClass;
  final double probability;

  const ResultPage({
    super.key,
    required this.predictedClass,
    required this.probability,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;
  late List profileDetails;
  late String imagePath;
  late String heroName;
  late String heroInfo;

  final List<Map<String, String>> _profileDetailsTom = [
    {"label": "Full-name:", "value": "Thomas Stanley Holland"},
    {"label": "Partner:", "value": "Zendaya"},
    {
      "label": "Upcoming Movie:",
      "value": "The Odyssey, Spider-Man: Brand New Day"
    },
    {
      "label": "Super Hero:",
      "value": "Spider Man: With great power comes great responsibility"
    },
  ];

  final List<Map<String, String>> _profileDetailsGal = [
    {"label": "Full-name:", "value": "Gal Gadot-Varsano"},
    {"label": "Partner:", "value": "Jaron Varsano"},
    {"label": "Upcoming Movie:", "value": "Fast X: Part 2"},
    {
      "label": "Super Hero:",
      "value": "Wonder Woman: Amazonian Princess from Themyscira"
    },
  ];

  final List<Map<String, String>> _profileDetailsChris = [
    {"label": "Full-name:", "value": "Chris Evans"},
    {"label": "Partner:", "value": "Alpha Baptista"},
    {"label": "Upcoming Movie:", "value": "Materialists"},
    {"label": "Super Hero Motto:", "value": "Captain America: Super Soilder"},
  ];

  final List<Map<String, String>> _profileDetailsHemsworth = [
    {"label": "Full-name:", "value": "Chris Hemsworth"},
    {"label": "Partner:", "value": "Elsa Pataky"},
    {
      "label": "Upcoming Movie:",
      "value": "Avengers: Doomsday, Crime 101, Avengers: Secret Wars"
    },
    {"label": "Super Hero Motto:", "value": "Thor: The funny one , lol"},
  ];

  @override
  void initState() {
    super.initState();

    _setupHeroInfo();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _animations = List.generate(profileDetails.length, (index) {
      final start = index * 0.15;
      final end = start + 0.5;
      return CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeIn),
      );
    });

    _controller.forward();
  }

  void _setupHeroInfo() {
    switch (widget.predictedClass) {
      case 'Tom':
        profileDetails = _profileDetailsTom;
        imagePath = 'assets/10020.jpg';
        heroName = 'Tom Holland';
        heroInfo =
            'Tom Holland is best known for playing Spider-Man in the Marvel Cinematic Universe.';
        break;
      case 'Chris':
        profileDetails = _profileDetailsChris;
        imagePath = 'assets/10005.jpg';
        heroName = 'Chris Evans';
        heroInfo =
            'Chris Evans portrayed Captain America, the leader of the Avengers.';
        break;
      case 'Gal':
        profileDetails = _profileDetailsGal;
        imagePath = 'assets/10031.jpg';
        heroName = 'Gal Gadot';
        heroInfo =
            'Gal Gadot is famous for her role as Wonder Woman in the DC Extended Universe.';
        break;
      case 'Hemsworth':
        profileDetails = _profileDetailsHemsworth;
        imagePath = 'assets/10007.jpg';
        heroName = 'Chris Hemsworth';
        heroInfo =
            'Chris Hemsworth plays Thor, the God of Thunder, in the Marvel Cinematic Universe.';
        break;
      default:
        imagePath = '';
        heroName = 'Unknown Hero';
        heroInfo = 'Sorry, we could not recognize the hero.';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDetailRow(
      String label, String value, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "$label ",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: value,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Hero(
                  tag: 'uploaded-image',
                  child: CustomProfileCard(
                    imagePath: imagePath,
                    name: heroName,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '$heroName — ${widget.probability.toStringAsFixed(1)}% match!',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  heroInfo,
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.black,
                          Color(0xff081b25),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(profileDetails.length, (index) {
                      return _buildDetailRow(
                        profileDetails[index]['label']!,
                        profileDetails[index]['value']!,
                        _animations[index],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
