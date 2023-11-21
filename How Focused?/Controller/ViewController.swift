//
//  ViewController.swift
//  How Focused?
//
//  Created by 이현호 on 2023/11/16.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var mainTopView = MainTopView()
    var collectionViewConstroller: UICollectionViewController = UICollectionViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        applyViewCode()
        collectionViewSetUp()
    }
    
    func collectionViewSetUp(){
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height/9)
        flowLayout.scrollDirection = .vertical
        
        collectionViewConstroller.collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        view.addSubview(collectionViewConstroller.collectionView)
        
        collectionViewConstroller.collectionView.delegate = self
        collectionViewConstroller.collectionView.dataSource = self
        collectionViewConstroller.collectionView.register(MainCollectionViewCell_1.self, forCellWithReuseIdentifier: "MainCollectionViewCell_1")
        collectionViewConstroller.collectionView.backgroundColor = .howFocusBlack
        
        
        collectionViewConstroller.collectionView.snp.makeConstraints{
            $0.top.equalTo(mainTopView.dayOfWeekLabel.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        60
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell_1", for: indexPath) as? MainCollectionViewCell_1 else {return UICollectionViewCell()}
        switch indexPath.row {
            
            case let x where x % 5 == 0:
            cell.timerView1.backgroundColor = UIColor.howFocusYellow
                return cell
            
            case let x where x % 4 == 0:
            cell.timerView1.backgroundColor = UIColor.howFocusWhite
                return cell

            
            case let x where x % 3 == 0:
            cell.timerView1.backgroundColor = UIColor.howFocusPurple
                return cell

            
            case let x where x % 2 == 0:
            cell.timerView1.backgroundColor = UIColor.howFocusBrown
                return cell

            
            case let x where x % 1 == 0:
            cell.timerView1.backgroundColor = UIColor.howFocusGreen
                return cell

            default:
                return cell
            break
        }
    }
    

    
}

extension ViewController: ViewCodeProtocol{
    func buildViewHierachy() {
        view.addSubview(mainTopView)
    }
    
    func setUpConstraint() {
        mainTopView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide as! ConstraintRelatableTarget)
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


