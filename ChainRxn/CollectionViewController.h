//
//  CollectionViewController.h
//  ChainRxn
//
//  Created by Developer8 on 2/10/16.
//  Copyright © 2016 Developer8. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"
#import "ChainRxnLogic.h"

@interface CollectionViewController : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegate>{
    ChainRxnLogic *logic;
}


@end
