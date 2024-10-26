import 'package:test/test.dart';

import '../bin/entities/carta.dart';
import '../bin/entities/jogador.dart';
import '../bin/entities/tabuleiro.dart';

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

  group('Tabuleiro', () {
    test('deve gerar 14 cartas e distribuí-las entre os jogadores', () {
      Jogador jogador1 = Jogador(deck: [], nomeJogador: "Matheus");
      Jogador jogador2 = Jogador(deck: [], nomeJogador: "Luana");
      Tabuleiro tabuleiro =
          Tabuleiro(primeiroJogador: jogador1, segundoJogador: jogador2);

      tabuleiro.gerarCartas();

      expect(jogador1.deck.length, 7);
      expect(jogador2.deck.length, 7);

      List<String> nomesDasCartas = [
        "Dragão de Fogo",
        "Guerreiro das Sombras",
        "Maga do Gelo",
        "Arqueiro da Luz",
        "Titã da Terra",
        "Fada das Florestas",
        "Espectro da Noite",
        "Vampiro do Crepúsculo",
        "Cavaleiro da Justiça",
        "Sereia do Mar",
        "Fênix Renascente",
        "Lobo Lunar",
        "Guardião das Estrelas",
        "Alquimista do Destino",
      ];

      List<String> cartasGeradas = jogador1.deck
          .map((carta) => carta.nome)
          .toList()
        ..addAll(jogador2.deck.map((carta) => carta.nome));
      for (String nome in cartasGeradas) {
        expect(nomesDasCartas, contains(nome));
      }
    });

    test('deve gerar cartas com quantidade de vida e dano dentro dos limites',
        () {
      Jogador jogador1 = Jogador(deck: [], nomeJogador: "Matheus");
      Jogador jogador2 = Jogador(deck: [], nomeJogador: "Luana");
      Tabuleiro tabuleiro =
          Tabuleiro(primeiroJogador: jogador1, segundoJogador: jogador2);

      tabuleiro.gerarCartas();

      for (Carta carta in jogador1.deck) {
        expect(carta.qntVida, inInclusiveRange(0, 100));
        expect(carta.dano, inInclusiveRange(0, 50));
      }
      for (Carta carta in jogador2.deck) {
        expect(carta.qntVida, inInclusiveRange(0, 100));
        expect(carta.dano, inInclusiveRange(0, 50));
      }
    });
  });
}
