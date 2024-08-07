//
//  ViewController.swift
//  apply_pattern
//
//  Created by Moonbeom KWON on 2023/11/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var actionButton: UIButton!

    var state: State?

    var imageURL: URL? {
        return URL(string: "https://letswift.kr/2023/images/speakers/KwonMunbum.jpg")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let presentor = Presentor(timeLabel: self.timeLabel, actionButton: self.actionButton)
        self.state = InitState(presentor: presentor)

        Task { @MainActor in
            await self.loadImage()
        }
    }
}

extension ViewController {
    private func loadImage() async {
        guard let imageURL = self.imageURL else { return }
        await URLRequest(url: imageURL)
            .loadData()
            .flatMap(UIImage.makeImage(fromData:))
            .fold(success: {
                self.imageView.image = $0
            }, failure: {
                print($0.localizedDescription)
            })
    }
}

extension ViewController {
    @IBAction private func touchTestButton() {
        autoreleasepool {
            for i in 0...10_000_000 {
                autoreleasepool {
                    let string = "\(i)"
                    self.timeLabel.text = string
                }
            }
        }
    }

    @IBAction private func touchActionButton() {
        self.state = self.state?.nextState
        self.state?.updateUI()
    }
}

