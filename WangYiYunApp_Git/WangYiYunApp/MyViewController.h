//
//  myViewController.h
//  WangYiYunApp
//
//  Created by 夏楠 on 2023/6/6.
//

#import <UIKit/UIKit.h>
#import "PhotoWallViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface MyViewController : UIViewController<UIScrollViewDelegate, photoWallDelegate>
@property(nonatomic, strong) UIScrollView *scrollView1;
@property(nonatomic, strong) UIScrollView *scrollView2;
@property(nonatomic, strong) UIScrollView *scrollView3;
@property(nonatomic, strong) UIButton *p1;
@property(nonatomic, strong) UIButton *p2;
@property(nonatomic, strong) UIButton *p3;
@property(nonatomic, strong) UIButton *p4;
@property(nonatomic, strong) UIButton *btn_head;
@property(nonatomic, strong) UIButton *gedan1;
@property(nonatomic, strong) UIButton *gedan2;
@end

NS_ASSUME_NONNULL_END
