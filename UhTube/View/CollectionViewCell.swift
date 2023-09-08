//
//  MainPageCollectionViewCell.swift
//  UhTube
//
//  Created by 이수현 on 2023/09/08.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var youTubeImage: UIImageView!
    
    @IBOutlet weak var youTubeLavel: UILabel!
    
    
    func CollectionViewCellSetup(with feedElement: String) {
        youTubeImage.loadImage(url: feedElement)
    }
    
    func LavelSetup(with labe: String) {
        youTubeLavel.text = labe
    }
    
    
    var imageName : String = ""{
        didSet{
            print("CollectionViewCell imageName - didSet() : \(imageName)")
            // 셀의 UI 설정
            self.youTubeImage.image = UIImage(systemName: imageName)
            // 라벨 설정
            self.youTubeLavel.text = imageName

        }
    }
}
