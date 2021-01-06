module Home
  class Aba
    def initialize
      @btn_aba = 'Open navigation drawer'
      @btn_area = '//android.widget.ListView/android.widget.RelativeLayout[5]'
    end

    def acessar_area
      find(@btn_aba).click
      xpath(@btn_area).click
    end
  end

  class Area
    def initialize
      @btn0 = '//android.widget.LinearLayout[4]/android.widget.Button[1]'
      @btn1 = '//android.widget.LinearLayout[3]/android.widget.Button[1]'
      @btn2 = '//android.widget.LinearLayout[3]/android.widget.Button[2]'
      @btn3 = '//android.widget.LinearLayout[3]/android.widget.Button[3]'
      @btn4 = '//android.widget.LinearLayout[2]/android.widget.Button[1]'
      @btn5 = '//android.widget.LinearLayout[2]/android.widget.Button[2]'
      @btn6 = '//android.widget.LinearLayout[2]/android.widget.Button[3]'
      @btn7 = '//android.widget.LinearLayout[1]/android.widget.Button[1]'
      @btn8 = '//android.widget.LinearLayout[1]/android.widget.Button[2]'
      @btn9 = '//android.widget.LinearLayout[1]/android.widget.Button[3]'
      @btn_atual = '(//android.widget.ImageView[@content-desc="Drop down"])[1]'
      @btn_desejado = '(//android.widget.ImageView[@content-desc="Drop down"])[2]'
      @btn_limpar = '//android.widget.LinearLayout[4]/android.widget.Button[3]'
      @txt_resultado = '//android.widget.RelativeLayout[3]/android.widget.TextView[1]'
      @valor_inicial = nil
      @atual = nil
      @desejado = nil
    end

    def pressionar_botao(numero)
      @valor_inicial = numero
      if numero < 9
        xpath(instance_variable_get("@btn#{numero}")).click
      else
        numeros = numero.to_s.split('').map(&:to_i)
        numeros.each do |item|
          xpath(instance_variable_get("@btn#{item}")).click
        end
      end
    end

    def limpar_valores
      xpath(@btn_limpar).click
    end

    def selecionar_conversao(atual, desejado)
      @atual = atual
      @desejado = desejado
      xpath(@btn_atual).click
      filtrar(atual)
      xpath(@btn_desejado).click
      filtrar(desejado)
    end

    def filtrar(unidade)
      case unidade
      when 'quilometros quadrados'
        scroll_to_exact('Square kilometer').click
      when 'metros quadrados'
        scroll_to_exact('Square meter').click
      when 'centimetros quadrados'
        scroll_to_exact('Square centimeter').click
      end
    end

    def validar_conversao
      valor_convertido = xpath(@txt_resultado).text.gsub(/\s+/, '').to_f
      case @atual
      when 'quilometros quadrados'
        resultado = @desejado.eql?('metros quadrados') ? @valor_inicial * 1_000_000.to_f : @valor_inicial * 10_000_000_000.to_f
      when 'metros quadrados'
        resultado = @desejado.eql?('quilometros quadrados') ? @valor_inicial / 1_000_000.to_f : @valor_inicial * 10_000.to_f
      when 'centimetros quadrados'
        resultado = @desejado.eql?('quilometros quadrados') ? @valor_inicial / 10_000_000_000.to_f : @valor_inicial / 10_000.to_f
      end
      resultado.eql?(valor_convertido)
    end
  end
end
