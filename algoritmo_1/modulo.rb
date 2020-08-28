# Teste Michael Lins para vaga Dev Rails/Ruby
# Empresa MESA http://mesainc.com.br/

require "set"

class Modulo
  attr_accessor :nome, :modulos_necessarios

  def initialize(nome)
    @modulos_necessarios = Set.new
    @nome = nome
  end

  def depende_de(modulo)
    @modulos_necessarios << modulo
    self
  end

  def to_s
    tos = "#{@nome}"
    unless @modulos_necessarios.empty?
      tos += " que depende de ("
      dependencias = @modulos_necessarios.to_a
      dependencias.each do |dependencia|
        tos += dependencia.to_s
        tos += ", " unless dependencias.last.eql? dependencia
      end
      tos += ")"
    end
    tos
  end

end