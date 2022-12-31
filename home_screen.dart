import 'package:flutter/material.dart';
import 'package:flutter_application_1/game_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activeplayer = 'x';

  bool gameover = false;
  int turn = 0;
  String result = 'xxxxxxxxxxx';
  Game game = Game();

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SwitchListTile.adaptive(
                title: Text(
                  "It's $activeplayer turn".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.center,
                ),
                value: isSwitched,
                onChanged: (bool newvalue) {
                  setState(() {
                    isSwitched = newvalue;
                  });
                }),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(16),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 1.0,
                crossAxisCount: 3,
                children: List.generate(
                    9,
                    (index) => InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: gameover ? null : () => _onTap(index),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                Player.Playerx.contains(index)
                                    ? "x"
                                    : Player.Playero.contains(index)
                                        ? "o"
                                        : "",
                                style: TextStyle(
                                  color: Player.Playero.contains(index)
                                      ? Colors.blue
                                      : Colors.red,
                                  fontSize: 52,
                                ),
                              ),
                            ),
                          ),
                        )),
              ),
            ),
            Text(
              "result",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  Player.Playerx = [];
                  Player.Playero = [];
                  String activeplayer = 'x';
                  bool gameover = false;
                  int turn = 0;
                  String result = '';
                  Game game = Game();
                  bool isSwitched = false;
                });
              },
              icon: Icon(Icons.replay),
              label: const Text('repeat the game'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).splashColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onTap(int index) async {
    if ((Player.Playerx.isEmpty || !Player.Playerx.contains(index)) &&
        (Player.Playero.isEmpty || !Player.Playero.contains(index))) {
      game.playgame(index, activeplayer);
      updatestate();

      if (!isSwitched && !gameover) {
        await game.autoPlay(activeplayer);
        updatestate();
      }
    }
  }

  void updatestate() {
    setState(() {
      activeplayer = (activeplayer == 'x') ? 'o' : 'x';
      String winnerplayer = game.checkwinner();
      if (winnerplayer == "") {
        result = '$winnerplayer is the winner';
      } else
        result = 'its Draw!';
    });
  }
}
