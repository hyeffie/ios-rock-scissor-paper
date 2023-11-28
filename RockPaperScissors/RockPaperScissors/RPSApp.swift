//
//  RPSApp.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

struct RPSApp {
    private let io: IO
    
    init(io: IO) {
        self.io = io
    }
    
    func run() {
        do {
            let turn = try RPSGame(io: self.io).play()
            var mjbGame = MJBGame(io: self.io, turn: turn)
            try mjbGame.play()
        } catch RPSError.userWantsToExit {
            io.printOutput("게임 종료")
        } catch { return }
    }
}
