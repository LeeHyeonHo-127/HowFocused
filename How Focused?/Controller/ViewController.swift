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
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView = UICollectionView()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainCollectionViewCell_1.self, forCellWithReuseIdentifier: "MainCollectionViewCell_1")

        applyViewCode()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell_1", for: indexPath) as! MainCollectionViewCell_1
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = (UIScreen.main.bounds.height/9 * 2) + 10
        return CGSize(width: width, height: height)
    }
    
}

extension ViewController: ViewCodeProtocol{
    func buildViewHierachy() {
        view.addSubview(mainTopView)
        view.addSubview(collectionView)
    }
    
    func setUpConstraint() {
        mainTopView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints{
            $0.top.equalTo(mainTopView.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
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


