//
//  accountViewController.h
//  WangYiYunApp
//
//  Created by 夏楠 on 2023/6/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AccountViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *arrayData;
@property(nonatomic, strong)UISwitch *moonSwitch;
@property (nonatomic, assign) BOOL isNightMode;

@end

NS_ASSUME_NONNULL_END
