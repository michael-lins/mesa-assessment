#!/usr/bin/env ruby

# Algoritmo 1 - Grafo de dependencia de módulos de um sistema.
# Teste Michael Lins para vaga Dev Rails/Ruby
# Empresa MESA http://mesainc.com.br/

require_relative 'modulos_sistema'
require_relative 'modulo'

sistema_mesa = ModulosSistema.new "Meu teste na MESA"

#criacao dos modulos
modulos = []
8.times do |m|
  modulos << Modulo.new("Módulo #{m}")
end
# dependencias dos modulos
modulos[3].depende_de(modulos[0])
modulos[5]
  .depende_de(modulos[3])
modulos[2].depende_de(modulos[1])
modulos[6]
  .depende_de(modulos[2])
  .depende_de(modulos[4])
  .depende_de(modulos[5])
modulos[7]
  .depende_de(modulos[5])
  .depende_de(modulos[6])

sistema_mesa.inserir modulos

# imprime mapeamento dos modulos com dependencias
modulos_mapeados = sistema_mesa.mapear_todos
modulos_mapeados.each do |pos_mod, modulo|
  puts "Carregando módulo #{modulo}...ok"
end