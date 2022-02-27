//
//  DetailViewController.swift
//  MovieApp
//
//  Created by Chu Yu Min on 2022/02/27.
//

import UIKit
import AVKit //video가 나오게 하기 위함

class DetailViewController: UIViewController {

    var movieResult: MovieResult?
    var videoPlayer: AVPlayer?
    var videoIsNotPlayed: Bool = false //false = 플레이, true = 멈춤
    
    @IBOutlet weak var movieContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        }
    }
    @IBOutlet weak var descirptionLabel: UILabel! {
        didSet {
            descirptionLabel.font = .systemFont(ofSize: 16, weight: .light)
        }
    }
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //viewDidLoad()에서는 작업창(storyboard)의 크기는 가져오지만 실제 디바이스의 크기와 위치를 아직 가져오지 못한 상태이다..
        if let hasURL = movieResult?.previewUrl {
            self.makeVideoPlayerAndPlay(urlString: hasURL)
        }
    }
    
    private func setViews() {
        titleLabel.text = movieResult?.trackName
        descirptionLabel.text = movieResult?.longDescription
    }
    
    //MARK: player를 만들고 movieContainer에 올림
    private func makeVideoPlayerAndPlay(urlString: String) {
        
        if let url = URL(string: urlString) {
            
            self.videoPlayer = AVPlayer(url: url)
            let playerLayer = AVPlayerLayer(player: videoPlayer) //player 틀을 갖고 있음
            movieContainer.layer.addSublayer(playerLayer) //playerLayer는 CALayer 타입이다
            
            playerLayer.frame = movieContainer.bounds //size 맞추기
            self.videoPlayer?.play()
        }
        
    }
    
    @IBAction func playButtonDidTapped(_ sender: Any) {
        self.videoIsNotPlayed = !self.videoIsNotPlayed
        if self.videoIsNotPlayed == true {
            self.videoPlayer?.pause()
            playButton.setTitle("Play", for: .normal)
            
        }
        else {
            self.videoPlayer?.play()
            playButton.setTitle("Stop", for: .normal)
            
        }
        
    }
    
}
