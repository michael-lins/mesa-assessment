class Grafo
  attr_accessor :vertices, :arestas

  def initialize
    @arestas  = []
    @vertices = []
  end

  def adiciona_vertice(vertice)
    vertices << vertice
    vertice.grafo = self
  end

  def adiciona_aresta(origem, destino, peso)
    arestas << Aresta.new(origem, destino, peso)
  end

end