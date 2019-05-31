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

    struct Achiv :Decodable{
        var name: String
        var stars: Int
        var value: Int
        var target: Int
        var info: String
    }

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





