import 'carta.dart';

class Jogador {
  Jogador({
    required this.deck,
    required this.nomeJogador,
  }) {
    vida = 100;
  }

  final List<Carta> deck;
  final String nomeJogador;
  late double vida;

  String visualizarCartas() {
    String cartas = "";

    for (Carta carta in deck) {
      cartas +=
          "ID: ${carta.id} | Nome da carta: ${carta.nome} | Quantidade de Vida: ${carta.qntVida.toStringAsFixed(1)} | Dano: ${carta.dano.toStringAsFixed(1)}\n\n";
    }

    return cartas;
  }

Carta? escolherCartaParaBatalhar(int id) {
    try {
      return deck.singleWhere((carta) => carta.id == id);
    } catch (e) {
      return null;
    }
  }
}
