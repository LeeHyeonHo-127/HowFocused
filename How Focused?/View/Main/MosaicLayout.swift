 //
 //
 //  MosaicLayout.swift
 //  How Focused?
 //
 //  Created by 이현호 on 2023/11/30.
 

 import UIKit

 enum MosaicSegmentStyle {
     case fullWidth
     case fiftyFifty
     case twoThirdsOneThird
     case oneThirdTwoThirds
 }

 class MosaicLayout: UICollectionViewLayout {
     var contentBounds = CGRect.zero
     var cachedAttributes = [UICollectionViewLayoutAttributes]()
     
     
     override func prepare() {
         super.prepare()
         
         //MosaicLayout을 사용하는 CollectionView의 개체입니다.
         guard let collectionView = collectionView else { return }
         
         //cashed의 정보를 리셋합니다.
         cachedAttributes.removeAll()
         contentBounds = CGRect(origin: .zero, size: collectionView.bounds.size)
         
         let count = collectionView.numberOfItems(inSection: 0)
         var currentIndex = 0
         var segment: MosaicSegmentStyle = .fullWidth
         var lastFrame: CGRect = .zero
         let cvWidth = collectionView.bounds.size.width
         
         //segment에 맞는 CGRect를 segmentRect에 할당합니다.
         while currentIndex < count {
             let segmentFrame = CGRect(x: 0, y: lastFrame.maxY + 1.0, width: cvWidth, height: 200.0)
             
             var segmentRects = [CGRect]()
             
             switch segment {
             case .fullWidth: // 1 + 1
                 let verticalSlices = segmentFrame.dividedIntegral(fraction: 0.5, from: .minYEdge)
                 segmentRects = [verticalSlices.first, verticalSlices.second]
                 
             case .fiftyFifty: // 1/2 + 1/2 + 1
                 let horizontalSlices = segmentFrame.dividedIntegral(fraction: 0.5, from: .minXEdge)
                 let verticalSlices = horizontalSlices.first.dividedIntegral(fraction: 0.5, from: .minYEdge)
                 segmentRects = [verticalSlices.first, verticalSlices.second, horizontalSlices.second]
                 
             case .twoThirdsOneThird: // 1 + 1/2 + 1/2  (horizontalSlice)
                 let verticalSlices = segmentFrame.dividedIntegral(fraction: 0.5, from: .minYEdge)
                 let horizontalSlices = verticalSlices.second.dividedIntegral(fraction: 0.5, from: .minXEdge)
                 segmentRects = [verticalSlices.first, horizontalSlices.first, horizontalSlices.second]
                 
             case .oneThirdTwoThirds: // 1 + 1
                 let verticalSlices = segmentFrame.dividedIntegral(fraction: 0.5, from: .minYEdge)
                 segmentRects = [verticalSlices.first, verticalSlices.second]
             }
             
             //currentIndex에 해당하는 cell의 layout객체를 생성합니다.
             //해당 layout객체의 frame을 segmentRect로 지정합니다.
             for rect in segmentRects {
                 let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: currentIndex, section: 0))
                 attributes.frame = rect
                 
                 cachedAttributes.append(attributes)
                 contentBounds = contentBounds.union(lastFrame)
                 
                 currentIndex += 1
                 lastFrame = rect
             }
             
             //currentIndex에 따라 segment를 지정합니다.
             switch count - currentIndex {
//             case 1 :
//                 segment = .fullWidth
//             case 2:
//                 segment = .fiftyFifty
             default:
                 switch segment{
                 case .fullWidth:
                     segment = .fiftyFifty
                 case .fiftyFifty:
                     segment = .twoThirdsOneThird
                 case .twoThirdsOneThird:
                     segment = .oneThirdTwoThirds
                 case .oneThirdTwoThirds:
                     segment = .fiftyFifty
                 }
             }
         }
     }
     
   
     
     
     //collectionView의 contentSize를 재정의합니다.
     override var collectionViewContentSize: CGSize{
         return contentBounds.size
     }
     
     //collectionView의 bound.size가 바뀌었음을 알리는 조건을 재정의합니다.
     override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
         guard let collectionView = collectionView else { return false }
         return !newBounds.size.equalTo(collectionView.bounds.size)
     }
     
     //indexPath에 해당하는 layout객체를 지정한 배열에서 반환하게 재정의합니다.
     override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
         return cachedAttributes[indexPath.item]
     }
     
     //CGRect에 해당하는 layout객체를 지정한 배열에서 반환하게 재정의합니다.
     override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
         var attributesArray = [UICollectionViewLayoutAttributes]()
         
         guard let lastIndex = cachedAttributes.indices.last,
               let firstMatchIndex = binSearch(rect, start: 0, end: lastIndex) else { return attributesArray }
         
        
         for attributes in cachedAttributes[..<firstMatchIndex].reversed() {
             guard attributes.frame.maxY >= rect.minY else { break }
             attributesArray.append(attributes)
         }
         
         for attributes in cachedAttributes[firstMatchIndex...] {
             guard attributes.frame.minY <= rect.maxY else { break }
             attributesArray.append(attributes)
         }
         
         return attributesArray
     }
     
     //rect 와 교차하는 layout 객체의 Index (cachedAttributes 내) 를 검색 반환합니다.
     func binSearch(_ rect: CGRect, start: Int, end: Int) -> Int? {
         if end < start { return nil }
         
         let mid = (start + end) / 2
         let attr = cachedAttributes[mid]
         
         if attr.frame.intersects(rect){
             return mid
         } else {
             if attr.frame.maxY < rect.minY {
                 return binSearch(rect, start: (mid + 1), end: end)
             } else {
                 return binSearch(rect, start: start, end: (mid - 1))
             }
         }
     }
     
 }


 

