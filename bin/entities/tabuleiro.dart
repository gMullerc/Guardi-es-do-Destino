import 'dart:math';

import 'carta.dart';
import 'jogador.dart';

class Tabuleiro {
  Tabuleiro({
    required this.primeiroJogador,
    required this.segundoJogador,
  });

  final Jogador primeiroJogador;
  final Jogador segundoJogador;

  void gerarCartas() {
    List<Carta> todasAsCartas = _gerarCartasAleatorias(14);
    int metade = todasAsCartas.length ~/ 2;

    primeiroJogador.deck.addAll(todasAsCartas.sublist(0, metade));
    segundoJogador.deck.addAll(todasAsCartas.sublist(metade));
  }

  void batalhar(
    Carta cartaPrimeiroJogador,
    Carta cartaSegundoJogador,
  ) {
    print("=============================================================================================\n\n");
    print("O jogador ${primeiroJogador.nomeJogador}, possui ${primeiroJogador.vida} pontos de vida.\n");
    print("O jogador ${segundoJogador.nomeJogador}, possui ${segundoJogador.vida} pontos de vida.\n");
    print("=============================================================================================\n\n");
    print("${cartaPrimeiroJogador.nome} (Dano: ${cartaPrimeiroJogador.dano}) VS ${cartaSegundoJogador.nome} (Dano: ${cartaSegundoJogador.dano})\n");
     print("=============================================================================================\n\n");

    if (cartaPrimeiroJogador.dano > cartaSegundoJogador.dano) {
      double danoRestante = cartaPrimeiroJogador.dano - cartaSegundoJogador.dano;
      cartaSegundoJogador.qntVida -= danoRestante;
      if (cartaSegundoJogador.qntVida < 0) {
        segundoJogador.vida -= cartaSegundoJogador.qntVida.abs();
        segundoJogador.deck.removeWhere((carta) => carta.id == cartaSegundoJogador.id);
      } 
      print("=============================================================================================\n\n");
      print("${cartaPrimeiroJogador.nome} venceu! ${cartaSegundoJogador.nome} agora tem ${cartaSegundoJogador.qntVida.toStringAsFixed(1)} de vida.\n");
      print("O jogador ${segundoJogador.nomeJogador}, possui ${segundoJogador.vida} pontos de vida.\n");
      print("=============================================================================================\n\n");
    }else if (cartaSegundoJogador.dano > cartaPrimeiroJogador.dano) {
      double danoRestante = cartaSegundoJogador.dano - cartaPrimeiroJogador.dano;
      cartaPrimeiroJogador.qntVida -= danoRestante;
      if (cartaPrimeiroJogador.qntVida < 0) {
        primeiroJogador.vida -= cartaPrimeiroJogador.qntVida.abs();
        primeiroJogador.deck.removeWhere((carta) => carta.id == cartaPrimeiroJogador.id);
      } 
      print("=============================================================================================\n\n");
      print("${cartaSegundoJogador.nome} venceu! ${cartaPrimeiroJogador.nome} agora tem ${cartaPrimeiroJogador.qntVida.toStringAsFixed(1)} de vida.\n");
      print("O jogador ${primeiroJogador.nomeJogador}, possui ${primeiroJogador.vida} pontos de vida.\n"); 
      print("=============================================================================================\n\n");
    } else {
      double mediaDeDanoEntreOsJogadores = (cartaSegundoJogador.dano + cartaPrimeiroJogador.dano) / 2;
      double mediaDeDanoTratada = mediaDeDanoEntreOsJogadores < 0 ? 0 : mediaDeDanoEntreOsJogadores;

      cartaSegundoJogador.qntVida -= mediaDeDanoTratada;
      cartaPrimeiroJogador.qntVida -= mediaDeDanoTratada;

     if (cartaSegundoJogador.qntVida < 0) {
        segundoJogador.vida -= cartaSegundoJogador.qntVida.abs();
        segundoJogador.deck.removeWhere((carta) => carta.id == cartaSegundoJogador.id);
      } 
      
     if (cartaPrimeiroJogador.qntVida < 0) {
        primeiroJogador.vida -= cartaPrimeiroJogador.qntVida.abs();
        primeiroJogador.deck.removeWhere((carta) => carta.id == cartaPrimeiroJogador.id);
      } 
      print("=============================================================================================\n\n");
      print("Empate! Ambos os danos são iguais.\n");
      print("${cartaPrimeiroJogador.nome}, agora tem ${cartaPrimeiroJogador.qntVida.toStringAsFixed(1)} de vida.\n");
      print("O jogador ${primeiroJogador.nomeJogador}, possui ${primeiroJogador.vida} pontos de vida.\n");

      print("${cartaSegundoJogador.nome}, agora tem ${cartaSegundoJogador.qntVida.toStringAsFixed(1)} de vida.\n");
      print("O jogador ${segundoJogador.nomeJogador}, possui ${segundoJogador.vida} pontos de vida.\n");
      print("=============================================================================================\n\n");
    }
  }

  List<Carta> _gerarCartasAleatorias(int quantidade) {
    List<Carta> cartasGeradas = [];

    Random random = Random();

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

    nomesDasCartas.shuffle(random);

    for (int i = 0; i < quantidade; i++) {
      cartasGeradas.add(Carta(
        id: i + 1,
        qntVida: random.nextDouble() * 100,
        nome: nomesDasCartas[i],
        dano: random.nextDouble() * 50,
      ));
    }

    return cartasGeradas;
  }
}
