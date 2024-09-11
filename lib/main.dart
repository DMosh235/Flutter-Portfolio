import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
import 'dart:html' as html;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dan's Portfolio",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF4F5D75),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFFEF8354),
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
          bodyLarge: TextStyle(
            color: Color(0xFF2D3142),
            fontSize: 16,
            fontFamily: 'Arial',
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _resumeKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.5), // Set semi-transparent grey color
        elevation: 0, // Remove the shadow
        title: LayoutBuilder(
          builder: (context, constraints) {
            double fontSize = 28;
            if (constraints.maxWidth < 600) {
              fontSize = 18;
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => _scrollToSection(_homeKey),
                  child: Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 20), // Add spacing between buttons
                TextButton(
                  onPressed: () => _scrollToSection(_aboutKey),
                  child: Text(
                    'About',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 20), // Add spacing between buttons
                TextButton(
                  onPressed: () => _scrollToSection(_resumeKey),
                  child: Text(
                    'Resume',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 20), // Add spacing between buttons
                TextButton(
                  onPressed: () => _scrollToSection(_contactKey),
                  child: Text(
                    'Contact',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          SizedBox(
            key: _homeKey,
            height: MediaQuery.of(context).size.height,
            child: const HomeScreen(),
          ),
          SizedBox(
            key: _aboutKey,
            height: MediaQuery.of(context).size.height * 0.7,
            child: const AboutScreen(),
          ),
          SizedBox(
            key: _resumeKey,
            height: MediaQuery.of(context).size.height * 0.7,
            child: const ResumeScreen(),
          ),
          SizedBox(
            key: _contactKey,
            height: MediaQuery.of(context).size.height / 2,
            child: const ContactScreen(),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          '/Users/danmoshovetis/Desktop/Group_Grey.png', 
          fit: BoxFit.cover,
        ),
        const Center(
          child: Text(
            "Daniel's Portfolio",
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.bold,
              fontFamily: 'Arial',
            ),
          ),
        ),
      ],
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final imageSize = isMobile ? screenWidth * 0.8 : 550.0; // Adjust size for mobile view

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: isMobile
          ? Column(
              children: [
                SizedBox(
                  width: imageSize, // Adjust width
                  height: imageSize, // Adjust height
                  child: Image.asset(
                    '/Users/danmoshovetis/Desktop/Me_Grey.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Who I am...',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  'Motivated and hardworking computer science student at the University of Central Florida with a strong foundation in software development and mathematics. Seeking to leverage my skills, through internships, to contribute to innovative projects and deliver reliable, high-quality work.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: imageSize, // Adjust width
                    height: imageSize, // Adjust height
                    child: Image.asset(
                      '/Users/danmoshovetis/Desktop/Me_Grey.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Who I am...',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Motivated and hardworking computer science student at the University of Central Florida with a strong foundation in software development and mathematics. Seeking to leverage my skills, through internships, to contribute to innovative projects and deliver reliable, high-quality work.',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Define a base text size and scale it based on screen width
    final baseTextSize = screenWidth * 0.02;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), // Adjusted padding for mobile
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'My',
                    style: TextStyle(
                      fontSize: baseTextSize * 1.3, // Scale the text size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Resume',
                    style: TextStyle(
                      fontSize: baseTextSize * 1.3, // Scale the text size
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFEF8354), // Orange color for highlight
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Wrap(
              spacing: 16.0,
              runSpacing: 32.0, // Increased vertical spacing
              children: [
                _buildBox(context, 'Education', 'University of Central Florida\n\nComputer Science B.S. (2021 - Present)'),
                _buildBox(context, 'Student Organizations', 'Knighthacks (2022 - Present)\n\nKnights Powerlifting (2023 - Present)'),
                _buildBox(context, 'Professional Experience', 'Systems Engineering Intern - NASA (KSC)\n\nTeaching Assistant - UCF\n\nAssistant Scholar - Limbitless Solutions'),
                _buildBox(context, 'Personal Projects', 'Nothing But Docs... | Front End Engineer\n\nContact Manager | Back End Engineer\n\nWeather Tracker | Full Stack Developer'),
              ],
            ),
          ),
          const SizedBox(height: 40), // Add more padding between the grid and the button
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                // Resume download logic here
              },
              icon: const Icon(Icons.download),
              label: const Text("Download my Resume!"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBox(BuildContext context, String title, String content) {
    final screenWidth = MediaQuery.of(context).size.width;
    final boxWidth = screenWidth < 600 ? screenWidth * 0.8 : screenWidth * 0.4; // Adjust width for mobile

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: boxWidth,
        maxWidth: boxWidth,
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF4F5D75), // Background color
      padding: const EdgeInsets.symmetric(vertical: 40.0), // Padding 5% of typical screen height
      child: Column(
        children: [
          const Text(
            'Contact Me!',
            style: TextStyle(
              color: Color(0xFFEF8354), // Orange color
              fontSize: 40.0, // 2.5rem equivalent
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40.0), // Padding top 5%
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding on the sides
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: const Text(
                      'Phone: (802) 495-6978',
                      style: TextStyle(
                        fontSize: 24.0, // 1.5rem equivalent
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20.0), // Gap 5%
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: const Text(
                      'Email: da977823@ucf.edu',
                      style: TextStyle(
                        fontSize: 24.0, // 1.5rem equivalent
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40.0), // Padding bottom 5%
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0), // Add padding on the sides
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.group), // Placeholder for LinkedIn icon
                  color: Colors.white,
                  iconSize: 40.0,
                  onPressed: () async {
                    const url = 'https://www.linkedin.com/in/daniel-moshovetis-59050a24a/?trk=opento_sprofile_details';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                const SizedBox(width: 32.0), // Gap 2rem
                IconButton(
                  icon: const Icon(Icons.code), // Placeholder for GitHub icon
                  color: Colors.white,
                  iconSize: 40.0,
                  onPressed: () async {
                    const url = 'https://github.com/DMosh235';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                const SizedBox(width: 32.0), // Gap 2rem
                IconButton(
                  icon: const Icon(Icons.handshake), // Placeholder for Handshake icon
                  color: Colors.white,
                  iconSize: 40.0,
                  onPressed: () async {
                    const url = 'https://app.joinhandshake.com/profiles/31320427';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}