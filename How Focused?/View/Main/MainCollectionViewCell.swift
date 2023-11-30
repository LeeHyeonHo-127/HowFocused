
import UIKit
import SnapKit

class MainCollectionViewCell_1: UICollectionViewCell{
    static let identifier = "MosaicCollectionViewCell"
    
    var timerView1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.howfocus2Red
        view.layer.cornerRadius = 20
        return view
    }()
    
    var timerText1: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "IMPACT", size: 40)
        label.text = "0 1 H 0 1 M"
        return label
    }()
    
    
    
    
    lazy var timerView2: UIView = UIView()
    lazy var timerText2: UILabel = UILabel()
    
    override init(frame: CGRect) {
        
        
        super.init(frame: frame)
        self.clipsToBounds = true
        self.autoresizesSubviews = true
        
    
        self.addSubview(timerView1)
        timerView1.addSubview(timerText1)
        
        timerView1.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(-5)
        }
        
        timerText1.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
 
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainCollectionViewCell_1: ViewCodeProtocol{
    func buildViewHierachy() {
        addSubview(timerView1)
//        addSubview(timerView2)
        timerView1.addSubview(timerText1)
//        timerView2.addSubview(timerText2)
    }
    
    func setUpConstraint() {
        timerView1.snp.makeConstraints{
            $0.height.equalTo(UIScreen.main.bounds.height/9)
            $0.width.equalTo(UIScreen.main.bounds.width - 30)
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        timerText1.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
    }
    
    func configureView() {
        timerView1.backgroundColor = UIColor.howFocusYellow
        timerView1.layer.cornerRadius = 20
        
        timerText1.text = "0 1 H 2 5 M"
        timerText1.font = UIFont(name: "Impact", size: 50)
        
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct MainCollectionViewCell_1_Preview: PreviewProvider{
    static var previews: some View{
        UIViewPreview{
            let view = MainCollectionViewCell_1()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
