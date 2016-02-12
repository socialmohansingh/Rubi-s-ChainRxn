//
//  ChainRxnLogic.m
//  ChainRxn
//
//  Created by Developer8 on 2/10/16.
//  Copyright © 2016 Developer8. All rights reserved.
//

#import "ChainRxnLogic.h"

@implementation ChainRxnLogic

-(void) setGameSize:(int)size{
    gameSize=size;
}
-(void) setTotalUser:(int)User{
    totalUser=User;
}
-(void) setIsWithRubi:(BOOL)isWith{
    isWithRubi=isWith;
}
-(int) userTurn{
    return userTurn;
}
-(void) setUserTurn{
    userTurn++;
    if(userTurn>=totalUser){
        userTurn=0;
    }
}
-(int) gameCellStatus:(int)cellPos{
    return (int)[[gameCellStatus objectAtIndex:cellPos] integerValue];
}
-(int) gameCellUser:(int)cellPos{
    return (int)[[gameCellUser objectAtIndex:cellPos] integerValue];
}

-(void) startGame{
    userTurn=0;

    gameCellStatus = [[NSMutableArray alloc] init];
    gameCellUser= [[NSMutableArray alloc] init];
    rxnCellPos =[[NSMutableArray alloc] init];
    switch (gameSize) {
        case 81:
            for (int cnt=0; cnt<gameSize; cnt++) {
                [gameCellStatus addObject:[NSString stringWithFormat:@"0"]];
                [gameCellUser addObject:[NSString stringWithFormat:@"-1"]];
            }
            break;
            
        default:
            break;
    }
    
}
-(BOOL) isGameFinish{
    int tempGameCellUser =(int)[[gameCellUser objectAtIndex:0] integerValue];

    for(int i=0;i<gameSize;i++){
        if(tempGameCellUser != (int)[[gameCellUser objectAtIndex:i] integerValue] || tempGameCellUser == -1){
            return false;
        }
    }
    return true;
}
-(BOOL) updateCellIndex:(int)cellPos{
   
    int tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:cellPos] integerValue];
    int tempGameCellUser =(int)[[gameCellUser objectAtIndex:cellPos] integerValue];
    if(tempGameCellUser == userTurn || tempGameCellUser == -1){
        gameCellUser[cellPos] = [NSString stringWithFormat:@"%d",userTurn];
        tempGameCellStatus +=1;
        gameCellStatus[cellPos] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
        return true;
    }
    
    return false;
}

