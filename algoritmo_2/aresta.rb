class Aresta
  attr_accessor :origem, :destino, :peso

  def initialize(origem, destino, peso)
    @origem, @destino, @peso = origem, destino, peso
  end

  def <=>(outra_arestra)
    self.peso <=> outra_arestra.peso
  end

  def to_s
    "#{origem}, #{destino}, #{peso}"
  end
end