class Vertice
  attr_accessor :nome, :grafo

  def initialize(nome)
    @nome = nome
  end

  def vertices_adjacentes
    grafo.vertices.select{|v| v.origem == self}
  end

  def to_s
    nome
  end
end