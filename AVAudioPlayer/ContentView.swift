//
//  ContentView.swift
//  AVAudioPlayer
//
//  Created by ramil on 21.10.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @State var time: CGFloat = 0
    @State var player: AVAudioPlayer!
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading, content: {
                
            
                Capsule()
                    .fill(Color.gray)
                    .frame(height: 8)
                    .padding(10)
                
                Capsule()
                    .fill(Color.orange).frame(width: time, height: 8)
                    .padding(10)
            })
            
            Button(action: {
                
                self.player.play()
                
                DispatchQueue.global(qos: .background).async {
                    
                    while true {
                        let screenWidth = UIScreen.main.bounds.width - 20
                        
                        let currenttime = self.player.currentTime / self.player.duration
                        
                        let timeForLabel = CGFloat(currenttime) * screenWidth
                        
                        self.time = timeForLabel
                        
                        //print(currenttime)
                    }
                }
                
            }) {
                Text("Play")
            }
            
        }.onAppear() {
            let url = Bundle.main.path(forResource: "audio", ofType: "mp3")
            
            self.player = try! AVAudioPlayer(contentsOf:  URL(fileURLWithPath: url!))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
