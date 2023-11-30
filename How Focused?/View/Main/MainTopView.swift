
import UIKit
import SnapKit

class MainTopView: UIView{
    
    lazy var dateLabel: UILabel = UILabel()
    lazy var dayOfWeekLabel: UILabel = UILabel()
    
    lazy var topLabel: UILabel = {
        let label = UILabel()
        label.text = "괜찮아 할 수 있어. 파이팅."
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sizeToFit()
        
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainTopView: ViewCodeProtocol{
    func buildViewHierachy() {
//        addSubview(dateLabel)
//        addSubview(dayOfWeekLabel)
        addSubview(topLabel)
    }
    
    func setUpConstraint() {
        
        
        topLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
//        dayOfWeekLabel.snp.makeConstraints{ make in
//            make.top.equalTo(dateLabel.snp.bottom)
//            make.leading.equalTo(dateLabel.snp.leading)
//        }
    }
    
    func configureView() {
        
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct MainTopViewPreview: PreviewProvider{
    static var previews: some View{
        UIViewPreview{
            let view = MainTopView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
