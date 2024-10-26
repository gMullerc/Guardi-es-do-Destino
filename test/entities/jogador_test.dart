import 'package:test/test.dart';

import '../../bin/entities/carta.dart';
import '../../bin/entities/jogador.dart';

void main() {
  group('Jogador', () {
    test('deve retornar as informações das cartas corretamente', () {
      List<Carta> deckJogador = [
        Carta(id: 1, dano: 12.5, nome: "Matador de COLOSOS", qntVida: 123),
        Carta(id: 2, dano: 1.5, nome: "Kassadin", qntVida: 999),
        Carta(id: 3, dano: 41.5, nome: "Fiz", qntVida: 12),
      ];
      Jogador jogador = Jogador(deck: deckJogador, nomeJogador: "Matheus");

      String resultado = jogador.visualizarCartas();

      expect(
          resultado,
          contains(
            "Nome da carta: Matador de COLOSOS | Quantidade de Vida: 123.0 | Dano: 12.5",
          ));
      expect(
          resultado,
          contains(
            "Nome da carta: Kassadin | Quantidade de Vida: 999.0 | Dano: 1.5",
          ));
      expect(
          resultado,
          contains(
            "Nome da carta: Fiz | Quantidade de Vida: 12.0 | Dano: 41.5",
          ));
    });
  });
}
