//
//  GameManager.swift
//  5.1 KingTicTacToe
//
//  Created by Alun King on 30/01/2023.
//

import Foundation

public let nought:Int = -1
public let cross:Int = 1



class GameManager: ObservableObject{
    
    
    var nextTurn = nought
    @Published var nextPlayer: String = "O to play"
    @Published var isGameActive:Bool = true
    @Published var board: Array<Int> = [0,0,0,0,0,0,0,0,0]{
        didSet{
            print("clicked")
            nextTurn *= -1
            if nextTurn == nought {
                nextPlayer = "O to play"
            }else{
                nextPlayer = "X to play"
            }
            //check for winner
            let result = checkWinner()
            if(result != 0){
                isGameActive = false
                //end game, announce winner
                if(result == cross){
                    nextPlayer = "X wins!"
                }else{
                    nextPlayer = "O wins!"
                }
            }else{
                var total = 0
                var index:Int = 0
                while (index < board.count && total == 0){
                    if (board[index] == 0){
                        total += 1
                    }
                    index += 1
                }
                
                if (total == 0){
                    nextPlayer = "Draw!!"
                    isGameActive = false
                }
            }
        }
    }
    
    
    
    
    private let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    func checkWinner() -> Int{
        for combination in winningCombinations{
            if (board[combination[0]] != 0 && board[combination[0]] == board[combination[1]] && board[combination[0]] == board[combination[2]]){
                //winner!!
                return board[combination[0]]
            }
        }
        return 0
    }
    
    func reset(){
        board = [0,0,0,0,0,0,0,0,0]
        isGameActive = true
    }
    
    
    
}
