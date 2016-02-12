//
//  ViewController.m
//  ChainRxn
//
//  Created by Developer8 on 2/10/16.
//  Copyright © 2016 Developer8. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.hidden=true;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) NumberOfSectionsInTableView:(UITableView *) tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return itemList.count-1;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainCell"];
    }
    
    cell.textLabel.text=[itemList objectAtIndex:indexPath.row+1];
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return [itemList objectAtIndex:0];
}
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row<2){
            _labelTotalPlayer.text=@"2";
        }
        else{
            _labelTotalPlayer.text=[NSString stringWithFormat:@"%ld",indexPath.row+1];
        }
    if([[itemList objectAtIndex:0] containsString:@"Play With"]){
        [_buttonPlayer setTitle:[itemList objectAtIndex:indexPath.row+1] forState:UIControlStateNormal];
    }
    else{
         [_buttonSize setTitle:[itemList objectAtIndex:indexPath.row+1] forState:UIControlStateNormal];
    }
    _tableView.hidden=true;
    return indexPath;
}

- (IBAction)buttonPlay:(UIButton *)sender {
    collectionViewController = [[CollectionViewController alloc] initWithNibName:@"CollectionViewController" bundle:nil];

    [self.navigationController pushViewController:collectionViewController animated:YES];
  
}
- (IBAction)buttonPlayerSelection:(UIButton *)sender {
    _tableView.hidden=false;
    itemList = [[NSArray alloc] initWithObjects:@"Play With",@"Rubi",@"1 Friend",@"2 Friends",@"3 Friend",@"4 Friend",@"5 Friend",@"6 Friend", nil ];
    
       [_tableView reloadData];
}

- (IBAction)buttonSizeSelection:(UIButton *)sender {
    _tableView.hidden=false;
    false;
    itemList = [[NSArray alloc] initWithObjects:@"Select Size Of Game",@"4 X 4 = 16",@"5 X 5 = 25",@"6 X 6 = 36",@"7 X 7 = 49",@"8 X 8 = 64",@"9 X 9 = 81", nil ];
    [_tableView reloadData];

}
@end
