
import UIKit
import SnapKit

class MosaicCollectionViewCell: UICollectionViewCell{
    
    static let identifier = "MosaicCollectionViewCell"
    
    
    lazy var containterView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.howfocus2Red
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var timerLabel: UILabel = {
        let label = UILabel()
         label.font = UIFont(name: "Itim-Regular", size: 40)
         label.text = "01H 01M"
         return label
     }()
    
    lazy var discribeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.howFocusDiscribe
        label.text = "파이팅!"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.autoresizesSubviews = true
        
        self.addSubview(containterView)
        containterView.addSubview(timerLabel)
        containterView.addSubview(discribeLabel)
        
        containterView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(-5)
        }
        
        timerLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        discribeLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(timerLabel.snp.bottom).offset(5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct MosaicCollectionViewCell_Preview: PreviewProvider{
    static var previews: some View{
        UIViewPreview{
            let view = MosaicCollectionViewCell()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
