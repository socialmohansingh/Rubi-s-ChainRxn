//
//  ChainRxnLogic.h
//  ChainRxn
//
//  Created by Developer8 on 2/10/16.
//  Copyright © 2016 Developer8. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChainRxnLogic : NSObject{
    NSMutableArray *gameCellStatus;
    NSMutableArray *gameCellUser;
    NSMutableArray *rxnCellPos;
    int userTurn;
    int gameSize;
    int totalUser;
    bool isWithRubi;
    
}
-(void) startGame;
-(void) setGameSize:(int)size;
-(void) setTotalUser:(int)User;
-(void) setIsWithRubi:(BOOL)isWithRubi;
-(BOOL) updateCellIndex:(int)cellPos;
-(int) userTurn;
-(BOOL) isGameFinish;
-(void) setUserTurn;
-(int) gameCellStatus:(int)cellPos;
-(int) gameCellUser:(int)cellPos;
-(BOOL) updateGameFromPosition:(int) cellPos;
@end
