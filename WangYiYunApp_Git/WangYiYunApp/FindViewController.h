//
//  findViewController.h
//  WangYiYunApp
//
//  Created by 夏楠 on 2023/6/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FindViewController : UIViewController<UITextFieldDelegate, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)UIScrollView *scrollView1;
@property(nonatomic, strong)UIScrollView *scrollView2;
@property(nonatomic, strong)UIScrollView *scrollView3;
@property(nonatomic, strong)UIScrollView *scrollView4;
@property(nonatomic, strong)UIScrollView *scrollView5;
@property(nonatomic, strong)UIScrollView *scrollView6;
@property(nonatomic, strong)UIScrollView *scrollView7;
@property(retain, nonatomic)UITextField *textField;
@property(nonatomic, strong)UIButton *p1;
@property(nonatomic, strong)NSArray *arrayData;
@property(nonatomic, strong)NSArray *bokeArray;
@property(nonatomic, strong)UITableView *firstTableView;
@end

NS_ASSUME_NONNULL_END
