import 'dart:io';

import 'entities/jogador.dart';
import 'entities/tabuleiro.dart';

void main(List<String> arguments) {
  print("\x1B[34mBem-vindo ao Guardiões do Destino!\x1B[0m\n");

  print("\x1B[34mDigite o nome do primeiro jogador:\x1B[0m\n");
  String? nomePrimeiroJogador = stdin.readLineSync();
  nomePrimeiroJogador = nomePrimeiroJogador?.isNotEmpty == true
      ? nomePrimeiroJogador
      : "Jogador 1";

  print("\x1B[34mDigite o nome do segundo jogador:\x1B[0m\n");
  String? nomeSegundoJogador = stdin.readLineSync();
  nomeSegundoJogador =
      nomeSegundoJogador?.isNotEmpty == true ? nomeSegundoJogador : "Jogador 2";

  Jogador primeiroJogador = Jogador(
    deck: [],
    nomeJogador: nomePrimeiroJogador!,
  );
  Jogador segundoJogador = Jogador(
    deck: [],
    nomeJogador: nomeSegundoJogador!,
  );

  Tabuleiro tabuleiro = Tabuleiro(
    primeiroJogador: primeiroJogador,
    segundoJogador: segundoJogador,
  );

  tabuleiro.gerarCartas();

  while (primeiroJogador.vida > 0 && segundoJogador.vida > 0) {

    if (primeiroJogador.deck.isEmpty) {
      print("\n\x1B[32mO jogador ${segundoJogador.nomeJogador} venceu, pois o jogador ${primeiroJogador.nomeJogador} ficou sem cartas!\x1B[0m");
      break;
    } else if (segundoJogador.deck.isEmpty) {
      print("\n\x1B[32mO jogador ${primeiroJogador.nomeJogador} venceu, pois o jogador ${segundoJogador.nomeJogador} ficou sem cartas!\x1B[0m");
      break;
    }

    print("\x1B[32m=============== Cartas do ${tabuleiro.primeiroJogador.nomeJogador} ===============\x1B[32m\n\n");
    print(tabuleiro.primeiroJogador.visualizarCartas());

    print("\x1B[32m=============== Cartas do ${tabuleiro.segundoJogador.nomeJogador} ===============\x1B[32m\n\n");
    print(tabuleiro.segundoJogador.visualizarCartas());

    print("\n${primeiroJogador.nomeJogador}, escolha o número da sua carta:");
    int? idCartaPrimeiroJogador = int.tryParse(stdin.readLineSync() ?? "");
    var cartaPrimeiroJogador =
        primeiroJogador.escolherCartaParaBatalhar(idCartaPrimeiroJogador ?? -1);

    print("\n${segundoJogador.nomeJogador}, escolha o número da sua carta:");
    int? idCartaSegundoJogador = int.tryParse(stdin.readLineSync() ?? "");
    var cartaSegundoJogador =
        segundoJogador.escolherCartaParaBatalhar(idCartaSegundoJogador ?? -1);

    if (cartaPrimeiroJogador != null && cartaSegundoJogador != null) {
      tabuleiro.batalhar(cartaPrimeiroJogador, cartaSegundoJogador);
    } else {
      print("\n\x1B[31mEscolha inválida de carta. Certifique-se de escolher um ID de carta válido.\x1B[31m\n");
    }
  }

  if (primeiroJogador.vida <= 0) {
    print(
        "\n\x1B[32mO vencedor é o jogador ${segundoJogador.nomeJogador}! Parabéns!\x1B[0m");
  } else {
    print(
        "\n\x1B[32mO vencedor é o jogador ${primeiroJogador.nomeJogador}! Parabéns!\x1B[0m");
  }
}
