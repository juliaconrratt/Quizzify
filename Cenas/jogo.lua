local composer = require( 'composer' )

local cena = composer.newScene(  )

function cena:create( event )
    local  grupoJogo = self.view
    
    -- DECLARAÇÃO DOS GRUPOS

    local grupoFundo = display.newGroup()
    local grupoBeatles = display.newGroup()
    local grupoNirvana = display.newGroup()
    local grupoPitty = display.newGroup()
    local grupoHendrix = display.newGroup()
    local grupoMadonna = display.newGroup()
    local grupoPinkFloyd = display.newGroup()
    local grupoTribalistas = display.newGroup()
    local grupoLegiao = display.newGroup()
    local grupoGUI = display.newGroup()
    local grupoVitoria = display.newGroup()
    local grupoDerrota = display.newGroup()

    grupoNirvana.alpha = 0
    grupoPitty.alpha = 0
    grupoHendrix.alpha = 0
    grupoMadonna.alpha = 0
    grupoPinkFloyd.alpha = 0
    grupoTribalistas.alpha = 0
    grupoLegiao.alpha = 0
    grupoVitoria.alpha = 0
    grupoDerrota.alpha = 0

    grupoJogo:insert( grupoFundo )
    grupoJogo:insert( grupoBeatles )
    grupoJogo:insert( grupoNirvana )
    grupoJogo:insert( grupoPitty )
    grupoJogo:insert( grupoHendrix )
    grupoJogo:insert( grupoMadonna )
    grupoJogo:insert( grupoPinkFloyd )
    grupoJogo:insert( grupoLegiao )
    grupoJogo:insert( grupoGUI )
    grupoJogo:insert( grupoVitoria )
    grupoJogo:insert( grupoDerrota )

    -- DECLARAÇÃO DAS PERGUNTAS

    local perguntas = {
        beatles = {
            capaBT = 'Recursos/images/covers/beatlesAbbeyRoad.jpg',
            respostasBT = {'1964', '1969', '1970'}, 
        },
        madonna= {
            capaMDNA = 'Recursos/images/covers/madonna.jpg',
            respostasMDNA = {'Like a Virgin', 'True Blue', 'Like a Prayer'},
        },
        legiao= {
            capaLU = 'Recursos/images/covers/legiaoUrbana.jpg',
            respostasLU = {'Meninos e Meninas', 'Tempo Perdido', 'Faroeste Caboclo'},
        },
        nirvana = {
            capaNV = 'Recursos/images/covers/nirvanaNevermind.jpg',
            respostasNV = {'Axl Rose', 'Dave Grohl', 'Kurt Cobain'},
        },
        pinkFloyd= {
            capaPF = 'Recursos/images/covers/pinkFloyd.jpg',
            respostasPF = {'The Who', 'Led Zeppelin', 'Pink Floyd'},
        }
    }

    --DECLARAÇÃO DOS ÁUDIOS

    local audioErro = audio.loadSound( 'Recursos/Audio/sound effects/Insert Tape - Sound Effect.m4a' )
    local audioAcerto = audio.loadSound( 'Recursos/Audio/sound effects/Insert Tape - Sound Effect.m4a' )
    
    -- DECLARAÇÃO DAS FONTES

    local fonteTitulo = 'Recursos/fonts/metropolis/Metropolis-SemiBold.otf'
    
    -- DECLARAÇÃO DAS VARIÁVEIS

    local x = display.contentWidth
    local y = display.contentHeight
    local t = x + y


    -- DECLARAÇÃO FUNDO

    local fundo = display.newImageRect( grupoFundo, 'Recursos/images/background/bg4.jpg', x*2, y*2)
    fundo.x = x*0.5
    fundo.y = y*0.5
   
    local nomeJogo = display.newText( grupoGUI, 'quizzify', x*0.5, y*0.95, fonteTitulo, t*0.035 )
    nomeJogo:setFillColor(0.141, 0.73, 0.42)

    -- DECLARAÇÃO VIDA

    local vida = 3

    local vidaIcone = display.newImageRect( grupoJogo, 'Recursos/images/Icons/coracao-verde.png', t*0.03, t*0.03 ) 
	vidaIcone.x = x*0.38
	vidaIcone.y = y*0.075
	vidaIcone.alpha = 0

	local vidaIcone2 = display.newImageRect( grupoJogo, 'Recursos/images/Icons/coracao-verde.png', t*0.03, t*0.03 ) 
	vidaIcone2.x = x*0.5
	vidaIcone2.y = y*0.075
	vidaIcone2.alpha = 0

	local vidaIcone3 = display.newImageRect( grupoJogo, 'Recursos/images/Icons/coracao-verde.png', t*0.03, t*0.03 ) 
	vidaIcone3.x = x*0.63
	vidaIcone3.y = y*0.075
	vidaIcone3.alpha = 0

    -- DECLARAÇÃO TEMPO

    local tempo = 20
    local tempoTexto = display.newText( grupoGUI, tempo, x*0.1, y*0.075, fonteTitulo, t*0.03 )
    local iconeTempo =display.newImageRect( grupoGUI, 'Recursos/images/Icons/clock.png', t*0.024, t*0.024 )
    iconeTempo.x = x*0.215
	iconeTempo.y = y*0.074

    -- DECLARAÇÃO PONTOS

    local pontos = 0
    local pontosTexto = display.newText( grupoGUI, pontos, x*0.9, y*0.075, fonteTitulo, t*0.03 )
    local iconePontos =display.newImageRect( grupoGUI, 'Recursos/images/Icons/like(1).png', t*0.025, t*0.025 )
    iconePontos.x = x*0.8
	iconePontos.y = y*0.071

    -- DECLARAÇÃO GRUPO BEATLES 

    local capaBeatles = display.newImageRect( grupoBeatles, 'Recursos/images/covers/beatlesAbbeyRoad.jpg', x*0.65, y*0.3, t*0.2, t*0.2 )
    capaBeatles.x = x*0.5
    capaBeatles.y = y*0.28

    local p1Texto = display.newText( grupoBeatles, 'Qual o ano de lançamento?', x*0.5, y*0.57, fonteTitulo, t*0.02 )

    local r1Beatles = display.newRoundedRect( grupoBeatles, x*0.5, y*0.65, x*0.85, y*0.06, 100 )
    local r1Texto = display.newText( grupoBeatles, perguntas.beatles.respostasBT[1], x*0.5, y*0.65, fonteTitulo, t*0.025 )
    r1Texto:setFillColor(0, 0, 0)

    local r2Beatles = display.newRoundedRect( grupoBeatles, x*0.5, y*0.75, x*0.85, y*0.06, 100 )
    local r2Texto = display.newText( grupoBeatles, perguntas.beatles.respostasBT[2], x*0.5, y*0.75, fonteTitulo, t*0.025 )
    r2Texto:setFillColor(0, 0, 0)

    local r3Beatles = display.newRoundedRect( grupoBeatles, x*0.5, y*0.85, x*0.85, y*0.06, 100 )
    local r3Texto = display.newText( grupoBeatles, perguntas.beatles.respostasBT[3], x*0.5, y*0.85, fonteTitulo, t*0.025 )
    r3Texto:setFillColor(0, 0, 0)

    grupoBeatles.alpha = 1
    
    -- DECLARAÇÃO GRUPO MADONNA

    local capaMadonna = display.newImageRect( grupoMadonna, 'Recursos/images/covers/madonna.jpg', x*0.65, y*0.3, t*0.2, t*0.2 )
    capaMadonna.x = x*0.5
    capaMadonna.y = y*0.28

    local p2Texto = display.newText( grupoMadonna, 'Qual o nome do álbum?', x*0.5, y*0.57, fonteTitulo, t*0.02 )

    local r1Madonna = display.newRoundedRect( grupoMadonna, x*0.5, y*0.65, x*0.85, y*0.06, 100 )
    local r1MadonnaTexto = display.newText( grupoMadonna, perguntas.madonna.respostasMDNA[1], x*0.5, y*0.65, fonteTitulo, t*0.025 )
    r1MadonnaTexto:setFillColor(0, 0, 0)

    local r2Madonna = display.newRoundedRect( grupoMadonna, x*0.5, y*0.75, x*0.85, y*0.06, 100 )
    local r2MadonnaTexto = display.newText( grupoMadonna, perguntas.madonna.respostasMDNA[2], x*0.5, y*0.75, fonteTitulo, t*0.025 )
    r2MadonnaTexto:setFillColor(0, 0, 0)

    local r3Madonna = display.newRoundedRect( grupoMadonna, x*0.5, y*0.85, x*0.85, y*0.06, 100 )
    local r3MadonnaTexto = display.newText( grupoMadonna, perguntas.madonna.respostasMDNA[3], x*0.5, y*0.85, fonteTitulo, t*0.025 )
    r3MadonnaTexto:setFillColor(0, 0, 0)

    grupoMadonna.alpha = 0

    -- DECLARAÇÃO GRUPO LEGIÃO URBANA

    local capaLegiao = display.newImageRect( grupoLegiao, 'Recursos/images/covers/legiaoUrbana.jpg', x*0.65, y*0.3, t*0.2, t*0.2 )
    capaLegiao.x = x*0.5
    capaLegiao.y = y*0.28

    local p3Texto = display.newText( grupoLegiao, 'Qual faixa pertence ao álbum?', x*0.5, y*0.57, fonteTitulo, t*0.02 )

    local r1Legiao = display.newRoundedRect( grupoLegiao, x*0.5, y*0.65, x*0.85, y*0.06, 100 )
    local r1LegiaoTexto = display.newText( grupoLegiao, perguntas.legiao.respostasLU[1], x*0.5, y*0.65, fonteTitulo, t*0.025 )
    r1LegiaoTexto:setFillColor(0, 0, 0)

    local r2Legiao = display.newRoundedRect( grupoLegiao, x*0.5, y*0.75, x*0.85, y*0.06, 100 )
    local r2LegiaoTexto = display.newText( grupoLegiao, perguntas.legiao.respostasLU[2], x*0.5, y*0.75, fonteTitulo, t*0.025 )
    r2LegiaoTexto:setFillColor(0, 0, 0)

    local r3Legiao = display.newRoundedRect( grupoLegiao, x*0.5, y*0.85, x*0.85, y*0.06, 100 )
    local r3LegiaoTexto = display.newText( grupoLegiao, perguntas.legiao.respostasLU[3], x*0.5, y*0.85, fonteTitulo, t*0.025 )
    r3LegiaoTexto:setFillColor(0, 0, 0)

    grupoLegiao.alpha = 0

    -- DECLARAÇÃO GRUPO NIRVANA

    local capaNirvana = display.newImageRect( grupoNirvana, 'Recursos/images/covers/nirvanaNevermind.jpg', x*0.65, y*0.3, t*0.2, t*0.2 )
    capaNirvana.x = x*0.5
    capaNirvana.y = y*0.28

    local p4Texto = display.newText( grupoNirvana, 'Qual o nome do vocalista?', x*0.5, y*0.57, fonteTitulo, t*0.02 )

    local r1Nirvana = display.newRoundedRect( grupoNirvana, x*0.5, y*0.65, x*0.85, y*0.06, 100 )
    local r1NirvanaTexto = display.newText( grupoNirvana, perguntas.nirvana.respostasNV[1], x*0.5, y*0.65, fonteTitulo, t*0.025 )
    r1NirvanaTexto:setFillColor(0, 0, 0)

    local r2Nirvana = display.newRoundedRect( grupoNirvana, x*0.5, y*0.75, x*0.85, y*0.06, 100 )
    local r2NirvanaTexto = display.newText( grupoNirvana, perguntas.nirvana.respostasNV[2], x*0.5, y*0.75, fonteTitulo, t*0.025 )
    r2NirvanaTexto:setFillColor(0, 0, 0)

    local r3Nirvana = display.newRoundedRect( grupoNirvana, x*0.5, y*0.85, x*0.85, y*0.06, 100 )
    local r3NirvanaTexto = display.newText( grupoNirvana, perguntas.nirvana.respostasNV[3], x*0.5, y*0.85, fonteTitulo, t*0.025 )
    r3NirvanaTexto:setFillColor(0, 0, 0)

    grupoNirvana.alpha = 0

    -- DECLARAÇÃO GRUPO PINK FLOYD

    local capaPinkFloyd = display.newImageRect( grupoPinkFloyd, 'Recursos/images/covers/pinkFloyd.jpg', x*0.65, y*0.3, t*0.2, t*0.2 )
    capaPinkFloyd.x = x*0.5
    capaPinkFloyd.y = y*0.28

    local p5Texto = display.newText( grupoPinkFloyd, 'Qual o nome da banda?', x*0.5, y*0.57, fonteTitulo, t*0.02 )

    local r1PinkFloyd = display.newRoundedRect( grupoPinkFloyd, x*0.5, y*0.65, x*0.85, y*0.06, 100 )
    local r1PinkFloydTexto = display.newText( grupoPinkFloyd, perguntas.pinkFloyd.respostasPF[1], x*0.5, y*0.65, fonteTitulo, t*0.025 )
    r1PinkFloydTexto:setFillColor(0, 0, 0)

    local r2PinkFloyd = display.newRoundedRect( grupoPinkFloyd, x*0.5, y*0.75, x*0.85, y*0.06, 100 )
    local r2PinkFloydTexto = display.newText( grupoPinkFloyd, perguntas.pinkFloyd.respostasPF[2], x*0.5, y*0.75, fonteTitulo, t*0.025 )
    r2PinkFloydTexto:setFillColor(0, 0, 0)

    local r3PinkFloyd = display.newRoundedRect( grupoPinkFloyd, x*0.5, y*0.85, x*0.85, y*0.06, 100 )
    local r3PinkFloydTexto = display.newText( grupoPinkFloyd, perguntas.pinkFloyd.respostasPF[3], x*0.5, y*0.85, fonteTitulo, t*0.025 )
    r3PinkFloydTexto:setFillColor(0, 0, 0)

    grupoPinkFloyd.alpha = 0

    -- DECLARAÇÃO VITÓRIA

    local fundoVitoria = display.newRect( grupoVitoria, x*0.5, y*0.5, x, y )
    fundoVitoria:setFillColor(0, 0, 0)
    fundoVitoria.alpha = 0.9

    local textoVitoria = display.newText( grupoVitoria, 'Você Venceu!', x*0.5, y*0.42
    , fonteTitulo, t*0.035 )
    textoVitoria:setFillColor(0.141, 0.73, 0.42)

    local botaoVitoria = display.newRoundedRect( grupoVitoria, x*0.5, y*0.65, x*0.7, y*0.055, 100 )

    local textoVitoria = display.newText( grupoVitoria, 'Voltar', botaoVitoria.x, botaoVitoria.y, fonteTitulo, t*0.025 )
    textoVitoria:setFillColor(0, 0, 0)

    grupoVitoria.alpha = 0

    -- DECLARAÇÃO DERROTA

    local fundoDerrota = display.newRect( grupoDerrota, x*0.5, y*0.5, x, y )
    fundoDerrota:setFillColor(0, 0, 0)
    fundoDerrota.alpha = 0.9

    local textoDerrota = display.newText( grupoDerrota, 'Você Perdeu', x*0.5, y*0.42
    , fonteTitulo, t*0.035 )
    textoDerrota:setFillColor(1, 0, 0)

    local botaoDerrota = display.newRoundedRect( grupoDerrota, x*0.5, y*0.65, x*0.7, y*0.055, 100 )

    local textoDerrota = display.newText( grupoDerrota, 'Voltar', botaoDerrota.x, botaoDerrota.y, fonteTitulo, t*0.025 )
    textoDerrota:setFillColor(0, 0, 0)

    grupoDerrota.alpha = 0

    -- DECLARAÇÃO DAS FUNCIONALIDADES

    -- FUNCIONALIDADE PERGUNTA BEATLES

    function verificaBeatles( event )
        if event.phase == 'began' then
            if event.target == r1Beatles then
                r1Beatles:setFillColor(1, 0, 0)
                diminuiTempo()
                audio.play( audioErro)
            elseif event.target == r2Beatles then
                r2Beatles:setFillColor(0.141, 0.73, 0.42)
                aumentaTempo()
                aumentaPonto()
                audio.play( audioAcerto )
                transition.to( grupoBeatles, {
                    time = 500,
                    alpha = 0
                })
                transition.to( grupoMadonna, {
                    time = 500,
                    alpha = 1
                } )
            elseif event.target == r3Beatles then
                r3Beatles:setFillColor(1, 0, 0)
                diminuiTempo()
                audio.play( audioErro)
            end            
        end
    end

    r1Beatles:addEventListener('touch', verificaBeatles )
    r2Beatles:addEventListener('touch', verificaBeatles )
    r3Beatles:addEventListener('touch', verificaBeatles )

    -- FUNCIONALIDADE PERGUNTA MADONNA

    function verificaMadonna( event )
        if event.phase == 'began' then
            if event.target == r1Madonna then
                r1Madonna:setFillColor(1, 0, 0)
                diminuiTempo()
                audio.play( audioErro)
            elseif event.target == r2Madonna then
                r2Madonna:setFillColor(0.141, 0.73, 0.42)
                aumentaTempo()
                aumentaPonto()
                audio.play( audioAcerto )
                transition.to( grupoMadonna, {
                    time = 500,
                    alpha = 0
                } )
                transition.to( grupoLegiao, {
                    time = 500,
                    alpha = 1
                } )
            elseif event.target == r3Madonna then
                r3Madonna:setFillColor(1, 0, 0)
                diminuiTempo()
                audio.play( audioErro)
            end            
        end
    end

    r1Madonna:addEventListener('touch', verificaMadonna )
    r2Madonna:addEventListener('touch', verificaMadonna )
    r3Madonna:addEventListener('touch', verificaMadonna )

    -- FUNCIONALIDADE PERGUNTA LEGIÃO URBANA

    function verificaLegiao( event )
        if event.phase == 'began' then
            if event.target == r1Legiao then
                r1Legiao:setFillColor(0.141, 0.73, 0.42)
                aumentaTempo()
                aumentaPonto()
                audio.play( audioAcerto )
                transition.to( grupoLegiao, {
                    time = 500,
                    alpha = 0
                } )
                transition.to( grupoNirvana, {
                    time = 500,
                    alpha = 1
                } )
            elseif event.target == r2Legiao then                
                r2Legiao:setFillColor(1, 0, 0)
                diminuiTempo()
                audio.play( audioErro)
            elseif event.target == r3Legiao then
                r3Legiao:setFillColor(1, 0, 0)
                diminuiTempo()
                audio.play( audioErro)
            end            
        end
    end

    r1Legiao:addEventListener('touch', verificaLegiao )
    r2Legiao:addEventListener('touch', verificaLegiao )
    r3Legiao:addEventListener('touch', verificaLegiao )

    -- FUNCIONALIDADE PERGUNTA NIRVANA

    function verificaNirvana( event )
        if event.phase == 'began' then
            if event.target == r1Nirvana then
                r1Nirvana:setFillColor(1, 0, 0)
                diminuiTempo()
                audio.play( audioErro)
            elseif event.target == r2Nirvana then                
                r2Nirvana:setFillColor(1, 0, 0)
                diminuiTempo()
                audio.play( audioErro)
            elseif event.target == r3Nirvana then                
                r3Nirvana:setFillColor(0.141, 0.73, 0.42)
                aumentaTempo()
                aumentaPonto()
                audio.play( audioAcerto )
                transition.to( grupoNirvana, {
                    time = 500,
                    alpha = 0
                } )
                transition.to( grupoPinkFloyd, {
                    time = 500,
                    alpha = 1
                } )
            end            
        end
    end

    r1Nirvana:addEventListener('touch', verificaNirvana )
    r2Nirvana:addEventListener('touch', verificaNirvana )
    r3Nirvana:addEventListener('touch', verificaNirvana )

    -- FUNCIONALIDADE PERGUNTA PINK FLOYD

    function verificaPinkFloyd( event )
        if event.phase == 'began' then
            if event.target == r1PinkFloyd then
                r1PinkFloyd:setFillColor(1, 0, 0)
                diminuiTempo()
                audio.play( audioErro)
            elseif event.target == r2PinkFloyd then                
                r2PinkFloyd:setFillColor(1, 0, 0)
                diminuiTempo()
                audio.play( audioErro)
            elseif event.target == r3PinkFloyd then                
                r3PinkFloyd:setFillColor(0.141, 0.73, 0.42)
                aumentaTempo()
                aumentaPonto()
                audio.play( audioAcerto )
                transition.to( grupoPinkFloyd, {
                    time = 500,
                    alpha = 0
                } )
                transition.to( grupoVitoria, {
                    time = 500,
                    alpha = 1
                } )
            end            
        end
    end

    r1PinkFloyd:addEventListener('touch', verificaPinkFloyd )
    r2PinkFloyd:addEventListener('touch', verificaPinkFloyd )
    r3PinkFloyd:addEventListener('touch', verificaPinkFloyd )

    -- FUNCIONALIDADE DERROTA

    function verificaDerrota(  )
        if tempo == 0 then
            transition.to( grupoDerrota, {
                time = 300,
                alpha = 1
            } )
            vidaIcone.alpha = 0
			vidaIcone2.alpha = 0
			vidaIcone3.alpha = 0         
        end
    end
    timer.performWithDelay( 100, verificaDerrota, 0 )

    -- FUNCIONALIDADE REINICIAR

    function reiniciar( event )
        composer.removeScene( 'Cenas.jogo' )
        composer.gotoScene( 'Cenas.menu' )
        -- audio.play( audioAcerto )
    end

    botaoDerrota:addEventListener('touch', reiniciar)
    botaoVitoria:addEventListener('touch', reiniciar)

    -- FUNCIONALIDADE TEMPO

    function atualizaTempo()
        if tempo > 0 and grupoVitoria.alpha == 0 then
          tempo = tempo -1
          tempoTexto.text = tempo
        end
      end
      timer.performWithDelay( 1000, atualizaTempo, 0)
    
      function aumentaTempo()
        if tempo > 0 then
          tempo = tempo + 10
          tempoTexto.text = tempo
        end
      end
    
      function diminuiTempo()
        if tempo > 5 then
          tempo = tempo - 5
          tempoTexto.text = tempo
          pontos = pontos - tempo*1
          pontosTexto.text = pontos
          vida = vida - 1
    
        elseif tempo < 5 then
          tempo = 0
          tempoTexto.text = tempo
          pontos = pontos - tempo*1
          pontosTexto.text = pontos
          vida = vida - 1
        end
      end
    
      function aumentaPonto()
        pontos = pontos + tempo*1
        pontosTexto.text = pontos
      end

      function verificaVida()
		if (vida == 3) then
			vidaIcone.alpha = 1
			vidaIcone2.alpha = 1
			vidaIcone3.alpha = 1
		elseif (vida == 2) then
			vidaIcone.alpha = 1
			vidaIcone2.alpha = 1
			vidaIcone3.alpha = 0
		elseif (vida == 1) then
			vidaIcone.alpha = 1
			vidaIcone2.alpha = 0
			vidaIcone3.alpha = 0
		elseif (vida == 0) then
			vidaIcone.alpha = 0
			vidaIcone2.alpha = 0
			vidaIcone3.alpha = 0
			transition.to( grupoDerrota, {
                time = 1000,
                alpha = 1
            } )
			vida = 3
		end
	end
	timer.performWithDelay( 1, verificaVida, 0)

    

end

cena:addEventListener('create', cena)
return cena