import 'dart:math';

class Player {
  static const x = 'x';
  static const o = 'o';
  static const empty = "";

  static List<int> Playerx = [];
  static List<int> Playero = [];
}

extension containsAll on List {
  bool containsall(int x, int y, [z]) {
    if (z == (null))
      return contains(x) && contains(y);
    else
      return contains(x) && contains(y) && contains(z);
  }
}

class Game {
  void playgame(int index, String activeplayer) {
    if (activeplayer == 'x')
      Player.Playerx.add(index);
    else
      Player.Playero.add(index);
  }

  checkwinner() {
    String winner = "";

    if (Player.Playerx.containsall(0, 1, 2) ||
        Player.Playerx.containsall(3, 4, 5) ||
        Player.Playerx.containsall(1, 4, 7) ||
        Player.Playerx.containsall(2, 5, 8) ||
        Player.Playerx.containsall(1, 4, 8) ||
        Player.Playerx.containsall(2, 4, 1)) winner = 'x';

    if (Player.Playero.containsall(0, 1, 2) ||
        Player.Playero.containsall(3, 4, 5) ||
        Player.Playero.containsall(1, 4, 7) ||
        Player.Playero.containsall(2, 5, 8) ||
        Player.Playero.containsall(1, 4, 8) ||
        Player.Playero.containsall(2, 4, 1)) winner = 'o';
    return winner = "";
  }

  Future<void> autoPlay(activeplayer) async {
    int index = 0;
    List<int> emptycells = [];

    for (var i = 0; i < 9; i++) {
      if (!(Player.Playerx.contains(i) || Player.Playero.contains(i)))
        emptycells.add(i);
    }
    Random random = Random();
    int randomIndex = random.nextInt(emptycells.length);

    index = emptycells[randomIndex];
    playgame(index, activeplayer);
  }
}
