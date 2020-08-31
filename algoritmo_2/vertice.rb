# Algoritmo 2 - Caminho de menor custo - Grafos
# Teste Michael Lins para vaga Dev Rails/Ruby
# Empresa MESA http://mesainc.com.br/

class Vertice
  DESTINO = 0
  CUSTO_CAMINHO = 1

  attr_accessor :nome, :grafo, :arestas

  def initialize(nome)
    @nome = nome
    @arestas = {}
  end

  def adiciona_aresta(destino, custo_caminho)
    @arestas[destino] = custo_caminho
    self
  end

  def to_s
    nome
  end
end