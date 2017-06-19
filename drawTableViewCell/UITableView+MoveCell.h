//
//  UITableView+MoveCell.h
//  drawTableViewCell
//
//  Created by yuandiLiao on 2017/5/31.
//  Copyright © 2017年 yuandiLiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void(^moveCellBlock)(NSMutableArray *newArray);

typedef enum{
    SnapshotMeetsEdgeTop = 1,
    SnapshotMeetsEdgeBottom,
}SnapshotMeetsEdge;

@interface UITableView (MoveCell)

@property (nonatomic,strong)NSMutableArray *dataArray;

@property (nonatomic,strong)NSIndexPath *indexPath;
@property (nonatomic,strong)UIView *snapView;
@property (nonatomic,strong)UITableViewCell *moveCell;
/**自动滚动的方向*/
@property (nonatomic, assign) SnapshotMeetsEdge autoScrollDirection;
/**cell被拖动到边缘后开启，tableview自动向上或向下滚动*/
@property (nonatomic, strong) CADisplayLink *autoScrollTimer;

@property (nonatomic,weak)moveCellBlock block;

-(void)setDataWithArray:(NSMutableArray *)array withBlock:(moveCellBlock)block;
@end
