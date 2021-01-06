Dado('selecionar {string} e {string}') do |string, string2|
  area.selecionar_conversao(string, string2)
end

Quando('digitar o {int}') do |int|
  area.limpar_valores
  area.pressionar_botao(int)
end

Então('Deve ser exibido o valor convertido') do
  aggregate_failures do
    expect(area.validar_conversao).to be_truthy
  end
end
