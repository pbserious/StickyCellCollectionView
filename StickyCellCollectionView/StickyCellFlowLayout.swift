//
//  StickyCellFlowLayout.swift
//  StickyCellCollectionView
//
//  Created by Rattee Wariyawutthiwat on 4/4/2560 BE.
//  Copyright © 2560 Rattee. All rights reserved.
//

import UIKit

class StickyCellFlowLayout:UICollectionViewFlowLayout {
    
    var stickyIndexPath = [IndexPath(row: 3, section: 0)]
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let layoutAttributes = super.layoutAttributesForElements(in: rect) else { return nil }
        
        // Helpers
        var newLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for layoutAttributesSet in layoutAttributes {
            if let _ = stickyIndexPath.filter({ indexPath -> Bool in
                return indexPath == layoutAttributesSet.indexPath
            }).first {
                continue
            }
            
            if layoutAttributesSet.representedElementCategory == .cell {
                // Add Layout Attributes
                newLayoutAttributes.append(layoutAttributesSet)
            }
        }
        for indexPath in stickyIndexPath {
            if let attr = layoutAttributesForItem(at: indexPath) {
                newLayoutAttributes.append(attr)
            }
        }
        return newLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let collectionView = collectionView else { return nil }
        guard let attr = super.layoutAttributesForItem(at: indexPath) else { return nil }
        if let _ = stickyIndexPath.filter({ sIndexPath -> Bool in
            return indexPath == sIndexPath
        }).first {
            attr.zIndex += 10
            if attr.frame.origin.y < collectionView.contentOffset.y {
                attr.frame.origin.y = collectionView.contentOffset.y
            }
        }
        return attr
    }
}
