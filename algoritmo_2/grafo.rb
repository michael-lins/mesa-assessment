# Algoritmo 2 - Caminho de menor custo - Grafos
# Teste Michael Lins para vaga Dev Rails/Ruby
# Empresa MESA http://mesainc.com.br/

class Grafo
  attr_accessor :vertices

  def initialize
    @vertices = []
  end

  def algoritmo_menor_caminho(algoritmo)
    algoritmo.grafo = self
    @algoritmo_menor_caminho = algoritmo
  end

  def menor_caminho_entre(origem, destino)
    @algoritmo_menor_caminho.menor_caminho(origem, destino)
  end

  def custo_caminho(caminho)
    return -1 if caminho.nil? or caminho.empty? or !caminho.is_a? Array
    custo_total = 0
    vertice_passado = caminho.first
    caminho.each do |vertice_atual|
      custo_total += vertice_atual.arestas[vertice_passado] unless vertice_atual.eql? caminho.first
      vertice_passado = vertice_atual
    end
    custo_total
  end

  def adiciona_vertice(vertice)
    vertice.grafo = self
    vertices << vertice
  end
end