-(BOOL) updateGameFromPosition:(int) cellPos{
    int row =sqrt(gameSize);
    int col=row;
    int tempGameCellStatus;
    int r=cellPos/9;
    int c=cellPos%9;
  
            tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:r*9+c] integerValue];
            if((r==0 && c==0)||(r==0 && c==col-1)||(r==row-1 && c==0)||(r==row-1 && c==col-1)){
                
                //two blast-- in corner cells
                if(tempGameCellStatus>1)
                {
                    if(r==0 && c==0){
                        //first conrner
                        gameCellUser[r*9+c+1] = [NSString stringWithFormat:@"%d",userTurn];
                        gameCellUser[(r+1)*9+c] = [NSString stringWithFormat:@"%d",userTurn];
                        
                        gameCellStatus[r*9+c] = @"0";
                        gameCellUser[r*9+c]=@"-1";
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:r*9+c+1] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[r*9+c+1] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:(r+1)*9+c] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[(r+1)*9+c] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                        
                    }
                    else if (r==0 && c==col-1){
                        //second corner
                        gameCellUser[r*9+c-1] = [NSString stringWithFormat:@"%d",userTurn];
                        gameCellUser[(r+1)*9+c] = [NSString stringWithFormat:@"%d",userTurn];
                        
                        gameCellStatus[r*9+c] = @"0";
                        gameCellUser[r*9+c]=@"-1";
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:r*9+c-1] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[r*9+c-1] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:(r+1)*9+c] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[(r+1)*9+c] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                        

                    }
                    else if (r==row-1 && c==0){
                        //third corner
                        gameCellUser[r*9+c+1] = [NSString stringWithFormat:@"%d",userTurn];
                        gameCellUser[(r-1)*9+c] = [NSString stringWithFormat:@"%d",userTurn];
                        
                        gameCellStatus[r*9+c] = @"0";
                        gameCellUser[r*9+c]=@"-1";
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:r*9+c+1] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[r*9+c+1] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:(r-1)*9+c] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[(r-1)*9+c] = [NSString stringWithFormat:@"%d",tempGameCellStatus];

                        
                    }
                    else{
                        //fourth corner
                        gameCellUser[r*9+c-1] = [NSString stringWithFormat:@"%d",userTurn];
                        gameCellUser[(r-1)*9+c] = [NSString stringWithFormat:@"%d",userTurn];
                        gameCellStatus[r*9+c] = @"0";
                        gameCellUser[r*9+c]=@"-1";
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:r*9+c-1] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[r*9+c-1] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:(r-1)*9+c] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[(r-1)*9+c] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                    }
                     return true;
                }
            }
            else if(r==0 || c==0 || r==row-1||c==col-1){
                //side cell -- 3 blast
                if(tempGameCellStatus>2){
                    if(r==0){
                        //first row
                        gameCellUser[r*9+c-1] = [NSString stringWithFormat:@"%d",userTurn];
                        gameCellUser[r*9+c+1] = [NSString stringWithFormat:@"%d",userTurn];
                        gameCellUser[(r+1)*9+c] = [NSString stringWithFormat:@"%d",userTurn];
                        gameCellStatus[r*9+c] = @"0";
                        gameCellUser[r*9+c]=@"-1";
                        
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:r*9+c-1] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[r*9+c-1] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                        
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:r*9+c+1] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[r*9+c+1] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                        
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:(r+1)*9+c] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[(r+1)*9+c] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                    }
                    else if(c==0){
                        //first column
                        gameCellUser[(r-1)*9+c] = [NSString stringWithFormat:@"%d",userTurn];
                        gameCellUser[(r+1)*9+c] = [NSString stringWithFormat:@"%d",userTurn];
                        gameCellUser[r*9+c+1] = [NSString stringWithFormat:@"%d",userTurn];
                        gameCellStatus[r*9+c] = @"0";
                        gameCellUser[r*9+c]=@"-1";
                        
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:(r-1)*9+c] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[(r-1)*9+c] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                        
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:(r+1)*9+c] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[(r+1)*9+c] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                        
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:r*9+c+1] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[r*9+c+1] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                    }
                    else if(r==row-1){
                        //last row
                        gameCellUser[r*9+c-1] = [NSString stringWithFormat:@"%d",userTurn];
                        gameCellUser[r*9+c+1] = [NSString stringWithFormat:@"%d",userTurn];
                        gameCellUser[(r-1)*9+c] = [NSString stringWithFormat:@"%d",userTurn];
                        gameCellStatus[r*9+c] = @"0";
                        gameCellUser[r*9+c]=@"-1";
                        
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:r*9+c-1] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[r*9+c-1] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                        
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:r*9+c+1] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[r*9+c+1] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                        
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:(r-1)*9+c] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[(r-1)*9+c] = [NSString stringWithFormat:@"%d",tempGameCellStatus];

                    }
                    else{
                        //last column
                        gameCellUser[(r-1)*9+c] = [NSString stringWithFormat:@"%d",userTurn];
                        gameCellUser[(r+1)*9+c] = [NSString stringWithFormat:@"%d",userTurn];
                        gameCellUser[r*9+c-1] = [NSString stringWithFormat:@"%d",userTurn];
                        gameCellStatus[r*9+c] = @"0";
                        gameCellUser[r*9+c]=@"-1";
                        
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:(r-1)*9+c] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[(r-1)*9+c] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                        
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:(r+1)*9+c] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[(r+1)*9+c] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                        
                        tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:r*9+c-1] integerValue];
                        tempGameCellStatus +=1;
                        gameCellStatus[r*9+c-1] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                    }
                     return true;
                }
               
            }
            else
            {
                //center cells--4 blast
                if(tempGameCellStatus>3){
                    gameCellUser[r*9+c-1] = [NSString stringWithFormat:@"%d",userTurn];
                    gameCellUser[r*9+c+1] = [NSString stringWithFormat:@"%d",userTurn];
                    gameCellUser[(r+1)*9+c] = [NSString stringWithFormat:@"%d",userTurn];
                    gameCellUser[(r-1)*9+c] = [NSString stringWithFormat:@"%d",userTurn];
                    gameCellStatus[r*9+c] = @"0";
                    
                    tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:r*9+c-1] integerValue];
                    tempGameCellStatus +=1;
                    gameCellStatus[r*9+c-1] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                    
                    tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:r*9+c+1] integerValue];
                    tempGameCellStatus +=1;
                    gameCellStatus[r*9+c+1] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                    
                    tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:(r+1)*9+c] integerValue];
                    tempGameCellStatus +=1;
                    gameCellStatus[(r+1)*9+c] = [NSString stringWithFormat:@"%d",tempGameCellStatus];
                    
                    tempGameCellStatus=(int)[[gameCellStatus objectAtIndex:(r-1)*9+c] integerValue];
                    tempGameCellStatus +=1;
                    gameCellStatus[(r-1)*9+c] = [NSString stringWithFormat:@"%d",tempGameCellStatus];

                  
                    return true;
                }
            }
        
    return false;
}


@end
