//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//-------------------------------------------------Protocolo y delegado-------------------------------------------------------
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

//: Playground - noun: a place where people can play

import Foundation
class Button
{
    let title: String
    init(title:String)
    {
        self.title = title
    }
    func tapped()
    {
        print(self.title)
        // Codigo cuando esto pase
    }
}
protocol ButtonDelegate
{
    func userTappedButton (_ button: Button)
}

class Song {
    var title:String
    init(title:String){
        self.title = title
    }
}

class MusicController
{
    func playSong(_ song: Song)
    {
        print("Now playing \(song.title)")
    }
    func pauseSong()
    {
        print("Paused current song.")
    }
}

let playlist: [Song] = [Song(title: "Get Me"), Song(title: "Come to me"), Song(title: "Let it be")]

let musicController = MusicController()
// playlist[0]
let startMusicButton = Button(title: "Play")
let pauseMusicButton = Button(title: "Pause")
startMusicButton.tapped()
pauseMusicButton.tapped()

//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

class MusicController: ButtonDelegate
{
    func userTappedButton(_ button: Button)
    {
        if butt.title == "Play"
        {
            playSong(playlist.first!)
        }
        else if button.title == "Pause"
        {
            pauseSong()
        }
    }    
}

//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

func tapped()
    {
    self.delegate?.userTappedButton(self)
    }
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//[......................................................Enlazar.............................................................]
startMusicButton.delegate = musicController()
pauseMusicButton.delegate = musicController()
