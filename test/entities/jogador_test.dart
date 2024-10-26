import 'package:jogo_cartas_unitario/entities/carta.dart';
import 'package:jogo_cartas_unitario/entities/jogador.dart';
import 'package:test/test.dart'; 

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
   test('deve retornar a carta correta ao buscar pelo ID', () {
      List<Carta> deckJogador = [
        Carta(id: 1, qntVida: 50.0, nome: "Dragão de Fogo", dano: 30.0),
        Carta(id: 2, qntVida: 70.0, nome: "Guerreiro das Sombras", dano: 25.0),
        Carta(id: 3, qntVida: 60.0, nome: "Maga do Gelo", dano: 20.0),
      ];

      Jogador jogador = Jogador(deck: deckJogador, nomeJogador: "Matheus");

      Carta? cartaEncontrada = jogador.escolherCartaParaBatalhar(2);

      expect(cartaEncontrada, isNotNull);
      expect(cartaEncontrada!.id, equals(2));
      expect(cartaEncontrada.nome, equals("Guerreiro das Sombras"));
      expect(cartaEncontrada.qntVida, equals(70.0));
      expect(cartaEncontrada.dano, equals(25.0));
    });

    test('deve retornar null ao buscar um ID inexistente', () {
      List<Carta> deckJogador = [
        Carta(id: 1, qntVida: 50.0, nome: "Dragão de Fogo", dano: 30.0),
        Carta(id: 2, qntVida: 70.0, nome: "Guerreiro das Sombras", dano: 25.0),
      ];
      Jogador jogador = Jogador(deck: deckJogador, nomeJogador: "Matheus");

      Carta? cartaEncontrada = jogador.escolherCartaParaBatalhar(3);

      expect(cartaEncontrada, isNull);
    });
  });
}
