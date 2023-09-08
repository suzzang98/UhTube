//
//  MainPageViewController.swift
//  UhTube
//
//  Created by 이수현 on 2023/09/04.
//

import UIKit
import Foundation



let screatKey = "AIzaSyA4YVD1ugJ3TS05DCUVr0cVwNpvUGsqlqE"
var selectNum : Int = 1
var jsonData: Array<String>?
var jsonTitle: Array<String>?
var jsonDescription: Array<String>?

class MainPageViewController: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mainSearchText: UITextField!
    
    @IBAction func mainSearchButton(_ sender: Any) {
        searchText = mainSearchText.text ?? "Nomad Coders"
        mainSearchText.text = ""
        respondData()
    }
    
    var searchText : String = "Nomad Coders"
    var json : Welcome?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // 통신 시작
        respondData()
        
        // 키보드 내리기
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
         tap.cancelsTouchesInView = false
         view.addGestureRecognizer(tap)
        
        // 콜렉션뷰에 대한 설정
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        collectionView.delegate = self
        
        mainSearchText.layer.borderWidth = 1.0
        mainSearchText.layer.cornerRadius = 5
        
        // 콜렉션뷰 레이아웃을 설정한다.
        self.collectionView.collectionViewLayout = createCompositionalLayout()
        
    }

}

extension MainPageViewController {
    func respondData() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "youtube.googleapis.com"
        urlComponents.path = "/youtube/v3/search"
        urlComponents.queryItems = [
            URLQueryItem(name: "part", value: "snippet"),
            URLQueryItem(name: "maxResults", value: "20"),
            URLQueryItem(name: "q", value: searchText),
            URLQueryItem(name: "key", value: screatKey),
        ]
        let url = urlComponents.url!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let cellId = String(describing: CollectionViewCell.self)
            
            if let error = error {
                print("Error: \(error)")
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    self.json = try JSONDecoder().decode(Welcome.self, from: data)
                    DispatchQueue.main.async { [self] in
//                        print((self.json?.items[1])!.)
                        jsonData = []
                        jsonTitle = []
                        jsonDescription = []
                     
                        for index in (self.json?.items)!{
                            print(index.id)
                            if(index.id.videoId != nil){
                                jsonData?.append((index.id.videoId)!)
                                jsonTitle?.append(index.snippet.title)
                                jsonDescription?.append(index.snippet.description)
                            }
                        }
                 
                        
                        self.collectionView.reloadData()
                    }
                } catch {
                    print("Error parsing JSON response")
                }
            } else {
                print("에러에러에러에러")
            }
        }
        task.resume()
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
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .absolute(160))
            
            // 위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // 아이템 간격설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            
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
extension MainPageViewController : UITextViewDelegate {
 
    func textViewDidChange(_ textView: UITextView) {
        if mainSearchText.text!.count > 10 {
            return mainSearchText.deleteBackward()
        }
        // 텍스트 뷰 터치 시 키보드 올리기
        self.mainSearchText.becomeFirstResponder()
    }
    
 
    
    @objc func keyboardUp(notification:NSNotification) {
        if let keyboardFrame:NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
           let keyboardRectangle = keyboardFrame.cgRectValue
       
            UIView.animate(
                withDuration: 0.3
                , animations: {
                    self.view.transform = CGAffineTransform(translationX: 0, y: -keyboardRectangle.height)
                }
            )
        }
    }
    
    @objc func keyboardDown() {
        self.view.transform = .identity
    }
}



extension MainPageViewController: UICollectionViewDataSource, UICollectionViewDelegate{
   
    // 각 섹션에 들어가는 아이템 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    // 각 콜렉션뷰셀에 대한 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellId = String(describing: CollectionViewCell.self)

        
        // 셀 인스턴스
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
        
        // 수정내역
       
        var buty : String = ""

        if(jsonData?[indexPath.row] == nil){
            buty = "BBvvv79JeR4"
        }else {
            buty = jsonData![indexPath.row]
            cell.LavelSetup(with: jsonTitle![indexPath.row])
        }
        
        
        cell.CollectionViewCellSetup(with: "https://img.youtube.com/vi/\(buty)/0.jpg")
            //code
        
        // 중대한 문제 통신이 끝나기전에 화면이 구성되서 에러남 통신되고 사진 들어옴
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectNum = indexPath.row
        let detail = UIStoryboard.init(name: "DetailPage", bundle: nil)
        guard let detailController = detail.instantiateViewController(withIdentifier: "DetailPage")as? DetailPageViewController else {return}

        detailController.modalPresentationStyle = .fullScreen
        self.present(detailController, animated: true, completion: nil)
    }
}

