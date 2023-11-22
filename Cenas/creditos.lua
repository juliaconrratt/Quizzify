local composer = require( 'composer' )

local cena = composer.newScene(  )

function cena:create( event )
    local  grupoCreditos = self.view

    local x = display.contentWidth
    local y = display.contentHeight
    local t = x + y

    --DECLARAÇÃO DOS ÁUDIOS

    local audioBotao = audio.loadSound( 'Recursos/Audio/sound effects/Insert Tape - Sound Effect.m4a' )

    -- DECLARAÇÃO DAS FONTES

    local fonteTitulo = 'Recursos/fonts/metropolis/Metropolis-SemiBold.otf' 

    --BOTÃO VOLTAR

    local botaoVoltar = display.newRoundedRect( grupoCreditos, x*0.5, y*0.85, x*0.7, y*0.055, 100 )

    local textoVoltar = display.newText( grupoCreditos, 'Voltar', botaoVoltar.x, botaoVoltar.y, fonteTitulo, t*0.025 )
    textoVoltar:setFillColor(0, 0, 0)    
   
    -- AGRADECIMENTO

    local quadrado = display.newRect( grupoCreditos, x*0.5, y*0.28, t*0.2, t*0.2)
    quadrado:setFillColor(0.141, 0.73, 0.42)
  
    local textoCreditos = display.newText( grupoCreditos, 'Obrigada por jogar!', x*0.55, quadrado.y, quadrado.width*0.9,  quadrado.height*0.4, fonteTitulo, t*0.032 )
    textoCreditos:setFillColor(0, 0, 0)

    local textoNome = display.newText( grupoCreditos, 'Por: @juliaconrratt', x*0.59, y*0.51, quadrado.width*0.9,  quadrado.height*0.9, fonteTitulo, t*0.016 )
    textoNome:setFillColor(0, 0, 0)

    -- BOTÕES
    local botaoGithub = display.newRoundedRect( grupoCreditos, x*0.5, y*0.58, x*0.7, y*0.055, 100 )

    local textoGithub = display.newText( grupoCreditos, 'Github', botaoGithub.x, botaoGithub.y, fonteTitulo, t*0.025 )
    textoGithub:setFillColor(0, 0, 0)

    local botaoLinkedin = display.newRoundedRect( grupoCreditos, x*0.5, y*0.65, x*0.7, y*0.055, 100 )

    local textoLinkedin = display.newText( grupoCreditos, 'Linkedin', botaoLinkedin.x, botaoLinkedin.y, fonteTitulo, t*0.025 )
    textoLinkedin:setFillColor(0, 0, 0)

    local botaoBehance = display.newRoundedRect( grupoCreditos, x*0.5, y*0.72, x*0.7, y*0.055, 100 )

    local textoBehance = display.newText( grupoCreditos, 'Behance', botaoBehance.x, botaoBehance.y, fonteTitulo, t*0.025 )
    textoBehance:setFillColor(0, 0, 0)

    -- NOME DO JOGO
   
    local nomeJogo = display.newText( grupoCreditos, 'quizzify', x*0.5, y*0.95, fonteTitulo, t*0.035 )
    nomeJogo:setFillColor(0.141, 0.73, 0.42)

    -- FUNCIONALIDADES
    
    function verificaBotao( event )
        if event.phase == 'began' then
            if event.target == botaoVoltar then
                composer.gotoScene( 'Cenas.menu', {effect = 'fade', time = 500} )
                audio.play( audioBotao )
            elseif (event.target == botaoGithub) then
                system.openURL( 'https://github.com/juliaconrratt' ) 
            elseif (event.target == botaoLinkedin) then 
                system.openURL( 'https://www.linkedin.com/in/julia-conrratt/' )
            elseif (event.target == botaoBehance) then 
                system.openURL( 'https://www.behance.net/juliaconrratt' )
            end
        end
    end
    
    botaoVoltar:addEventListener('touch', verificaBotao)
    botaoGithub:addEventListener('touch', verificaBotao)
    botaoLinkedin:addEventListener('touch', verificaBotao)
    botaoBehance:addEventListener('touch', verificaBotao)

    -- end

end

cena:addEventListener('create', cena)
return cena

