//
//  ContentView.swift
//  5.1 KingTicTacToe
//
//  Created by Alun King on 30/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameManager = GameManager()
    var body: some View {
        VStack{
            Text(gameManager.nextPlayer)
        
            VStack (spacing: -2.0){
            
                ForEach(0 ..< 3) { rowNo in
                    HStack (spacing: -2.0){
                        ForEach((rowNo*3) ..< (rowNo*3+3)) { gridId in
                        
                            Button
                                {
                                    if(gameManager.board[gridId] == 0){
                                        gameManager.board[gridId]=gameManager.nextTurn
                                    }
                            
                                }label:{Image(String(gameManager.board[gridId]))}.frame(width:100.0,height:100.0).border(Color.black, width:2).disabled(!gameManager.isGameActive)
                        }
                    }
                }
            }.padding()
            Button("reset"){
                gameManager.reset()
            }.disabled(gameManager.isGameActive)
        }
        
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
