//
//  ViewController.swift
//  How Focused?
//
//  Created by 이현호 on 2023/11/16.ddd
//

import UIKit
import SnapKit


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var mainTopView = MainTopView()
    var collectionViewConstroller: UICollectionViewController = UICollectionViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .howFocus2Beige
        applyViewCode()
        collectionViewSetUp()
    }
    
    func collectionViewSetUp(){
        
        let mosaicLayout = MosaicLayout()
        
        /*
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height/9)
        flowLayout.scrollDirection = .vertical
        */
        
        collectionViewConstroller.collectionView = UICollectionView(frame: .zero, collectionViewLayout: mosaicLayout)
        
        
        view.addSubview(collectionViewConstroller.collectionView)
        
        collectionViewConstroller.collectionView.delegate = self
        collectionViewConstroller.collectionView.dataSource = self
        collectionViewConstroller.collectionView.register(MainCollectionViewCell_1.self, forCellWithReuseIdentifier: "MainCollectionViewCell_1")
        collectionViewConstroller.collectionView.backgroundColor = .howFocus2Beige
        collectionViewConstroller.collectionView.sizeToFit()
        
        collectionViewConstroller.collectionView.snp.makeConstraints{
            $0.top.equalTo(mainTopView.topLabel.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        60
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell_1", for: indexPath) as? MainCollectionViewCell_1 else {return UICollectionViewCell()}
        switch indexPath.row {
            
            case let x where x % 5 == 0:
            cell.timerView1.backgroundColor = UIColor.howfocus2Red
                return cell
            
            case let x where x % 4 == 0:
            cell.timerView1.backgroundColor = UIColor.howFocus2Blue
                return cell

            
            case let x where x % 3 == 0:
            cell.timerView1.backgroundColor = UIColor.white
                return cell

            
            case let x where x % 2 == 0:
            cell.timerView1.backgroundColor = UIColor.howFocus2Brown
                return cell

            
            case let x where x % 1 == 0:
            cell.timerView1.backgroundColor = UIColor.howFocus2Yellow
                return cell

            default:
                return cell
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}


extension ViewController: ViewCodeProtocol{
    func buildViewHierachy() {
        view.addSubview(mainTopView)
    }
    
    func setUpConstraint() {
        mainTopView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide as! ConstraintRelatableTarget)
            make.leading.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(20)
        }
    }
}





//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//
//struct VCPreview: PreviewProvider {
//    static var previews: some View {
//        ViewController().showPreView(.iPhone12Pro)
//    }
//}
//#endif
//
//
