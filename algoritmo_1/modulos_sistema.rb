# Algoritmo 1 - Grafo de dependencia de módulos de um sistema.
# Teste Michael Lins para vaga Dev Rails/Ruby
# Empresa MESA http://mesainc.com.br/

# Classe de controle de modulos por sistema
class ModulosSistema

  def initialize(nome_sistema=SistemaTeste)
    @modulos = []
    @nome_sistema = nome_sistema
    @modulos_visitados = []
    @mapa_modulos = {}
  end

  def inserir(modulo)
    @modulos << modulo
    @modulos.flatten!
  end

  def mapear_todos_os_modulos
    return "Não há módulos cadastrados para sistema '#{@nome_sistema}'" if @modulos.empty?
    mapear_a_partir_de @modulos.first
  end

  def mapear_a_partir_de(modulo)
    passo = 0
    @modulos.each do |modulo|
      next if @modulos_visitados.include? modulo

      pesquisa_em_profundidade modulo, passo
      passo += 1
    end

    @mapa_modulos
  end

  private

  def pesquisa_em_profundidade(modulo, passo)
    @modulos_visitados << modulo
    @mapa_modulos[passo] = modulo

    return if modulo.modulos_necessarios.nil?

    modulo.modulos_necessarios.each do |dependencia|
      pesquisa_em_profundidade dependencia, passo unless @modulos_visitados.include? dependencia
    end
  end
end