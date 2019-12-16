xquery version "3.0";

(:~
: User: lorenzobrazzi
: Date: 14.12.19
: Time: 13:21
: To change this template use File | Settings | File Templates.
:)

(: Nötige Module importieren:)
module namespace game = "bj/game";
import module namespace player = "bj/player" at "player.xqm";
import module namespace dealer = "bj/dealer" at "dealer.xqm";

declare variable $game:games := db:open("bj")/games;

declare function game:getGame() {
    $game:games
};

(: Spiel aus den Daten der Formulare instanzieren:)
declare function game:createEmptyGame(){
    let $id := fn:generate-id()
    return(
        <game id="{$id}">
        </game>
    )
};





