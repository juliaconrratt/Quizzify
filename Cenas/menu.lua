local composer = require("composer")

local cena = composer.newScene(  )

function cena:create( event )
    local  grupoMenu = self.view

    local x = display.contentWidth
    local y = display.contentHeight
    local t = x + y
   
    local fundo = display.newImageRect( grupoMenu, 'Recursos/images/background/bg4.5.jpg', x*2, y*2 )
    fundo.x = x*0.5
    fundo.y = y*0.5
    
    --DECLARAÇÃO DOS ÁUDIOS

    local audioBotao = audio.loadSound( 'Recursos/Audio/sound effects/Insert Tape - Sound Effect.m4a' )
    local musicaFundo = audio.loadStream( 'Recursos/Audio/bg music/(no copyright music) lofi type beat biscuit.m4a' )

    audio.play( musicaFundo, {channel = 32, loops = -1} )
    audio.setVolume( 0, {channel = 32} )

    -- DECLARAÇÃO DAS FONTES

    local fonteTitulo = 'Recursos/fonts/metropolis/Metropolis-SemiBold.otf'

    -- DECLARAÇÃO BOTÃO JOGAR
   
    local nomeJogo = display.newText( grupoMenu, 'quizzify', x*0.5, y*0.95, fonteTitulo, t*0.035 )
    nomeJogo:setFillColor(0.141, 0.73, 0.42)

    local botaoJogar = display.newRect( grupoMenu, x*0.5, y*0.28, t*0.2, t*0.2)
    botaoJogar:setFillColor(0.141, 0.73, 0.42)
  
    local textoJogar = display.newText( grupoMenu, 'Jogar', botaoJogar.x, botaoJogar.y, fonteTitulo, t*0.05 )
    textoJogar:setFillColor(0, 0, 0)

    -- DECLARAÇÃO BOTÃO TUTORIAL

    local botaoTutorial = display.newRoundedRect( grupoMenu, x*0.5, y*0.78, x*0.7, y*0.055, 100 )

    local textoTutorial = display.newText( grupoMenu, 'Tutorial', botaoTutorial.x, botaoTutorial.y, fonteTitulo, t*0.025 )
    textoTutorial:setFillColor(0, 0, 0)

    -- DECLARAÇÃO BOTÃO CRÉDITOS
   
    local botaoCreditos = display.newRoundedRect( grupoMenu, x*0.5, y*0.85, x*0.7, y*0.055, 100 )

    local textoCreditos = display.newText( grupoMenu, 'Créditos', botaoCreditos.x, botaoCreditos.y, fonteTitulo, t*0.025 )
    textoCreditos:setFillColor(0, 0, 0)

    -- FUNCIONALIDADES

    -- FUNCIONALIDADE BOTÕES

    function verificaBotao( event )
        if event.phase == 'began' then
            if event.target == botaoJogar then
                composer.gotoScene( 'Cenas.jogo', {effect = 'fade', time = 500} )            
                audio.play( audioBotao )
            elseif event.target == botaoTutorial then
                composer.gotoScene( 'Cenas.tutorial', {effect = 'fade', time = 500} )                
                audio.play( audioBotao )
            elseif event.target == botaoCreditos then
               composer.gotoScene( 'Cenas.creditos', {effect = 'fade', time = 500} )
               audio.play( audioBotao )
            end
        end
    end
    
    botaoJogar:addEventListener('touch', verificaBotao)
    botaoCreditos:addEventListener('touch', verificaBotao)
    botaoTutorial:addEventListener('touch', verificaBotao)
    
end

cena:addEventListener('create', cena)
return cena