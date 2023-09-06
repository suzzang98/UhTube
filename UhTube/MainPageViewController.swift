//
//  MainPageViewController.swift
//  UhTube
//
//  Created by 이수현 on 2023/09/04.
//

import UIKit
import Foundation





class MainPageViewController: UIViewController{
    
    

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //이미지 배열
    
    var uImage = [#imageLiteral(resourceName: "노마드코더3"), #imageLiteral(resourceName: "노마드코더9"), #imageLiteral(resourceName: "노마드코더1"), #imageLiteral(resourceName: "노마드코더4"), #imageLiteral(resourceName: "노마드코더2"), #imageLiteral(resourceName: "노마드코더7"), #imageLiteral(resourceName: "노마드코더8"), #imageLiteral(resourceName: "메모리저장소 구현")]
    
    fileprivate let systemimageNameArray = [
        "프로그래밍 혼자서 독학?", "채팅으로만 코딩한 결과", "프로그래밍 오해와 진실", "실수는 줄이고 빠르게 성장하는 방법", "코린이 시절 알았으면 좋았을 것들", "풀스택 개발자가 뭔가요?", "노마드코더 유용한 잡담들", "메모리저장소 구현"
    ]
    


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CollectionVC - ViewDidLoad() called")
        
        // 콜렉션뷰에 대한 설정
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        // 콜렉션뷰 레이아웃을 설정한다.
        self.collectionView.collectionViewLayout = createCompositionalLayout()
        
    }
}


// 콜렉션뷰 레이아웃 관련
extension MainPageViewController {
    // 콤포지셔널 레이아웃 설정
    fileprivate func createCompositionalLayout() -> UICollectionViewLayout {
        // 코포지셔널 레이아웃 생성
        let layout = UICollectionViewCompositionalLayout{
            
            // 만들게 되면 튜플형태로 들어옴
            (sectionInedex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) ->
            NSCollectionLayoutSection? in
            
            // 아이템에 대한 사이즈 - absolute 는 고정값, estimate 는 추측, fraction 은 퍼센트
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(130))
            
            // 위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // 아이템 간격설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 2, bottom: 2, trailing: 2)
            
            
            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: itemSize.heightDimension)
            
            // 그룹 사이즈로 그룹 만들기
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)

            
            // 섹션에 대한 간격
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            
            
            return section
        }
        return layout
    }
}



extension MainPageViewController: UICollectionViewDataSource{
   
    // 각 섹션에 들어가는 아이템 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.systemimageNameArray.count
    }
    
    // 각 콜렉션뷰셀에 대한 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellId = String(describing: CollectionViewCell.self)
        print("cellId : \(cellId)")
        
        // 셀 인스턴스
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
        
        
        
        cell.imageName = self.systemimageNameArray[indexPath.item]
        
//        cell.contentView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
//        cell.contentView.layer.cornerRadius = 4
//        cell.contentView.layer.borderWidth = 1
//        cell.contentView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
         
        cell.youTubeImage.image = uImage[indexPath.item]

        return cell
    }
}


extension MainPageViewController: UICollectionViewDelegate{
}













class CollectionViewCell: UICollectionViewCell{
    
    
    
    @IBOutlet weak var youTubeImage: UIImageView!
    
    @IBOutlet weak var youTubeLavel: UILabel!
    
    
    
    
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











