import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placar Digital',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 143, 221, 255)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Placar Digital - Marcos Calera'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int _scoreA = 0;
  int _scoreB = 0;

  void _incrementScoreA() {
    setState(() {
      _scoreA++;
    });
  }

  void _incrementScoreB() {
    setState(() {
      _scoreB++;
    });
  }

  void _resetScore() {
    setState(() {
      _scoreA = 0;
      _scoreB = 0;
    });
  }

  void _goToResultPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(scoreA: _scoreA, scoreB: _scoreB),
      ),
    );
  }

  // pagina 1 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          
          <Widget> [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('Time A', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text(
                      '$_scoreA',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    ElevatedButton(
                      onPressed: _incrementScoreA,
                      child: const Text('+1 Ponto'),
                    ),
                  ],
                ),

                Column(
                  children: [
                    const Text('Time B', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text(
                      '$_scoreB',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    ElevatedButton(
                      onPressed: _incrementScoreB,
                      child: const Text('+1 Ponto'),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 50),
            
            ElevatedButton.icon(
              onPressed: _resetScore,
              icon: const Icon(Icons.refresh),
              label: const Text('Zerar Placar'),
            ),

            const SizedBox(height: 20),
            
            FilledButton(
              onPressed: _goToResultPage,
              child: const Text('Resultado'),

            ),
          ],
        ),
      ),
    );
  }
}

// pgina 2 para mostrar resultado
class ResultPage extends StatelessWidget {

  final int scoreA;
  final int scoreB;

  const ResultPage({super.key, required this.scoreA, required this.scoreB});

  String _getResultText() {
    if (scoreA == scoreB) {
      return 'Empate';
    } else if (scoreA > scoreB) {
      return 'Time A Venceu';
    } else {
      return 'Time B Venceu';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _getResultText(),
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),
            Text(
              'Placar: $scoreA x $scoreB',
              style: const TextStyle(fontSize: 24),
            ),

            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}