//
//  ViewController.swift
//  How Focused?

//  Created by 이현호 on 2023/11/16


import UIKit
import SnapKit


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var mainTopView = MainTopView()
    var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .howFocus2Beige
        applyViewCode()
        collectionViewSetUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if collectionView.numberOfItems(inSection: 0) > 0 {
            collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
        }
    }
    
    //CollectionView의 객체를 정의, 위치와 속성을 설정합니다.
    func collectionViewSetUp(){
        let mosaicLayout = MosaicLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: mosaicLayout)
        collectionView.backgroundColor = .howFocus2Beige
        collectionView.alwaysBounceVertical = true
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MosaicCollectionViewCell.self, forCellWithReuseIdentifier: MosaicCollectionViewCell.identifier)
  
        
        
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints{
            $0.top.equalTo(mainTopView.topLabel.snp.bottom)
            $0.centerX.equalToSuperview()
//            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
            
            $0.width.equalToSuperview().offset(-30)
            $0.height.equalToSuperview().offset(-40)
            
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MosaicCollectionViewCell.identifier, for: indexPath) as? MosaicCollectionViewCell else {return UICollectionViewCell()}
        
        cell.timerLabel.text = "\(indexPath.row)"
        
        if indexPath.row + 1 != collectionView.numberOfItems(inSection: 0){
            cell.timerLabel.text = "\(indexPath.row)"
        }else {
            cell.timerLabel.text = "+"
        }
        
        switch indexPath.row {
            case let x where x % 5 == 0:
            cell.containterView.backgroundColor = UIColor.howfocus2Red
                return cell
            
            case let x where x % 4 == 0:
            cell.containterView.backgroundColor = UIColor.howFocus2Blue
                return cell

            
            case let x where x % 3 == 0:
            cell.containterView.backgroundColor = UIColor.white
                return cell

            
            case let x where x % 2 == 0:
            cell.containterView.backgroundColor = UIColor.howFocus2Brown
                return cell

            
            case let x where x % 1 == 0:
            cell.containterView.backgroundColor = UIColor.howFocus2Yellow
                return cell

            default:
                return cell
        }
    }
}

extension ViewController: ViewCodeProtocol{
    func buildViewHierachy() {
        view.addSubview(mainTopView)
    }
    
    func setUpConstraint() {
        mainTopView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(20)
        }
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct VCPreview: PreviewProvider {
    static var previews: some View {
        ViewController().showPreView(.iPhone12Pro)
    }
}
#endif


