
import UIKit
import SnapKit

class MainCollectionView: UIView{
    
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainCollectionView: ViewCodeProtocol{
    func buildViewHierachy() {

    }
    
    func setUpConstraint() {

    }
    
    func configureView() {

    }
}



#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct MainCollectionViewPreview: PreviewProvider{
    static var previews: some View{
        UIViewPreview{
            let view = MainCollectionView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
