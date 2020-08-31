# Algoritmo 2 - Caminho de menor custo/distancia - Grafos
# Teste Michael Lins para vaga Dev Rails/Ruby
# Empresa MESA http://mesainc.com.br/

# Implementacao do algoritmo Dijkstra para localizar um vertice percorrendo
# o menor caminho possivel a partir de determinada origem
class Dijkstra
  attr_accessor :grafo

  def initialize
    @caminho_para = {} # registra vertice a percorrer para chegar noutro vertice
    @distancia_caminho = {}
    @caminhos_percorridos = {}
  end

  def menor_caminho(origem, destino_final)
    computa_menor_caminho_origem_todos_vertices(origem)
    caminho = []
    vertice_atual = destino_final
    while vertice_atual != origem
      caminho.prepend vertice_atual # insere vertice atual no inicio do caminho
      vertice_atual = @caminho_para[vertice_atual]
    end
    caminho.prepend origem
  end

  private

  # Identifica menor caminho da origem à todos os outros vértices
  def computa_menor_caminho_origem_todos_vertices(origem)
    atualiza_distancia_arestas_para Float::INFINITY
    @distancia_caminho[origem] = 0

    registra_caminho origem, 0

    while algum_caminho_percorrido?
      vertice = recupera_menor_caminho_atual
      vertice.arestas.each do |aresta_adjacente|
        confirma_menor_caminho(vertice, aresta_adjacente)
      end
    end
  end

  def atualiza_distancia_arestas_para(distancia)
    @grafo.vertices.each do |vertice|
      @distancia_caminho[vertice] = distancia
    end
  end

  def recupera_menor_caminho_atual
    @caminhos_percorridos.shift.first
  end

  def algum_caminho_percorrido?
    @caminhos_percorridos.any?
  end

  def registra_caminho(caminho, distancia)
    @caminhos_percorridos[caminho] = distancia
    # Ordena caminhos percorridos por distancia
    @caminhos_percorridos.sort_by{|caminho, distancia| distancia}
  end

  def confirma_menor_caminho(origem, aresta)
    destino = aresta[Vertice::DESTINO]
    custo = aresta[Vertice::CUSTO_CAMINHO]

    return if @distancia_caminho[destino] <= (@distancia_caminho[origem] + custo)

    @distancia_caminho[destino] = @distancia_caminho[origem] + custo
    @caminho_para[destino] = origem

    # caso o caminho ja esteja resgistrado, será aplicado esse custo menor,
    # por causa do uso de hash no @caminhos_percorridos que substitui valor
    # para key existente
    registra_caminho destino, @distancia_caminho[destino]
  end
end