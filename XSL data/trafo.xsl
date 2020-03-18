<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"
                version="2.0">

    <xsl:include href="allgemeine_Werte.xsl"></xsl:include>
<!--
    Bemerkungen zum Spielfeld:
    Im Spielfeld sollten die Knöpfe:    STAND, HIT, DOUBLE, INSURANCE fixiert sein.
    Zusätzlich muss jeder Chip einmal abgebildet sein (am besten die Zeile über den Knöpfen), die dann im Backend anklickbar
    gemacht werden.
    Der Insurance knopf soll grau sein bis Insurance möglich wird. Dann soll dieser Heller und farbig werden!
-->
    <!-- Jede card wird als ein Svg element ausgegeben -->


    <xsl:template match="card">
        <xsl:variable name="Color" select="color"></xsl:variable>
        <xsl:variable name="value" select="value"></xsl:variable>
        <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink">
            <g alignment-baseline="baseline" />
            <rect height="{$cardHeight}" width="{$cardWidth}" x="{$karteX}" y="{$karteY}" rx="5" ry="5" style="fill:white;stroke:black;stroke-width:2;opacity:1.0" />
            <xsl:choose>

                <!-- Spezial cardn Sonderfälle-->
                <xsl:when test="$value = 'K'">
                    <xsl:choose>
                        <xsl:when test="$Color = 'Spade'">
                            <use href="#Spade-K" />
                        </xsl:when>
                        <xsl:when test="$Color = 'Heart'">
                            <use href="#Heart-K" />
                        </xsl:when>
                        <xsl:when test="$Color = 'Diamond'">
                            <use href="#Diamond-K" />
                        </xsl:when>
                        <xsl:when test="$Color = 'Club'">
                            <use href="#Club-K" />
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="$value = 'Q'">
                    <xsl:choose>
                        <xsl:when test="$Color = 'Spade'">
                            <use href="#Spade-Q" />
                        </xsl:when>
                        <xsl:when test="$Color = 'Heart'">
                            <use href="#Heart-Q" />
                        </xsl:when>
                        <xsl:when test="$Color = 'Diamond'">
                            <use href="#Diamond-Q" />
                        </xsl:when>
                        <xsl:when test="$Color = 'Club'">
                            <use href="#Club-Q" />
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="$value = 'B'">
                    <xsl:choose>
                        <xsl:when test="$Color = 'Spade'">
                            <use href="#Spade-B" />
                        </xsl:when>
                        <xsl:when test="$Color = 'Heart'">
                            <use href="#Heart-B" />
                        </xsl:when>
                        <xsl:when test="$Color = 'Diamond'">
                            <use href="#Diamond-B" />
                        </xsl:when>
                        <xsl:when test="$Color = 'Club'">
                            <use href="#Club-B" />
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>

                <!-- Symbole und reguläre Zahlen, die aus der XML Datei entnommen werden -->
                <xsl:when test="$Color = 'Spade'">

                    <g>
                        <text id="kar" x="{$valueXMini}" y="{$valueYMini}" font-size="{$sizeValue}" fill="black" text-anchor="middle">
                            <xsl:value-of select="value"></xsl:value-of>
                        </text>
                        <text id="kar_usd" transform="rotate(180,{$valueXMini - ($valueXMini div 2) + $xMiniAdd},{$valueYMini - ($valueYMini div 2)+$yMiniValueAddUsd})" font-size="{$sizeValue}" fill="black" text-anchor="middle">
                            <xsl:value-of select="value"></xsl:value-of>
                        </text>
                        <use xlink:href="#Spade-{$value}" />
                        <text id="Spade_symbol" x="{$symbolXMini}" y="{$symbolYMini}" font-size="{$sizeSmallSymbol}" fill="black" text-anchor="middle">♠</text>
                        <text id="Spade_symbol_usd" transform="rotate(180,{$symbolXMini - ($symbolXMini div 2)+ $xMiniAdd},{$symbolYMini - ($symbolYMini div 2)+$yMiniSymbolAddUsd})" font-size="{$sizeSmallSymbol}" fill="black" text-anchor="middle">♠</text>
                    </g>

                </xsl:when>
                <xsl:when test="$Color = 'Club'">
                    <g>
                        <text id="kar" x="{$valueXMini}" y="{$valueYMini}" font-size="{$sizeValue}" fill="black" text-anchor="middle">
                            <xsl:value-of select="value"></xsl:value-of>
                        </text>
                        <text id="kar_usd" transform="rotate(180,{$valueXMini - ($valueXMini div 2) + $xMiniAdd},{$valueYMini - ($valueYMini div 2)+$yMiniValueAddUsd})" font-size="{$sizeValue}" fill="black" text-anchor="middle">
                            <xsl:value-of select="value"></xsl:value-of>
                        </text>
                        <use xlink:href="#Club-{$value}" />
                        <text id="Club_symbol" x="{$symbolXMini}" y="{$symbolYMini}" font-size="{$sizeSmallSymbol}" fill="black" text-anchor="middle">♣</text>
                        <text id="Club_symbol_usd" transform="rotate(180,{$symbolXMini - ($symbolXMini div 2)+ $xMiniAdd},{$symbolYMini - ($symbolYMini div 2)+$yMiniSymbolAddUsd})" font-size="{$sizeSmallSymbol}" fill="black" text-anchor="middle">♣</text>
                    </g>
                </xsl:when>
                <xsl:when test="$Color = 'Heart'">
                    <g>
                        <text id="kar" x="{$valueXMini}" y="{$valueYMini}" font-size="{$sizeValue}" fill="red" text-anchor="middle">
                            <xsl:value-of select="value"></xsl:value-of>
                        </text>
                        <text id="kar_usd" transform="rotate(180,{$valueXMini - ($valueXMini div 2) + $xMiniAdd},{$valueYMini - ($valueYMini div 2)+$yMiniValueAddUsd})" font-size="{$sizeValue}" fill="red" text-anchor="middle">
                            <xsl:value-of select="value"></xsl:value-of>
                        </text>
                        <use xlink:href="#Heart-{$value}" />
                        <text id="Heart_symbol" x="{$symbolXMini}" y="{$symbolYMini}" font-size="{$sizeSmallSymbol}" fill="red" text-anchor="middle">♥</text>
                        <text id="Heart_symbol_usd" transform="rotate(180,{$symbolXMini - ($symbolXMini div 2)+ $xMiniAdd},{$symbolYMini - ($symbolYMini div 2)+$yMiniSymbolAddUsd})" font-size="{$sizeSmallSymbol}" fill="red" text-anchor="middle">♥</text>
                    </g>
                </xsl:when>
                <xsl:when test="$Color = 'Diamond'">
                    <g>
                        <text id="kar" x="{$valueXMini}" y="{$valueYMini}" font-size="{$sizeValue}" fill="red" text-anchor="middle">
                            <xsl:value-of select="value"></xsl:value-of>
                        </text>
                        <text id="kar_usd" transform="rotate(180,{$valueXMini - ($valueXMini div 2) + $xMiniAdd},{$valueYMini - ($valueYMini div 2)+$yMiniValueAddUsd})" font-size="{$sizeValue}" fill="red" text-anchor="middle">
                            <xsl:value-of select="value"></xsl:value-of>
                        </text>
                        <use xlink:href="#Diamond-{$value}" />
                        <text id="Diamond_symbol" x="{$symbolXMini}" y="{$symbolYMini}" font-size="{$sizeSmallSymbol}" fill="red" text-anchor="middle">♦</text>
                        <text id="Diamond_symbol_usd" transform="rotate(180,{$symbolXMini - ($symbolXMini div 2)+ $xMiniAdd},{$symbolYMini - ($symbolYMini div 2)+$yMiniSymbolAddUsd})" font-size="{$sizeSmallSymbol}" fill="red" text-anchor="middle">♦</text>
                    </g>
                </xsl:when>
            </xsl:choose>


            <!-- SVG Definitionen um Redundanz zu vermeiden -->
            <defs>
                <g id="CardTemplate">
                    <rect height="{$cardHeight}" width="{$cardWidth}" x="{$karteX}" y="{$karteY}" rx="5" ry="5" style="fill:white;stroke:black;stroke-width:2;opacity:1.0" />
                </g>
            </defs>
            <defs>
                <g id="Diamond-K">
                    <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/0/06/KD.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                </g>
            </defs>

            <defs>
                <g id="Diamond-Q">

                    <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/6/63/QD.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                </g>
            </defs>
            <defs>
                <g id="Diamond-B">
                    <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/3/33/JD.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                </g>
            </defs>
            <defs>
                <g id="Heart-K">
                    <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/e/e5/KH.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                </g>
            </defs>

            <defs>
                <g id="Heart-Q">
                    <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/d/d2/QH.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                </g>
            </defs>

            <defs>
                <g id="Heart-B">
                    <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/1/15/JH.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                </g>
            </defs>
            <defs>
                <g id="Club-K">
                    <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/e/e1/KC.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                </g>
            </defs>

            <defs>
                <g id="Club-Q">
                    <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/9/9e/QC.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                </g>
            </defs>

            <defs>
                <g id="Club-B">
                    <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/1/11/JC.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                </g>
            </defs>
            <defs>
                <g id="Spade-K">
                    <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/5/5c/KS.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                </g>
            </defs>

            <defs>
                <g id="Spade-Q">
                    <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/3/35/QS.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                </g>
            </defs>

            <defs>
                <g id="Spade-B">
                    <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/d/d9/JS.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                </g>
            </defs>

            <!-- alle Spades -->
            <defs>
                <g id="Spade-A">
                    <text x="{$xCardMid}" y="{$yAceSymbol}" font-size="{$sizeAceSymbol}" fill="black" text-anchor="middle">♠</text>
                </g>

            </defs>

            <defs>
                <g id="Spade-2">
                    <text id="Spade_symbol_big" x="{$xCardMid}" y="{$yBigSymbolTop}" font-size="{$sizeBigSymbol}" fill="black" text-anchor="middle">♠</text>
                    <!-- Das Symbol an der Y achse spiegeln -->
                    <text id="Spade_symbol_big_usd" transform="rotate(180,{$jetztX - ($jetztX div 2)},{$jetztY - ($jetztY div 2)+$yBigSymbolUsdBotAdd})" font-size="{$sizeBigSymbol}" fill="black" text-anchor="middle">♠</text>
                </g>

            </defs>

            <defs>
                <g id="Spade-3">
                    <use xlink:href="#Spade-2" />
                    <use xlink:href="#Spade_symbol_big" x="0" y="{$yBigSymbolTopToMid}"/>
                </g>
            </defs>

            <defs>
                <g id="Spade-4">
                    <use xlink:href="#Spade-2" transform="translate(-{$xBigSymbolMidToEdge}, 0)" />
                    <use xlink:href="#Spade-2" transform="translate({$xBigSymbolMidToEdge}, 0)" />
                </g>
            </defs>

            <defs>
                <g id="Spade-5">
                    <use xlink:href="#Spade-4" />
                    <use xlink:href="#Spade_symbol_big" x="0" y="{$yBigSymbolTopToMid}"/>
                </g>
            </defs>
            <defs>
                <g id="Spade-6">
                    <use xlink:href="#Spade-3" transform="translate(-{$xBigSymbolMidToEdge},0)" />
                    <use xlink:href="#Spade-3" transform="translate({$xBigSymbolMidToEdge},0)" />
                </g>
            </defs>
            <defs>
                <g id="Spade-7">
                    <use xlink:href="#Spade-6" />
                    <use xlink:href="#Spade_symbol_big" x="0" y="{$yBigSymbolTopToMid div 2}" />
                </g>
            </defs>
            <defs>
                <g id="Spade-8">
                    <use xlink:href="#Spade-7" />
                    <use xlink:href="#Spade_symbol_big_usd" x="0" y="-{$yBigSymbolTopToMid div 2}"/>
                </g>
            </defs>
            <defs>
                <g id="Spade-9">
                    <use xlink:href="#Spade-5" />
                    <g id="Spade_Doppel">
                        <g id="Spade_Einzel">
                            <use xlink:href="#Spade_symbol_big" x="-{$xBigSymbolMidToEdge}" y="{$yBigSymbolNineSide}" />
                            <use xlink:href="#Spade_symbol_big_usd" x="-{$xBigSymbolMidToEdge}" y="-{$yBigSymbolNineSide}"/>
                        </g>
                        <use xlink:href="#Spade_Einzel" transform="translate({($xBigSymbolMidToEdge *2)},0)"/>
                    </g>
                </g>
            </defs>
            <defs>
                <g id="Spade-10">
                    <use xlink:href="#Spade-4" />
                    <use xlink:href="#Spade_Doppel"/>
                    <use xlink:href="#Spade_symbol_big" x="0" y="{$yBigSymbolTenMid}"/>
                    <use xlink:href="#Spade_symbol_big_usd" x="0" y="-{$yBigSymbolTenMid}"/>
                </g>
            </defs>

            <!-- alle Clube -->
            <defs>
                <g id="Club-A">
                    <text x="{$xCardMid}" y="{$yAceSymbol}" font-size="{$sizeAceSymbol}" fill="black" text-anchor="middle">♣</text>
                </g>

            </defs>
            <defs>
                <g id="Club-2">
                    <text id="Club_symbol_big" x="{$xCardMid}" y="{$yBigSymbolTop}" font-size="{$sizeBigSymbol}" fill="black" text-anchor="middle">♣</text>
                    <!-- Das Symbol an der Y achse spiegeln -->
                    <text id="Club_symbol_big_usd" transform="rotate(180,{$jetztX - ($jetztX div 2)},{$jetztY - ($jetztY div 2)+$yBigSymbolUsdBotAdd})" font-size="{$sizeBigSymbol}" fill="black" text-anchor="middle">♣</text>
                </g>

            </defs>

            <defs>
                <g id="Club-3">
                    <use xlink:href="#Club-2" />
                    <use xlink:href="#Club_symbol_big" x="0" y="{$yBigSymbolTopToMid}"/>
                </g>
            </defs>

            <defs>
                <g id="Club-4">
                    <use xlink:href="#Club-2" transform="translate(-{$xBigSymbolMidToEdge}, 0)" />
                    <use xlink:href="#Club-2" transform="translate({$xBigSymbolMidToEdge}, 0)" />
                </g>
            </defs>

            <defs>
                <g id="Club-5">
                    <use xlink:href="#Club-4" />
                    <use xlink:href="#Club_symbol_big" x="0" y="{$yBigSymbolTopToMid}"/>
                </g>
            </defs>
            <defs>
                <g id="Club-6">
                    <use xlink:href="#Club-3" transform="translate(-{$xBigSymbolMidToEdge},0)" />
                    <use xlink:href="#Club-3" transform="translate({$xBigSymbolMidToEdge},0)" />
                </g>
            </defs>
            <defs>
                <g id="Club-7">
                    <use xlink:href="#Club-6" />
                    <use xlink:href="#Club_symbol_big" x="0" y="{$yBigSymbolTopToMid div 2}" />
                </g>
            </defs>
            <defs>
                <g id="Club-8">
                    <use xlink:href="#Club-7" />
                    <use xlink:href="#Club_symbol_big_usd" x="0" y="-{$yBigSymbolTopToMid div 2}"/>
                </g>
            </defs>
            <defs>
                <g id="Club-9">
                    <use xlink:href="#Club-5" />
                    <g id="Club_Doppel">
                        <g id="Club_Einzel">
                            <use xlink:href="#Club_symbol_big" x="-{$xBigSymbolMidToEdge}" y="{$yBigSymbolNineSide}" />
                            <use xlink:href="#Club_symbol_big_usd" x="-{$xBigSymbolMidToEdge}" y="-{$yBigSymbolNineSide}"/>
                        </g>
                        <use xlink:href="#Club_Einzel" transform="translate({($xBigSymbolMidToEdge *2)},0)"/>
                    </g>
                </g>
            </defs>
            <defs>
                <g id="Club-10">
                    <use xlink:href="#Club-4" />
                    <use xlink:href="#Club_Doppel"/>
                    <use xlink:href="#Club_symbol_big" x="0" y="{$yBigSymbolTenMid}"/>
                    <use xlink:href="#Club_symbol_big_usd" x="0" y="-{$yBigSymbolTenMid}"/>
                </g>
            </defs>

            <!-- alle Hearten -->

            <defs>
                <g id="Heart-A">
                    <text x="{$xCardMid}" y="{$yAceSymbol}" font-size="{$sizeAceSymbol}" fill="red" text-anchor="middle">♥</text>
                </g>

            </defs>
            <defs>
                <g id="Heart-2">
                    <text id="Heart_symbol_big" x="{$xCardMid}" y="{$yBigSymbolTop}" font-size="{$sizeBigSymbol}" fill="red" text-anchor="middle">♥</text>
                    <!-- Das Symbol an der Y achse spiegeln -->
                    <text id="Heart_symbol_big_usd" transform="rotate(180,{$jetztX - ($jetztX div 2)},{$jetztY - ($jetztY div 2)+$yBigSymbolUsdBotAdd})" font-size="{$sizeBigSymbol}" fill="red" text-anchor="middle">♥</text>
                </g>

            </defs>

            <defs>
                <g id="Heart-3">
                    <use xlink:href="#Heart-2" />
                    <use xlink:href="#Heart_symbol_big" x="0" y="{$yBigSymbolTopToMid}"/>
                </g>
            </defs>

            <defs>
                <g id="Heart-4">
                    <use xlink:href="#Heart-2" transform="translate(-{$xBigSymbolMidToEdge}, 0)" />
                    <use xlink:href="#Heart-2" transform="translate({$xBigSymbolMidToEdge}, 0)" />
                </g>
            </defs>

            <defs>
                <g id="Heart-5">
                    <use xlink:href="#Heart-4" />
                    <use xlink:href="#Heart_symbol_big" x="0" y="{$yBigSymbolTopToMid}"/>
                </g>
            </defs>
            <defs>
                <g id="Heart-6">
                    <use xlink:href="#Heart-3" transform="translate(-{$xBigSymbolMidToEdge},0)" />
                    <use xlink:href="#Heart-3" transform="translate({$xBigSymbolMidToEdge},0)" />
                </g>
            </defs>
            <defs>
                <g id="Heart-7">
                    <use xlink:href="#Heart-6" />
                    <use xlink:href="#Heart_symbol_big" x="0" y="{$yBigSymbolTopToMid div 2}" />
                </g>
            </defs>
            <defs>
                <g id="Heart-8">
                    <use xlink:href="#Heart-7" />
                    <use xlink:href="#Heart_symbol_big_usd" x="0" y="-{$yBigSymbolTopToMid div 2}"/>
                </g>
            </defs>
            <defs>
                <g id="Heart-9">
                    <use xlink:href="#Heart-5" />
                    <g id="Heart_Doppel">
                        <g id="Heart_Einzel">
                            <use xlink:href="#Heart_symbol_big" x="-{$xBigSymbolMidToEdge}" y="{$yBigSymbolNineSide}" />
                            <use xlink:href="#Heart_symbol_big_usd" x="-{$xBigSymbolMidToEdge}" y="-{$yBigSymbolNineSide}"/>
                        </g>
                        <use xlink:href="#Heart_Einzel" transform="translate({($xBigSymbolMidToEdge *2)},0)"/>
                    </g>
                </g>
            </defs>
            <defs>
                <g id="Heart-10">
                    <use xlink:href="#Heart-4" />
                    <use xlink:href="#Heart_Doppel"/>
                    <use xlink:href="#Heart_symbol_big" x="0" y="{$yBigSymbolTenMid}"/>
                    <use xlink:href="#Heart_symbol_big_usd" x="0" y="-{$yBigSymbolTenMid}"/>
                </g>
            </defs>

            <!-- alle Diamond -->
            <defs>
                <g id="Diamond-A">
                    <text x="{$xCardMid}" y="{$yAceSymbol}" font-size="{$sizeAceSymbol}" fill="red" text-anchor="middle">♦</text>
                </g>

            </defs>
            <defs>
                <g id="Diamond-2">
                    <text id="Diamond_symbol_big" x="{$xCardMid}" y="{$yBigSymbolTop}" font-size="{$sizeBigSymbol}" fill="red" text-anchor="middle">♦</text>
                    <!-- Das Symbol an der Y achse spiegeln -->
                    <text id="Diamond_symbol_big_usd" transform="rotate(180,{$jetztX - ($jetztX div 2)},{$jetztY - ($jetztY div 2)+$yBigSymbolUsdBotAdd})" font-size="{$sizeBigSymbol}" fill="red" text-anchor="middle">♦</text>
                </g>

            </defs>

            <defs>
                <g id="Diamond-3">
                    <use xlink:href="#Diamond-2" />
                    <use xlink:href="#Diamond_symbol_big" x="0" y="{$yBigSymbolTopToMid}"/>
                </g>
            </defs>

            <defs>
                <g id="Diamond-4">
                    <use xlink:href="#Diamond-2" transform="translate(-{$xBigSymbolMidToEdge}, 0)" />
                    <use xlink:href="#Diamond-2" transform="translate({$xBigSymbolMidToEdge}, 0)" />
                </g>
            </defs>

            <defs>
                <g id="Diamond-5">
                    <use xlink:href="#Diamond-4" />
                    <use xlink:href="#Diamond_symbol_big" x="0" y="{$yBigSymbolTopToMid}"/>
                </g>
            </defs>
            <defs>
                <g id="Diamond-6">
                    <use xlink:href="#Diamond-3" transform="translate(-{$xBigSymbolMidToEdge},0)" />
                    <use xlink:href="#Diamond-3" transform="translate({$xBigSymbolMidToEdge},0)" />
                </g>
            </defs>
            <defs>
                <g id="Diamond-7">
                    <use xlink:href="#Diamond-6" />
                    <use xlink:href="#Diamond_symbol_big" x="0" y="{$yBigSymbolTopToMid div 2}" />
                </g>
            </defs>
            <defs>
                <g id="Diamond-8">
                    <use xlink:href="#Diamond-7" />
                    <use xlink:href="#Diamond_symbol_big_usd" x="0" y="-{$yBigSymbolTopToMid div 2}"/>
                </g>
            </defs>
            <defs>
                <g id="Diamond-9">
                    <use xlink:href="#Diamond-5" />
                    <g id="Diamond_Doppel">
                        <g id="Diamond_Einzel">
                            <use xlink:href="#Diamond_symbol_big" x="-{$xBigSymbolMidToEdge}" y="{$yBigSymbolNineSide}" />
                            <use xlink:href="#Diamond_symbol_big_usd" x="-{$xBigSymbolMidToEdge}" y="-{$yBigSymbolNineSide}"/>
                        </g>
                        <use xlink:href="#Diamond_Einzel" transform="translate({($xBigSymbolMidToEdge *2)},0)"/>
                    </g>
                </g>
            </defs>
            <defs>
                <g id="Diamond-10">
                    <use xlink:href="#Diamond-4" />
                    <use xlink:href="#Diamond_Doppel"/>
                    <use xlink:href="#Diamond_symbol_big" x="0" y="{$yBigSymbolTenMid}"/>
                    <use xlink:href="#Diamond_symbol_big_usd" x="0" y="-{$yBigSymbolTenMid}"/>
                </g>
            </defs>
        </svg>
    </xsl:template>
    <xsl:template match="/chip">
        <!-- Der Trafo code -->


        <!-- SVG Defintionen für Chips-->
        <!-- default chip, other chips have the same features -->
        <defs>
            <h id="default-chip">
                <circle r="8" stroke="blue" stroke-width="3" fill="white" />
            </h>
        </defs>

        <!-- different chip values: from 1 to 1000 -->
        <defs>
            <text id="chip-value-1" font-size="11.5" fill="black">1</text>
        </defs>

        <defs>
            <text id="chip-value-5" font-size="11.5" fill="black">5</text>
        </defs>

        <defs>
            <text id="chip-value-25" font-size="11.5" fill="black">25</text>
        </defs>

        <defs>
            <text id="chip-value-100" font-size="11.5" fill="black">100</text>
        </defs>

        <defs>
            <text id="chip-value-500" font-size="11.5" fill="black">500</text>
        </defs>

        <defs>
            <text id="chip-value-1000" font-size="11.5" fill="black">1000</text>
        </defs>

        <!-- coins with value defines a chip -->

        <defs>
            <g id="chip-1">
                <use xlink:href="#default-chip" />
                <use xlink:href="#chip-value-1" x="-2" y="5" />
            </g>
        </defs>

        <defs>
            <g id="chip-5">
                <use xlink:href="#default-chip" />
                <use xlink:href="#chip-value-5" x="-5" y="5" />
            </g>
        </defs>

        <defs>
            <g id="chip-25">
                <use xlink:href="#default-chip" />
                <use xlink:href="#chip-value-25" x="-5" y="5" />
            </g>
        </defs>

        <defs>
            <g id="chip-100">
                <use xlink:href="#default-chip" />
                <use xlink:href="#chip-value-100" x="-8.5" y="5" />
            </g>
        </defs>

        <defs>
            <g id="chip-500">
                <use xlink:href="#default-chip" />
                <use xlink:href="#chip-value-500" x="-8.5" y="5" />
            </g>
        </defs>

        <defs>
            <g id="chip-1000">
                <use xlink:href="#default-chip" />
                <use xlink:href="#chip-value-1000" x="-8.5" y="5" />
            </g>
        </defs>
    </xsl:template>
    <xsl:template match="game">
        <svg width="100%" height="100%" version="1.1" viewBox="0 0 1600 900"
             xmlns="http://www.w3.org/2000/svg">
            <g alignment-baseline="baseline" />
            <!-- allgemeine Variabeln einfügen -->

            <!-- Hintergrund -->
            <rect id="hintergrund" fill="brown" width="1000%" height="1000%" x="-3000" />


            <!-- Tischform -->
            <circle cx="800" cy="0" r="900" fill="{$farbeTisch}" />
            <circle cx="800" cy="0" r="900" style="fill:none;stroke:{$farbeTischRand};stroke-width:50"/>


            <!-- Dealer Platz -->
            <rect x="550" y="50" rx="15" ry="15" width="450" height="150" style="fill:none;stroke:#fff;stroke-width:4"/>

            <!-- Karten- und Einsatzpositionen-->
            <circle cx="{$player1x}" cy="{$player1y}" r="{$radiusPlayer}" style="fill:none;stroke:white;stroke-width:4"/>
            <circle cx="{$player2x}" cy="{$player2y}" r="{$radiusPlayer}" style="fill:none;stroke:white;stroke-width:4"/>
            <circle cx="{$player3x}" cy="{$player3y}" r="{$radiusPlayer}" style="fill:none;stroke:white;stroke-width:4"/>
            <circle cx="{$player4x}" cy="{$player4y}" r="{$radiusPlayer}" style="fill:none;stroke:white;stroke-width:4"/>
            <circle cx="{$player5x}" cy="{$player5y}" r="{$radiusPlayer}" style="fill:none;stroke:white;stroke-width:4"/>


            <!-- Spielernamen -->
            <text x="{$player1x}" y="{$player1y + $radiusPlayer + $zeilenAbstand}" font-family="Arial" font-size="{$spielerNamenTextSize}" fill="white" text-anchor="middle">
                Player 1
            </text>
            <text x="{$player2x}" y="{$player2y + $radiusPlayer + $zeilenAbstand}" font-family="Arial" font-size="{$spielerNamenTextSize}" fill="white" text-anchor="middle">
                Player 2
            </text>
            <text x="{$player3x}" y="{$player3y + $radiusPlayer + $zeilenAbstand}" font-family="Arial" font-size="{$spielerNamenTextSize}" fill="white" text-anchor="middle">
                Player 3
            </text>
            <text x="{$player4x}" y="{$player4y + $radiusPlayer + $zeilenAbstand}" font-family="Arial" font-size="{$spielerNamenTextSize}" fill="white" text-anchor="middle">
                Player 4
            </text>
            <text x="{$player5x}" y="{$player5y + $radiusPlayer + $zeilenAbstand}" font-family="Arial" font-size="{$spielerNamenTextSize}" fill="white" text-anchor="middle">
                Player 5
            </text>

            <!-- SpielerCash -->
            <text x="{$player1x}" y="{$player1y + $radiusPlayer + ($zeilenAbstand * 2)}" font-family="Arial" font-size="{$spielerNamenTextSize}" fill="white" text-anchor="middle">
                1548
            </text>
            <text x="{$player2x}" y="{$player2y + $radiusPlayer + ($zeilenAbstand * 2)}" font-family="Arial" font-size="{$spielerNamenTextSize}" fill="white" text-anchor="middle">
                2564
            </text>
            <text x="{$player3x}" y="{$player3y + $radiusPlayer + ($zeilenAbstand * 2)}" font-family="Arial" font-size="{$spielerNamenTextSize}" fill="white" text-anchor="middle">
                2634831
            </text>
            <text x="{$player4x}" y="{$player4y + $radiusPlayer + ($zeilenAbstand * 2)}" font-family="Arial" font-size="{$spielerNamenTextSize}" fill="white" text-anchor="middle">
                14
            </text>
            <text x="{$player5x}" y="{$player5y + $radiusPlayer + ($zeilenAbstand * 2)}" font-family="Arial" font-size="{$spielerNamenTextSize}" fill="white" text-anchor="middle">
                125
            </text>

            <!-- Tischtexte -->
            <text x="600" y="300" font-family="Algerian" font-size="30" fill="black" stroke-opacity="80">
                BLACKJACK PAYS 3 TO 2
            </text>
            <text x="700" y="350" font-family="Arial" font-size="15" fill="black">
                Insurance Pays 2 to 1
            </text>


            <!-- UI-->
            <circle cx ="{$button1x}" cy="{$buttonsy}" r="{$radiusButtons}" fill="{$farbeButton1}"/>
            <circle cx="{$button2x}" cy="{$buttonsy}" r="{$radiusButtons}" fill="{$farbeButton2}"/>
            <circle cx="{$button3x}" cy="{$buttonsy}" r="{$radiusButtons}" fill="{$farbeButton3}"/>
            <circle cx="{$button4x}" cy="{$buttonsy}" r="{$radiusButtons}" fill="{$farbeButton4}"/>

            <text x="{$button1x}" y="{$buttonsy + ($buttonTextSize div 2)}" font-family="Arial" font-size="{$buttonTextSize}" fill="black" text-anchor="middle">
                Hit
            </text>
            <text x="{$button2x}" y="{$buttonsy + ($buttonTextSize div 2)}" font-family="Arial" font-size="{$buttonTextSize}" fill="black" text-anchor="middle">
                Stand
            </text>
            <text x="{$button3x}" y="{$buttonsy + ($buttonTextSize div 2)}" font-family="Arial" font-size="{$buttonTextSize}" fill="black" text-anchor="middle">
                Double
            </text>
            <text x="{$button4x}" y="{$buttonsy + ($buttonTextSize div 2)}" font-family="Arial" font-size="{$buttonTextSize}" fill="black" text-anchor="middle">
                Insurance
            </text>

            <!-- Chips
            <circle cx ="{$chip1x}" cy="{$chipsy}" r="{$radiusChips}" fill="{$farbeInaktiv}"/>
            <circle cx="{$chip2x}" cy="{$chipsy}" r="{$radiusChips}" fill="{$farbeInaktiv}"/>
            <circle cx="{$chip3x}" cy="{$chipsy}" r="{$radiusChips}" fill="{$farbeInaktiv}"/>
            <circle cx="{$chip4x}" cy="{$chipsy}" r="{$radiusChips}" fill="{$farbeInaktiv}"/>

            <text x="{$chip1x}" y="{$chipsy + ($chipsTextSize div 2)}" font-family="Arial" font-size="{$chipsTextSize}" fill="black" text-anchor="middle">
                1
            </text>
            <text x="{$chip2x}" y="{$chipsy + ($chipsTextSize div 2)}" font-family="Arial" font-size="{$chipsTextSize}" fill="black" text-anchor="middle">
                5
            </text>
            <text x="{$chip3x}" y="{$chipsy + ($chipsTextSize div 2)}" font-family="Arial" font-size="{$chipsTextSize}" fill="black" text-anchor="middle">
                50
            </text>
            <text x="{$chip4x}" y="{$chipsy + ($chipsTextSize div 2)}" font-family="Arial" font-size="{$chipsTextSize}" fill="black" text-anchor="middle">
                500
            </text> -->

            <xsl:variable name="Color" select="card/color"></xsl:variable>
            <xsl:variable name="value" select="card/value"></xsl:variable>
                <g alignment-baseline="baseline" />

                <rect height="{$cardHeight}" width="{$cardWidth}" x="{$karteX}" y="{$karteY}" rx="5" ry="5" style="fill:white;stroke:black;stroke-width:2;opacity:1.0" />
                <xsl:choose>

                    <!-- Spezial cardn Sonderfälle-->
                    <xsl:when test="$value = 'K'">
                        <xsl:choose>
                            <xsl:when test="$Color = 'Spade'">
                                <use href="#Spade-K" />
                            </xsl:when>
                            <xsl:when test="$Color = 'Heart'">
                                <use href="#Heart-K" />
                            </xsl:when>
                            <xsl:when test="$Color = 'Diamond'">
                                <use href="#Diamond-K" />
                            </xsl:when>
                            <xsl:when test="$Color = 'Club'">
                                <use href="#Club-K" />
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$value = 'Q'">
                        <xsl:choose>
                            <xsl:when test="$Color = 'Spade'">
                                <use href="#Spade-Q" />
                            </xsl:when>
                            <xsl:when test="$Color = 'Heart'">
                                <use href="#Heart-Q" />
                            </xsl:when>
                            <xsl:when test="$Color = 'Diamond'">
                                <use href="#Diamond-Q" />
                            </xsl:when>
                            <xsl:when test="$Color = 'Club'">
                                <use href="#Club-Q" />
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$value = 'B'">
                        <xsl:choose>
                            <xsl:when test="$Color = 'Spade'">
                                <use href="#Spade-B" />
                            </xsl:when>
                            <xsl:when test="$Color = 'Heart'">
                                <use href="#Heart-B" />
                            </xsl:when>
                            <xsl:when test="$Color = 'Diamond'">
                                <use href="#Diamond-B" />
                            </xsl:when>
                            <xsl:when test="$Color = 'Club'">
                                <use href="#Club-B" />
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>

                    <!-- Symbole und reguläre Zahlen, die aus der XML Datei entnommen werden -->
                    <xsl:when test="$Color = 'Spade'">

                        <g>
                            <text id="kar" x="{$valueXMini}" y="{$valueYMini}" font-size="{$sizeValue}" fill="black" text-anchor="middle">
                                <xsl:value-of select="card/value"></xsl:value-of>
                            </text>
                            <text id="kar_usd" transform="rotate(180,{$valueXMini - ($valueXMini div 2) + $xMiniAdd},{$valueYMini - ($valueYMini div 2)+$yMiniValueAddUsd})" font-size="{$sizeValue}" fill="black" text-anchor="middle">
                                <xsl:value-of select="card/value"></xsl:value-of>
                            </text>
                            <use xlink:href="#Spade-{$value}" />
                            <text id="Spade_symbol" x="{$symbolXMini}" y="{$symbolYMini}" font-size="{$sizeSmallSymbol}" fill="black" text-anchor="middle">♠</text>
                            <text id="Spade_symbol_usd" transform="rotate(180,{$symbolXMini - ($symbolXMini div 2)+ $xMiniAdd},{$symbolYMini - ($symbolYMini div 2)+$yMiniSymbolAddUsd})" font-size="{$sizeSmallSymbol}" fill="black" text-anchor="middle">♠</text>
                        </g>

                    </xsl:when>
                    <xsl:when test="$Color = 'Club'">
                        <g>
                            <text id="kar" x="{$valueXMini}" y="{$valueYMini}" font-size="{$sizeValue}" fill="black" text-anchor="middle">
                                <xsl:value-of select="card/value"></xsl:value-of>
                            </text>
                            <text id="kar_usd" transform="rotate(180,{$valueXMini - ($valueXMini div 2) + $xMiniAdd},{$valueYMini - ($valueYMini div 2)+$yMiniValueAddUsd})" font-size="{$sizeValue}" fill="black" text-anchor="middle">
                                <xsl:value-of select="card/value"></xsl:value-of>
                            </text>
                            <use xlink:href="#Club-{$value}" />
                            <text id="Club_symbol" x="{$symbolXMini}" y="{$symbolYMini}" font-size="{$sizeSmallSymbol}" fill="black" text-anchor="middle">♣</text>
                            <text id="Club_symbol_usd" transform="rotate(180,{$symbolXMini - ($symbolXMini div 2)+ $xMiniAdd},{$symbolYMini - ($symbolYMini div 2)+$yMiniSymbolAddUsd})" font-size="{$sizeSmallSymbol}" fill="black" text-anchor="middle">♣</text>
                        </g>
                    </xsl:when>
                    <xsl:when test="$Color = 'Heart'">
                        <g>
                            <text id="kar" x="{$valueXMini}" y="{$valueYMini}" font-size="{$sizeValue}" fill="red" text-anchor="middle">
                                <xsl:value-of select="card/value"></xsl:value-of>
                            </text>
                            <text id="kar_usd" transform="rotate(180,{$valueXMini - ($valueXMini div 2) + $xMiniAdd},{$valueYMini - ($valueYMini div 2)+$yMiniValueAddUsd})" font-size="{$sizeValue}" fill="red" text-anchor="middle">
                                <xsl:value-of select="card/value"></xsl:value-of>
                            </text>
                            <use xlink:href="#Heart-{$value}" />
                            <text id="Heart_symbol" x="{$symbolXMini}" y="{$symbolYMini}" font-size="{$sizeSmallSymbol}" fill="red" text-anchor="middle">♥</text>
                            <text id="Heart_symbol_usd" transform="rotate(180,{$symbolXMini - ($symbolXMini div 2)+ $xMiniAdd},{$symbolYMini - ($symbolYMini div 2)+$yMiniSymbolAddUsd})" font-size="{$sizeSmallSymbol}" fill="red" text-anchor="middle">♥</text>
                        </g>
                    </xsl:when>
                    <xsl:when test="$Color = 'Diamond'">
                        <g>
                            <text id="kar" x="{$valueXMini}" y="{$valueYMini}" font-size="{$sizeValue}" fill="red" text-anchor="middle">
                                <xsl:value-of select="card/value"></xsl:value-of>
                            </text>
                            <text id="kar_usd" transform="rotate(180,{$valueXMini - ($valueXMini div 2) + $xMiniAdd},{$valueYMini - ($valueYMini div 2)+$yMiniValueAddUsd})" font-size="{$sizeValue}" fill="red" text-anchor="middle">
                                <xsl:value-of select="card/value"></xsl:value-of>
                            </text>
                            <use xlink:href="#Diamond-{$value}" />
                            <text id="Diamond_symbol" x="{$symbolXMini}" y="{$symbolYMini}" font-size="{$sizeSmallSymbol}" fill="red" text-anchor="middle">♦</text>
                            <text id="Diamond_symbol_usd" transform="rotate(180,{$symbolXMini - ($symbolXMini div 2)+ $xMiniAdd},{$symbolYMini - ($symbolYMini div 2)+$yMiniSymbolAddUsd})" font-size="{$sizeSmallSymbol}" fill="red" text-anchor="middle">♦</text>
                        </g>
                    </xsl:when>
                </xsl:choose>


                <!-- SVG Definitionen um Redundanz zu vermeiden -->
                <defs>
                    <g id="CardTemplate">
                        <rect height="{$cardHeight}" width="{$cardWidth}" x="{$karteX}" y="{$karteY}" rx="5" ry="5" style="fill:white;stroke:black;stroke-width:2;opacity:1.0" />
                    </g>
                </defs>
                <defs>
                    <g id="Diamond-K">
                        <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/0/06/KD.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                    </g>
                </defs>

                <defs>
                    <g id="Diamond-Q">

                        <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/6/63/QD.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                    </g>
                </defs>
                <defs>
                    <g id="Diamond-B">
                        <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/3/33/JD.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                    </g>
                </defs>
                <defs>
                    <g id="Heart-K">
                        <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/e/e5/KH.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                    </g>
                </defs>

                <defs>
                    <g id="Heart-Q">
                        <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/d/d2/QH.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                    </g>
                </defs>

                <defs>
                    <g id="Heart-B">
                        <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/1/15/JH.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                    </g>
                </defs>
                <defs>
                    <g id="Club-K">
                        <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/e/e1/KC.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                    </g>
                </defs>

                <defs>
                    <g id="Club-Q">
                        <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/9/9e/QC.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                    </g>
                </defs>

                <defs>
                    <g id="Club-B">
                        <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/1/11/JC.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                    </g>
                </defs>
                <defs>
                    <g id="Spade-K">
                        <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/5/5c/KS.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                    </g>
                </defs>

                <defs>
                    <g id="Spade-Q">
                        <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/3/35/QS.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                    </g>
                </defs>

                <defs>
                    <g id="Spade-B">
                        <image xlink:href="https://upload.wikimedia.org/wikipedia/commons/d/d9/JS.svg" width="{$cardWidth}" height="{$cardHeight}" x="{$karteX}" y="{$karteY}" />
                    </g>
                </defs>

                <!-- alle Spades -->
                <defs>
                    <g id="Spade-A">
                        <text x="{$xCardMid}" y="{$yAceSymbol}" font-size="{$sizeAceSymbol}" fill="black" text-anchor="middle">♠</text>
                    </g>

                </defs>

                <defs>
                    <g id="Spade-2">
                        <text id="Spade_symbol_big" x="{$xCardMid}" y="{$yBigSymbolTop}" font-size="{$sizeBigSymbol}" fill="black" text-anchor="middle">♠</text>
                        <!-- Das Symbol an der Y achse spiegeln -->
                        <text id="Spade_symbol_big_usd" transform="rotate(180,{$jetztX - ($jetztX div 2)},{$jetztY - ($jetztY div 2)+$yBigSymbolUsdBotAdd})" font-size="{$sizeBigSymbol}" fill="black" text-anchor="middle">♠</text>
                    </g>

                </defs>

                <defs>
                    <g id="Spade-3">
                        <use xlink:href="#Spade-2" />
                        <use xlink:href="#Spade_symbol_big" x="0" y="{$yBigSymbolTopToMid}"/>
                    </g>
                </defs>

                <defs>
                    <g id="Spade-4">
                        <use xlink:href="#Spade-2" transform="translate(-{$xBigSymbolMidToEdge}, 0)" />
                        <use xlink:href="#Spade-2" transform="translate({$xBigSymbolMidToEdge}, 0)" />
                    </g>
                </defs>

                <defs>
                    <g id="Spade-5">
                        <use xlink:href="#Spade-4" />
                        <use xlink:href="#Spade_symbol_big" x="0" y="{$yBigSymbolTopToMid}"/>
                    </g>
                </defs>
                <defs>
                    <g id="Spade-6">
                        <use xlink:href="#Spade-3" transform="translate(-{$xBigSymbolMidToEdge},0)" />
                        <use xlink:href="#Spade-3" transform="translate({$xBigSymbolMidToEdge},0)" />
                    </g>
                </defs>
                <defs>
                    <g id="Spade-7">
                        <use xlink:href="#Spade-6" />
                        <use xlink:href="#Spade_symbol_big" x="0" y="{$yBigSymbolTopToMid div 2}" />
                    </g>
                </defs>
                <defs>
                    <g id="Spade-8">
                        <use xlink:href="#Spade-7" />
                        <use xlink:href="#Spade_symbol_big_usd" x="0" y="-{$yBigSymbolTopToMid div 2}"/>
                    </g>
                </defs>
                <defs>
                    <g id="Spade-9">
                        <use xlink:href="#Spade-5" />
                        <g id="Spade_Doppel">
                            <g id="Spade_Einzel">
                                <use xlink:href="#Spade_symbol_big" x="-{$xBigSymbolMidToEdge}" y="{$yBigSymbolNineSide}" />
                                <use xlink:href="#Spade_symbol_big_usd" x="-{$xBigSymbolMidToEdge}" y="-{$yBigSymbolNineSide}"/>
                            </g>
                            <use xlink:href="#Spade_Einzel" transform="translate({($xBigSymbolMidToEdge *2)},0)"/>
                        </g>
                    </g>
                </defs>
                <defs>
                    <g id="Spade-10">
                        <use xlink:href="#Spade-4" />
                        <use xlink:href="#Spade_Doppel"/>
                        <use xlink:href="#Spade_symbol_big" x="0" y="{$yBigSymbolTenMid}"/>
                        <use xlink:href="#Spade_symbol_big_usd" x="0" y="-{$yBigSymbolTenMid}"/>
                    </g>
                </defs>

                <!-- alle Clube -->
                <defs>
                    <g id="Club-A">
                        <text x="{$xCardMid}" y="{$yAceSymbol}" font-size="{$sizeAceSymbol}" fill="black" text-anchor="middle">♣</text>
                    </g>

                </defs>
                <defs>
                    <g id="Club-2">
                        <text id="Club_symbol_big" x="{$xCardMid}" y="{$yBigSymbolTop}" font-size="{$sizeBigSymbol}" fill="black" text-anchor="middle">♣</text>
                        <!-- Das Symbol an der Y achse spiegeln -->
                        <text id="Club_symbol_big_usd" transform="rotate(180,{$jetztX - ($jetztX div 2)},{$jetztY - ($jetztY div 2)+$yBigSymbolUsdBotAdd})" font-size="{$sizeBigSymbol}" fill="black" text-anchor="middle">♣</text>
                    </g>

                </defs>

                <defs>
                    <g id="Club-3">
                        <use xlink:href="#Club-2" />
                        <use xlink:href="#Club_symbol_big" x="0" y="{$yBigSymbolTopToMid}"/>
                    </g>
                </defs>

                <defs>
                    <g id="Club-4">
                        <use xlink:href="#Club-2" transform="translate(-{$xBigSymbolMidToEdge}, 0)" />
                        <use xlink:href="#Club-2" transform="translate({$xBigSymbolMidToEdge}, 0)" />
                    </g>
                </defs>

                <defs>
                    <g id="Club-5">
                        <use xlink:href="#Club-4" />
                        <use xlink:href="#Club_symbol_big" x="0" y="{$yBigSymbolTopToMid}"/>
                    </g>
                </defs>
                <defs>
                    <g id="Club-6">
                        <use xlink:href="#Club-3" transform="translate(-{$xBigSymbolMidToEdge},0)" />
                        <use xlink:href="#Club-3" transform="translate({$xBigSymbolMidToEdge},0)" />
                    </g>
                </defs>
                <defs>
                    <g id="Club-7">
                        <use xlink:href="#Club-6" />
                        <use xlink:href="#Club_symbol_big" x="0" y="{$yBigSymbolTopToMid div 2}" />
                    </g>
                </defs>
                <defs>
                    <g id="Club-8">
                        <use xlink:href="#Club-7" />
                        <use xlink:href="#Club_symbol_big_usd" x="0" y="-{$yBigSymbolTopToMid div 2}"/>
                    </g>
                </defs>
                <defs>
                    <g id="Club-9">
                        <use xlink:href="#Club-5" />
                        <g id="Club_Doppel">
                            <g id="Club_Einzel">
                                <use xlink:href="#Club_symbol_big" x="-{$xBigSymbolMidToEdge}" y="{$yBigSymbolNineSide}" />
                                <use xlink:href="#Club_symbol_big_usd" x="-{$xBigSymbolMidToEdge}" y="-{$yBigSymbolNineSide}"/>
                            </g>
                            <use xlink:href="#Club_Einzel" transform="translate({($xBigSymbolMidToEdge *2)},0)"/>
                        </g>
                    </g>
                </defs>
                <defs>
                    <g id="Club-10">
                        <use xlink:href="#Club-4" />
                        <use xlink:href="#Club_Doppel"/>
                        <use xlink:href="#Club_symbol_big" x="0" y="{$yBigSymbolTenMid}"/>
                        <use xlink:href="#Club_symbol_big_usd" x="0" y="-{$yBigSymbolTenMid}"/>
                    </g>
                </defs>

                <!-- alle Hearten -->

                <defs>
                    <g id="Heart-A">
                        <text x="{$xCardMid}" y="{$yAceSymbol}" font-size="{$sizeAceSymbol}" fill="red" text-anchor="middle">♥</text>
                    </g>

                </defs>
                <defs>
                    <g id="Heart-2">
                        <text id="Heart_symbol_big" x="{$xCardMid}" y="{$yBigSymbolTop}" font-size="{$sizeBigSymbol}" fill="red" text-anchor="middle">♥</text>
                        <!-- Das Symbol an der Y achse spiegeln -->
                        <text id="Heart_symbol_big_usd" transform="rotate(180,{$jetztX - ($jetztX div 2)},{$jetztY - ($jetztY div 2)+$yBigSymbolUsdBotAdd})" font-size="{$sizeBigSymbol}" fill="red" text-anchor="middle">♥</text>
                    </g>

                </defs>

                <defs>
                    <g id="Heart-3">
                        <use xlink:href="#Heart-2" />
                        <use xlink:href="#Heart_symbol_big" x="0" y="{$yBigSymbolTopToMid}"/>
                    </g>
                </defs>

                <defs>
                    <g id="Heart-4">
                        <use xlink:href="#Heart-2" transform="translate(-{$xBigSymbolMidToEdge}, 0)" />
                        <use xlink:href="#Heart-2" transform="translate({$xBigSymbolMidToEdge}, 0)" />
                    </g>
                </defs>

                <defs>
                    <g id="Heart-5">
                        <use xlink:href="#Heart-4" />
                        <use xlink:href="#Heart_symbol_big" x="0" y="{$yBigSymbolTopToMid}"/>
                    </g>
                </defs>
                <defs>
                    <g id="Heart-6">
                        <use xlink:href="#Heart-3" transform="translate(-{$xBigSymbolMidToEdge},0)" />
                        <use xlink:href="#Heart-3" transform="translate({$xBigSymbolMidToEdge},0)" />
                    </g>
                </defs>
                <defs>
                    <g id="Heart-7">
                        <use xlink:href="#Heart-6" />
                        <use xlink:href="#Heart_symbol_big" x="0" y="{$yBigSymbolTopToMid div 2}" />
                    </g>
                </defs>
                <defs>
                    <g id="Heart-8">
                        <use xlink:href="#Heart-7" />
                        <use xlink:href="#Heart_symbol_big_usd" x="0" y="-{$yBigSymbolTopToMid div 2}"/>
                    </g>
                </defs>
                <defs>
                    <g id="Heart-9">
                        <use xlink:href="#Heart-5" />
                        <g id="Heart_Doppel">
                            <g id="Heart_Einzel">
                                <use xlink:href="#Heart_symbol_big" x="-{$xBigSymbolMidToEdge}" y="{$yBigSymbolNineSide}" />
                                <use xlink:href="#Heart_symbol_big_usd" x="-{$xBigSymbolMidToEdge}" y="-{$yBigSymbolNineSide}"/>
                            </g>
                            <use xlink:href="#Heart_Einzel" transform="translate({($xBigSymbolMidToEdge *2)},0)"/>
                        </g>
                    </g>
                </defs>
                <defs>
                    <g id="Heart-10">
                        <use xlink:href="#Heart-4" />
                        <use xlink:href="#Heart_Doppel"/>
                        <use xlink:href="#Heart_symbol_big" x="0" y="{$yBigSymbolTenMid}"/>
                        <use xlink:href="#Heart_symbol_big_usd" x="0" y="-{$yBigSymbolTenMid}"/>
                    </g>
                </defs>

                <!-- alle Diamond -->
                <defs>
                    <g id="Diamond-A">
                        <text x="{$xCardMid}" y="{$yAceSymbol}" font-size="{$sizeAceSymbol}" fill="red" text-anchor="middle">♦</text>
                    </g>

                </defs>
                <defs>
                    <g id="Diamond-2">
                        <text id="Diamond_symbol_big" x="{$xCardMid}" y="{$yBigSymbolTop}" font-size="{$sizeBigSymbol}" fill="red" text-anchor="middle">♦</text>
                        <!-- Das Symbol an der Y achse spiegeln -->
                        <text id="Diamond_symbol_big_usd" transform="rotate(180,{$jetztX - ($jetztX div 2)},{$jetztY - ($jetztY div 2)+$yBigSymbolUsdBotAdd})" font-size="{$sizeBigSymbol}" fill="red" text-anchor="middle">♦</text>
                    </g>

                </defs>

                <defs>
                    <g id="Diamond-3">
                        <use xlink:href="#Diamond-2" />
                        <use xlink:href="#Diamond_symbol_big" x="0" y="{$yBigSymbolTopToMid}"/>
                    </g>
                </defs>

                <defs>
                    <g id="Diamond-4">
                        <use xlink:href="#Diamond-2" transform="translate(-{$xBigSymbolMidToEdge}, 0)" />
                        <use xlink:href="#Diamond-2" transform="translate({$xBigSymbolMidToEdge}, 0)" />
                    </g>
                </defs>

                <defs>
                    <g id="Diamond-5">
                        <use xlink:href="#Diamond-4" />
                        <use xlink:href="#Diamond_symbol_big" x="0" y="{$yBigSymbolTopToMid}"/>
                    </g>
                </defs>
                <defs>
                    <g id="Diamond-6">
                        <use xlink:href="#Diamond-3" transform="translate(-{$xBigSymbolMidToEdge},0)" />
                        <use xlink:href="#Diamond-3" transform="translate({$xBigSymbolMidToEdge},0)" />
                    </g>
                </defs>
                <defs>
                    <g id="Diamond-7">
                        <use xlink:href="#Diamond-6" />
                        <use xlink:href="#Diamond_symbol_big" x="0" y="{$yBigSymbolTopToMid div 2}" />
                    </g>
                </defs>
                <defs>
                    <g id="Diamond-8">
                        <use xlink:href="#Diamond-7" />
                        <use xlink:href="#Diamond_symbol_big_usd" x="0" y="-{$yBigSymbolTopToMid div 2}"/>
                    </g>
                </defs>
                <defs>
                    <g id="Diamond-9">
                        <use xlink:href="#Diamond-5" />
                        <g id="Diamond_Doppel">
                            <g id="Diamond_Einzel">
                                <use xlink:href="#Diamond_symbol_big" x="-{$xBigSymbolMidToEdge}" y="{$yBigSymbolNineSide}" />
                                <use xlink:href="#Diamond_symbol_big_usd" x="-{$xBigSymbolMidToEdge}" y="-{$yBigSymbolNineSide}"/>
                            </g>
                            <use xlink:href="#Diamond_Einzel" transform="translate({($xBigSymbolMidToEdge *2)},0)"/>
                        </g>
                    </g>
                </defs>
                <defs>
                    <g id="Diamond-10">
                        <use xlink:href="#Diamond-4" />
                        <use xlink:href="#Diamond_Doppel"/>
                        <use xlink:href="#Diamond_symbol_big" x="0" y="{$yBigSymbolTenMid}"/>
                        <use xlink:href="#Diamond_symbol_big_usd" x="0" y="-{$yBigSymbolTenMid}"/>
                    </g>
                </defs>



    </svg>

    </xsl:template>
</xsl:stylesheet>