//
//  Election.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 24.09.2021.
//

import UIKit

class Election {
    let cats: [Cat]
    private var votings: [Int]
    let dateStart: Date
    let dateStop: Date
    private var winner: Cat!
    
    init(cats: [Cat],
         dateStart: Date
    ) {
        self.cats = cats
        self.votings = Array(
            repeating: 0,
            count: cats.count)
        self.dateStart = dateStart
        self.dateStop = Date(
            timeInterval: 259200,
            since: self.dateStart)
    }
    
    func calculateWinner() {

    }
    
    func getWinner() -> Cat? {
        guard let winner = self.winner else { return nil }
        return winner
    }
    
    func votingCount(cat: Cat) -> Int? {
        for (index, value) in cats.enumerated() {
            if value === cat {
                return self.votings[index]
            }
        }
        return nil
    }
    
    func makeVote(cat: Cat) {
        for (index, value) in cats.enumerated() {
            if value === cat {
               self.votings[index] += 1
            }
        }
    }
}
