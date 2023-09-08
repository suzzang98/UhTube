//
//  DetailPageViewController.swift
//  UhTube
//
//  Created by 이수현 on 2023/09/04.
//

import UIKit

class DetailPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        detailTitleLabel.text = json2?.items[selectNum].snippet.title
        // Do any additional setup after loading the view.
        detaildecText.text = json2?.items[selectNum].snippet.description
        getVideo()
    }
    
    @IBOutlet weak var detaildecText: UITextView!
    @IBOutlet weak var videoView: UIWebView!
    @IBOutlet weak var detailTitleLabel: UILabel!
  
    @IBAction func detailBackbutton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    func getVideo(){
        guard let url = URL(string: "https://www.youtube.com/embed/\((json2?.items[selectNum].id.videoId)!)") else { return  }
        videoView.loadRequest(URLRequest(url: url))
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
