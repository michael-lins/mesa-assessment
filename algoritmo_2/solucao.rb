#!/usr/bin/env ruby

# Algoritmo 2 - Caminho de menor custo - Grafos
# Teste Michael Lins para vaga Dev Rails/Ruby
# Empresa MESA http://mesainc.com.br/

require_relative 'grafo'
require_relative 'vertice'
require_relative 'dijkstra'

grafo = Grafo.new
grafo.algoritmo_menor_caminho(Dijkstra.new)

vertices = []

8.times do |v|
  vertices << Vertice.new("#{v}")
  grafo.adiciona_vertice(vertices[v])
end

vertices[0]
  .adiciona_aresta(vertices[1], 2)
  .adiciona_aresta(vertices[4], 3)

vertices[1]
  .adiciona_aresta(vertices[0], 2)
  .adiciona_aresta(vertices[3], 8)
  .adiciona_aresta(vertices[5], 9)
  .adiciona_aresta(vertices[6], 6)

vertices[2]
  .adiciona_aresta(vertices[5], 3)
  .adiciona_aresta(vertices[6], 7)

vertices[3]
  .adiciona_aresta(vertices[1], 8)
  .adiciona_aresta(vertices[7], 6)

vertices[4]
  .adiciona_aresta(vertices[0], 3)
  .adiciona_aresta(vertices[6], 5)
  .adiciona_aresta(vertices[7], 9)

vertices[5]
  .adiciona_aresta(vertices[1], 9)
  .adiciona_aresta(vertices[2], 3)
  .adiciona_aresta(vertices[6], 4)
  .adiciona_aresta(vertices[7], 5)

vertices[6]
  .adiciona_aresta(vertices[1], 6)
  .adiciona_aresta(vertices[2], 7)
  .adiciona_aresta(vertices[4], 5)
  .adiciona_aresta(vertices[5], 4)

vertices[7]
  .adiciona_aresta(vertices[3], 6)
  .adiciona_aresta(vertices[4], 9)
  .adiciona_aresta(vertices[5], 5)

# Imprime menor caminho de 0 para todos os outros
origem = 0
(1..7).each do |destino|
  menor_caminho = grafo.menor_caminho_entre(vertices[origem], vertices[destino])
  custo_caminho = grafo.custo_caminho(menor_caminho)
  puts "Path from #{origem} to #{destino}: Vertex, Cost, Path -> #{menor_caminho.count}, #{custo_caminho}, #{menor_caminho.map(&:to_s).join("-")}"
end