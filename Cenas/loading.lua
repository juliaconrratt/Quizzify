local composer = require( 'composer' )

local cena = composer.newScene(  )

function cena:create( event )
    local  grupoCarregamento = self.view

    local x = display.contentWidth
    local y = display.contentHeight
    local t = x + y

    local fundo = display.newImageRect( grupoCarregamento, 'Recursos/images/background/bg4.5.jpg', x*2, y*2)
    fundo.x = x*0.5
    fundo.y = y*0.5

    --DECLARAÇÃO DOS ÁUDIOS

    local audioJogar = audio.loadSound( 'Recursos/Audio/sound effects/Tape rewind sound effect.m4a' )
    local fitaCassette = audio.loadStream( 'Recursos/Audio/sound effects/Cassette Insert  Sound Effect (HD).m4a' )

    audio.play( fitaCassette )

    -- DECLARAÇÃO DAS FONTES

    local fonteTitulo = 'Recursos/fonts/metropolis/Metropolis-SemiBold.otf'
   
    local nomeJogo = display.newText( grupoCarregamento, 'quizzify', x*0.5, y*0.95, fonteTitulo, t*0.028 )
    
    local fundoBarra = display.newRoundedRect( grupoCarregamento, x*0.5, y*0.4, x*0.7, y*0.055, 100 )

    local barra = display.newRoundedRect( grupoCarregamento, x*0.5, y*0.4, x*0.66, y*0.045, 100 )
    barra:setFillColor(0.141, 0.73, 0.42)

    local textoLoading = display.newText( grupoCarregamento, 'Carregando', x*0.5, y*0.4, fonteTitulo, t*0.02 )
  
    transition.to( barra, {
        time = math.random( 1000, 3000 ),        
        width = x*0.001,
        onComplete = function()
            composer.gotoScene( 'Cenas.menu', {effect = 'fade', time = 500} )
        end
    } )

    













end

cena:addEventListener('create', cena)
return cena