local composer = require('composer')

local cena = composer.newScene(  )

function cena:create( event )
    local  grupoTutorial = self.view

    local x = display.contentWidth
    local y = display.contentHeight
    local t = x + y
    
    -- DECLARAÇÃO DOS ÁUDIOS

    local audioBotao =audio.loadSound( 'Recursos/Audio/sound effects/Insert Tape - Sound Effect.m4a' )

    -- DECLARAÇÃO DAS FONTES

    local fonteTitulo =native.newFont( 'Recursos/fonts/metropolis/Metropolis-SemiBold.otf' )

    local nomeTutorial = display.newText( grupoTutorial, 'quizzify', x*0.5, y*0.95, fonteTitulo, t*0.035 )
    nomeTutorial:setFillColor(0.141, 0.73, 0.42)

    -- BOTÃO VOLTAR

    local botaoVoltar = display.newRoundedRect( grupoTutorial, x*0.5, y*0.85, x*0.7, y*0.055, 100 )

    local textoVoltar = display.newText( grupoTutorial, 'Voltar', botaoVoltar.x, botaoVoltar.y, fonteTitulo, t*0.025 )
    textoVoltar:setFillColor(0, 0, 0)

    -- BOTÃO JOGAR

    local botaoJogar = display.newRoundedRect( grupoTutorial, x*0.5, y*0.78, x*0.7, y*0.055, 100 )

    local textoJogar = display.newText( grupoTutorial, 'Jogar', botaoJogar.x, botaoJogar.y, fonteTitulo, t*0.025 )
    textoJogar:setFillColor(0, 0, 0)

    -- TUTORIAL

    local quadrado = display.newRect( grupoTutorial, x*0.5, y*0.4, t*0.25, t*0.45)
    quadrado:setFillColor(0.141, 0.73, 0.42)
  
    local textoTitulo = display.newText( grupoTutorial, 'Tutorial', quadrado.x, quadrado.y*0.32, fonteTitulo, t*0.04 )
    textoTitulo:setFillColor(0, 0, 0)

    -- VIDA 

    local grupoVida = display.newGroup()
	grupoTutorial:insert( grupoVida )

    local tituloVidas = display.newText( grupoTutorial, 'Vidas', quadrado.x*0.57, quadrado.y*0.5, fonteTitulo, t*0.03 )
    tituloVidas:setFillColor(0, 0, 0)

    local vida = display.newImageRect( grupoTutorial, 'Recursos/images/Icons/coracao-preto.png', t*0.03, t*0.03 )
    vida.x = x*0.5
	vida.y = quadrado.y*0.5

    local vida2 = display.newImageRect( grupoTutorial, 'Recursos/images/Icons/coracao-preto.png', t*0.03, t*0.03 )
    vida2.x = x*0.63
	vida2.y = quadrado.y*0.5

    local vida3 = display.newImageRect( grupoTutorial, 'Recursos/images/Icons/coracao-preto.png', t*0.03, t*0.03 )
    vida3.x = x*0.76
	vida3.y = quadrado.y*0.5

    local vidaTexto = display.newText( grupoTutorial, 'Você tem 3 vidas para utilizar. Caso erre uma pergunta, você perderá uma vida. Chegando a zero voce perderá o jogo.', x*0.52, quadrado.y, quadrado.width*0.9,  quadrado.height*0.45, fonteTitulo, t*0.023 )
    vidaTexto:setFillColor(0, 0, 0)

    grupoVida:insert(vida)
    grupoVida:insert(vida2)
    grupoVida:insert(vida3)
	grupoVida:insert(tituloVidas)
	grupoVida:insert(vidaTexto)
	grupoVida.alpha = 1

    -- TEMPO

    local grupoTempo = display.newGroup()
	grupoTutorial:insert( grupoTempo )

    local tituloTempo = display.newText( grupoTutorial, 'Tempo', quadrado.x*0.62, quadrado.y*0.5, fonteTitulo, t*0.03 )
    tituloTempo:setFillColor(0, 0, 0)

    local tempo = display.newImageRect( grupoTutorial, 'Recursos/images/Icons/clock.png', t*0.038, t*0.038 )
    tempo.x = x*0.57
	tempo.y = quadrado.y*0.49

    local tempoTexto = display.newText( grupoTutorial, 'Você terá trinta segundos para responder a pergunta. Se o tempo for zerado voce perderá.', x*0.52, quadrado.y, quadrado.width*0.9,  quadrado.height*0.45, fonteTitulo, t*0.023 )
    tempoTexto:setFillColor(0, 0, 0)

    grupoTempo:insert(tempo)
	grupoTempo:insert(tituloTempo)
	grupoTempo:insert(tempoTexto)
	grupoTempo.alpha = 0

    -- PONTOS

    local grupoPontos = display.newGroup()
	grupoTutorial:insert( grupoPontos )

    local tituloPontos = display.newText( grupoTutorial, 'Pontos', quadrado.x*0.62, quadrado.y*0.5, fonteTitulo, t*0.03 )
    tituloPontos:setFillColor(0, 0, 0)

    local pontos = display.newImageRect( grupoTutorial, 'Recursos/images/Icons/like(1).png', t*0.038, t*0.038 )
    pontos.x = x*0.57
	pontos.y = quadrado.y*0.49

    local pontosTexto = display.newText( grupoTutorial, 'A pontuação será multiplicada de acordo com o tempo em que você responde. Respostas erradas diminuem a pontuação.', x*0.52, quadrado.y, quadrado.width*0.9,  quadrado.height*0.45, fonteTitulo, t*0.023 )
    pontosTexto:setFillColor(0, 0, 0)

    grupoPontos:insert(pontos)
	grupoPontos:insert(tituloPontos)
	grupoPontos:insert(pontosTexto)
	grupoPontos.alpha = 0

    -- SETAS

    local setaProximo = display.newImageRect( grupoTutorial, 'Recursos/images/Icons/next(1).png', t*0.05, t*0.05 )
    setaProximo.x = x*0.7
	setaProximo.y = quadrado.y*1.55

    local setaAnterior = display.newImageRect( grupoTutorial, 'Recursos/images/Icons/back(1).png', t*0.05, t*0.05 )
    setaAnterior.x = x*0.3
	setaAnterior.y = quadrado.y*1.55
    setaAnterior.alpha = 0

    -- FUNCIONALIDADES

    function verificaToque( event )
		if (event.phase == 'began') then
			if (event.target == setaProximo and grupoVida.alpha == 1) then
				transition.dissolve( grupoVida, grupoTempo, 500 )
				transition.to( setaAnterior, {time = 500, alpha = 1} )
                audio.play( audioBotao )
			elseif (event.target == setaProximo and grupoTempo.alpha == 1) then
				transition.dissolve(grupoTempo, grupoPontos, 500 )
				transition.to( setaProximo, {time = 500, alpha = 0} )
                audio.play( audioBotao )
			elseif(event.target == setaAnterior and grupoPontos.alpha == 1 ) then
				transition.dissolve(grupoPontos, grupoTempo, 500 )
				transition.to( setaProximo, {time = 500, alpha = 1} )
                audio.play( audioBotao )
			elseif(event.target == setaAnterior and grupoTempo.alpha == 1) then
				transition.dissolve(grupoTempo, grupoVida, 500 )
				transition.to( setaAnterior, {time = 500, alpha = 0} )
                audio.play( audioBotao )
			end
		end
	end

    function verificaBotao( event )
        if event.phase == 'began' then
            if event.target == botaoVoltar then
                composer.gotoScene( 'Cenas.menu', {effect = 'fade', time = 500} )
                audio.play( audioBotao )
            elseif event.target == botaoJogar then
                composer.gotoScene( 'Cenas.jogo' )
                audio.play( audioBotao )
            end
        end
    end
    
    botaoVoltar:addEventListener('touch', verificaBotao)
    botaoJogar:addEventListener('touch', verificaBotao)
    setaAnterior:addEventListener('touch', verificaToque)
    setaProximo:addEventListener('touch', verificaToque)

    
end

cena:addEventListener( 'create', cena )
return cena