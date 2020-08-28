# Implementacao do algoritmo Dijkstra para localizar um vertice percorrendo
# o menor caminho possivel a partir de determinada origem
class Dijkstra
  def initialize(grafo, origem)
    @grafo, @origem = grafo, origem
    @caminho = {}
    @custo = {}
   
  end
end