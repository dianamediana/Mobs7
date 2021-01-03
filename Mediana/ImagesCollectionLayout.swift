//
//  ImagesCollectionLayout.swift
//  Mediana
//
//  Created by dianaMediana on 03.01.2021.
//

import Foundation
import UIKit

class ImagesCollectionLayout: UICollectionViewLayout {
    private let numberOfColumns = 4
    private var cache: [UICollectionViewLayoutAttributes] = []
    private var contentHeight: CGFloat = 0
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard let collectionView = collectionView else { return }
        cache.removeAll()
        
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset: [CGFloat] = []
        for column in 0..<numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        var yOffset: [CGFloat] = [CGFloat](repeating: 0, count: numberOfColumns)
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            
            var width: CGFloat
            
            width = item % 8 == 1 ? 3.0 * columnWidth : 1.0 * columnWidth
            
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: width, height: width)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(row: item, section: 0))
            attributes.frame = frame
            cache.append(attributes)
            
            contentHeight = max(contentHeight, frame.maxY)
            if item % 8 == 5 {
                yOffset[2] = yOffset[2] + 3 * width
                yOffset[3] = yOffset[3] + 3 * width
            }
            yOffset[column] = yOffset[column] + width
            switch item % 8 {
            case 0, 4:
                column = 1
            case 1, 2, 3, 7:
                column = 0
            case 5:
                column = 2
            case 6:
                column = 3
            default:
                break
            }
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
