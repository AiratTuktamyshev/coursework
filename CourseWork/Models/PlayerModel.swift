//
//  PlayerModel.swift
//  CourseWork
//
//  Created by Айрат Туктамышев on 17/05/2019.
//  Copyright © 2019 Айрат Туктамышев. All rights reserved.
//

import UIKit



struct  PlayerS: Decodable {
    var tag:String
    var name:String
    var expLevel:Int
    var trophies:Int
    var arena: Arenas?//type own
    var bestTrophies: Int
    var wins: Int
    var losses: Int
    var battleCount: Int
    var threeCrownWins: Int
    var challengeCardsWon: Int
    var challengeMaxWins: Int
    var tournamentCardsWon: Int
    var tournamentBattleCount: Int
    var role: String?
    var donations: Int
    
    var clan:Clan?//OwnType
//    var leagueStatistics:League//own type
     var achievements:[Achiv]?//own type
     var cards:[PlayerCards]?//own type
     var currentFavouriteCard: CurrentFavourite?//own type
////
////    //дальше идут вложенные структуры
//
//
    struct  Arenas : Decodable {//owntype
        var id:Int
        var name:String
    }

    struct  Clan:Decodable {

        var tag:String
        var name:String
        var badgeId:Int
    }
//
////    struct League {
////        var currentSeason:CurrSeason//OWNS
////        var previousSeason:PrevSeason
////        var bestSeason:VstSeason
////
////    }
//
    struct Achiv :Decodable{
        var name: String
        var stars: Int
        var value: Int
        var target: Int
        var info: String
    }
//
//
    struct PlayerCards:Decodable
    {
        var name:String
        var count:Int
        var level:Int
        var maxLevel: Int
        var iconUrls:Medium


        struct Medium:Decodable {
        var medium:String
    }
    }


        struct CurrentFavourite:Decodable {
            var name:String
            var id:Int
            var maxLevel:Int
            var iconUrls:Medium

            struct Medium:Decodable {
                var medium:String
            }
        }
    
    
}



//    "tag": "#YYRU08PR",
//    "name": "Vlad",
//    "expLevel": 7,
//    "trophies": 2052,
//    "bestTrophies": 2076,
//    "wins": 291,
//    "losses": 286,
//    "battleCount": 633,
//    "threeCrownWins": 223,
//    "challengeCardsWon": 0,
//    "challengeMaxWins": 0,
//    "tournamentCardsWon": 0,
//    "tournamentBattleCount": 0,
//    "donations": 0,
//    "donationsReceived": 0,
//    "totalDonations": 625,
//    "warDayWins": 0,
//    "clanCardsCollected": 0,




    //официальный парсинг
//    {
//    "tag": "string",
//    "name": "string",
//    "expLevel": 0,
//    "trophies": 0,
//    "arena": {
//    "id": 0,
//    "name": "string"
//    },
//    "bestTrophies": 0,
//    "wins": 0,
//    "losses": 0,
//    "battleCount": 0,
//    "threeCrownWins": 0,
//    "challengeCardsWon": 0,
//    "challengeMaxWins": 0,
//    "tournamentCardsWon": 0,
//    "tournamentBattleCount": 0,
//    "role": "string",
//    "donations": 0,
//    "donationsReceived": 0,
//    "totalDonations": 0,
//    "warDayWins": 0,
//    "clanCardsCollected": 0,=======

//    "clan": {
//    "tag": "string",
//    "name": "string",
//    "badgeId": 0
//    },
//    "leagueStatistics": {
//    "currentSeason": {
//    "id": "string",
//    "trophies": 0,
//    "bestTrophies": 0
//    },
//    "previousSeason": {
//    "id": "string",
//    "trophies": 0,
//    "bestTrophies": 0
//    },
//    "bestSeason": {
//    "id": "string",
//    "trophies": 0,
//    "bestTrophies": 0
//    }
//    },

//================

//    "achievements": [
//    {
//    "name": "string",
//    "stars": 0,
//    "value": 0,
//    "target": 0,
//    "info": "string"
//    }
//    ],



//    "cards": [
//    {
//    "name": "string",
//    "level": 0,
//    "maxLevel": 0,
//    "count": 0,
//    "iconUrls": {
//    "medium": "string"
//    }
    //}
//    ],
//    "currentFavouriteCard": {
//    "name": "string",
//    "id": 0,
//    "maxLevel": 0,
//    "iconUrls": {
//    "medium": "string"
//    }
//    }
//    }


