//
//  VideoCell.h
//  TouTiaoNews
//
//  Created by 梁华建 on 2019/7/3.
//  Copyright © 2019 梁华建. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"
@class VideoCell;
@protocol VideoCellDelegate <NSObject>

-(void)CellVideoDidStartToPlay:(VideoCell *)cell;

@end
NS_ASSUME_NONNULL_BEGIN

@interface VideoCell : UICollectionViewCell
@property(nonatomic,copy)NSString *videoUrl;
@property(nonatomic,assign)CGRect videoFrame;
@property(nonatomic,strong)VideoModel *videoModel;
@property(nonatomic,weak)id<VideoCellDelegate> cellDelegate;
-(void)destroyPlayer;
@end

NS_ASSUME_NONNULL_END
