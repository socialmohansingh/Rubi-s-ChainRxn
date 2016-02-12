//
//  ViewController.h
//  ChainRxn
//
//  Created by Developer8 on 2/10/16.
//  Copyright © 2016 Developer8. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewController.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    CollectionViewController *collectionViewController;
    NSArray *itemList;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *labelTotalPlayer;
@property (strong, nonatomic) IBOutlet UIButton *buttonPlayer;
@property (strong, nonatomic) IBOutlet UIButton *buttonSize;
- (IBAction)buttonPlay:(UIButton *)sender;
- (IBAction)buttonPlayerSelection:(UIButton *)sender;
- (IBAction)buttonSizeSelection:(UIButton *)sender;

@end
