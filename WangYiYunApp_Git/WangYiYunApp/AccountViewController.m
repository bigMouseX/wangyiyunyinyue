//
//  accountViewController.m
//  WangYiYunApp
//
//  Created by 夏楠 on 2023/6/6.
//

#import "AccountViewController.h"
#import "HeadTableViewCell.h"
#import "ServiceTableViewCell.h"
#import "ExitTableViewCell.h"
#import "NightTableViewCell.h"
#import "TitleTableViewCell.h"
@interface AccountViewController ()

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;

    // 创建一个自定义按钮
    UIButton *customButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [customButton setImage:[UIImage imageNamed:@"saoma.png"] forState:UIControlStateNormal];
    [customButton addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    [customButton setFrame:CGRectMake(0, 0, 30, 30)]; // 设置按钮的大小
    
    // 创建一个UIBarButtonItem，并将自定义按钮设置为其自定义视图
    UIBarButtonItem *customBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customButton];
    
    // 将UIBarButtonItem添加到导航栏的左侧
    self.navigationItem.leftBarButtonItem = customBarButtonItem;

    
    UIColor *wechatBackgroundColor = [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0];
    self.tableView.backgroundColor = wechatBackgroundColor;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:self.tableView];
    [self.tableView addSubview:_moonSwitch];
    
    _arrayData = @[@[@"我的消息", @"创作者中心"],
            @[@"趣测", @"商城", @"口袋彩铃", @"游戏专区"],
            @[@"设置", @"深色模式", @"定时关闭", @"个性装扮", @"边听边存", @"音乐黑名单", @"音乐闹钟"],
            @[@"我的订单", @"优惠券", @"我的客服", @"分享网易云音乐", @"个人信息与隐私保护", @"关于"]];
    
    [self.tableView registerClass:[ServiceTableViewCell class] forCellReuseIdentifier:@"service"];
    [self.tableView registerClass:[HeadTableViewCell class] forCellReuseIdentifier:@"head"];
    [self.tableView registerClass:[ExitTableViewCell class] forCellReuseIdentifier:@"exit"];
    [self.tableView registerClass:[NightTableViewCell class] forCellReuseIdentifier:@"noon"];
    [self.tableView registerClass:[TitleTableViewCell class] forCellReuseIdentifier:@"title"];

    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 2;
    } else if (section == 2) {
        return 5;
    } else if (section == 3) {
        return 7;
    } else if (section == 4) {
        return 6;
    }
    else {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 根据需要自定义不同行的高度
    if (indexPath.section == 0) {
        return 150; // 第一行的高度为150
    } else if (indexPath.section == 2 && indexPath.row == 0) {
            return 40;
    } else if (indexPath.section == 3 && indexPath.row == 0) {
            return 40;
    } else  {
        return 60; // 第二行的高度为60
    }

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HeadTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"head" forIndexPath:indexPath];
        if (self.isNightMode) {
                    cell.backgroundColor = [UIColor darkGrayColor]; // 设置夜间模式下的单元格颜色
                } else {
                    cell.backgroundColor = [UIColor whiteColor]; // 设置日间模式下的单元格颜色
                    
                }
        return cell;
    } else if (indexPath.section == 1) {
        ServiceTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"service" forIndexPath:indexPath];
        cell.name.text = _arrayData[indexPath.section - 1][indexPath.row];
        cell.name.textColor = [UIColor blackColor];
        
        NSString *t = [NSString stringWithFormat:@"p%ld%ld.png", indexPath.section, indexPath.row + 1];
        UIImage *image = [UIImage imageNamed:t];
        cell.icon.image = image;
        cell.backgroundColor = [UIColor whiteColor];//解决办法：初始化时随意调用下contentview，比如背景色
        // 通过调用颜色来实现点击事件，与懒加载有关
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        if (self.isNightMode) {
                    cell.backgroundColor = [UIColor darkGrayColor]; // 设置夜间模式下的单元格颜色
                    cell.name.textColor = [UIColor whiteColor]; // 设置夜间模式下的文本颜色
                } else {
                    cell.backgroundColor = [UIColor whiteColor]; // 设置日间模式下的单元格颜色
                    cell.name.textColor = [UIColor blackColor]; // 设置日间模式下的文本颜色
                }

        return cell;
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            TitleTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"title" forIndexPath:indexPath];
            cell.title.text = @"音乐服务";
            if (self.isNightMode) {
                cell.backgroundColor = [UIColor darkGrayColor]; // 设置夜间模式下的单元格颜色
                cell.title.textColor = [UIColor whiteColor]; // 设置夜间模式下的文本颜色
            } else {
                cell.backgroundColor = [UIColor whiteColor]; // 设置日间模式下的单元格颜色
                cell.title.textColor = [UIColor blackColor]; // 设置日间模式下的文本颜色
            }
            return cell;
        } else {
            ServiceTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"service" forIndexPath:indexPath];
            cell.name.text = _arrayData[indexPath.section - 1][indexPath.row - 1];
            
            NSString *t = [NSString stringWithFormat:@"p%ld%ld.png", indexPath.section, indexPath.row];
            UIImage *image = [UIImage imageNamed:t];
            cell.icon.image = image;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            if (self.isNightMode) {
                cell.backgroundColor = [UIColor darkGrayColor]; // 设置夜间模式下的单元格颜色
                cell.name.textColor = [UIColor whiteColor]; // 设置夜间模式下的文本颜色
            } else {
                cell.backgroundColor = [UIColor whiteColor]; // 设置日间模式下的单元格颜色
                cell.name.textColor = [UIColor blackColor]; // 设置日间模式下的文本颜色
            }

            return cell;
        }
    } else if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            TitleTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"title" forIndexPath:indexPath];
            cell.title.text = @"小工具";
            if (self.isNightMode) {
                cell.backgroundColor = [UIColor darkGrayColor]; // 设置夜间模式下的单元格颜色
                cell.title.textColor = [UIColor whiteColor]; // 设置夜间模式下的文本颜色
            } else {
                cell.backgroundColor = [UIColor whiteColor]; // 设置日间模式下的单元格颜色
                cell.title.textColor = [UIColor blackColor]; // 设置日间模式下的文本颜色
            }
            
            return cell;
        } else {
            if (indexPath.row != 2) {
                ServiceTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"service" forIndexPath:indexPath];
                cell.name.text = _arrayData[indexPath.section - 1][indexPath.row - 1];
                
                NSString *t = [NSString stringWithFormat:@"p%ld%ld.png", indexPath.section, indexPath.row];
                UIImage *image = [UIImage imageNamed:t];
                cell.icon.image = image;
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
                if (self.isNightMode) {
                    cell.backgroundColor = [UIColor darkGrayColor]; // 设置夜间模式下的单元格颜色
                    cell.name.textColor = [UIColor whiteColor]; // 设置夜间模式下的文本颜色
                } else {
                    cell.backgroundColor = [UIColor whiteColor]; // 设置日间模式下的单元格颜色
                    cell.name.textColor = [UIColor blackColor]; // 设置日间模式下的文本颜色
                }
                return cell;
                
            }
            else {
                NightTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"noon" forIndexPath:indexPath];
                cell.name.text = _arrayData[indexPath.section - 1][indexPath.row - 1];
                
                NSString *t = [NSString stringWithFormat:@"p%ld%ld.png", indexPath.section, indexPath.row];
                UIImage *image = [UIImage imageNamed:t];
                cell.icon.image = image;
                
                [cell.s setOnTintColor:[UIColor redColor]];
                if (self.isNightMode == YES) {
                    cell.s.on = YES;
                    [cell.s addTarget:self action:@selector(swChange:) forControlEvents:UIControlEventValueChanged];
                }
                else {
                    cell.s.on = NO;
                    [cell.s addTarget:self action:@selector(swChange:) forControlEvents:UIControlEventValueChanged];
                }
                if (self.isNightMode) {
                    cell.backgroundColor = [UIColor darkGrayColor]; // 设置夜间模式下的单元格颜色
                    cell.name.textColor = [UIColor whiteColor]; // 设置夜间模式下的文本颜色
                } else {
                    cell.backgroundColor = [UIColor whiteColor]; // 设置日间模式下的单元格颜色
                    cell.name.textColor = [UIColor blackColor]; // 设置日间模式下的文本颜色
                }
                
                return cell;
            }
        }
        
    } else if (indexPath.section == 4) {
        ServiceTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"service" forIndexPath:indexPath];
        cell.name.text = _arrayData[indexPath.section - 1][indexPath.row];
        cell.name.textColor = [UIColor blackColor];
        
        NSString *t = [NSString stringWithFormat:@"p%ld%ld.png", indexPath.section, indexPath.row + 1];
        UIImage *image = [UIImage imageNamed:t];
        cell.icon.image = image;
        cell.backgroundColor = [UIColor whiteColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        if (self.isNightMode) {
                    cell.backgroundColor = [UIColor darkGrayColor]; // 设置夜间模式下的单元格颜色
                    cell.name.textColor = [UIColor whiteColor]; // 设置夜间模式下的文本颜色
                } else {
                    cell.backgroundColor = [UIColor whiteColor]; // 设置日间模式下的单元格颜色
                    cell.name.textColor = [UIColor blackColor]; // 设置日间模式下的文本颜色
                }
        return cell;
    } else {
        ExitTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"exit" forIndexPath:indexPath];
        cell.exit.text = @"退出登陆/关闭";
        cell.backgroundColor = [UIColor whiteColor];
        cell.exit.textColor = [UIColor redColor];
        
        if (self.isNightMode) {
                    cell.backgroundColor = [UIColor darkGrayColor]; // 设置夜间模式下的单元格颜色
                } else {
                    cell.backgroundColor = [UIColor whiteColor]; // 设置日间模式下的单元格颜色
                }
        
        return cell;
    }
     
    return 0;
}

////===================
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 0;
//}
////
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *headerView = [[UIView alloc] init];
//    headerView.backgroundColor = [UIColor clearColor];
//    return headerView;
//}

//脚视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

//要设置底部间隔，就必须有这个操作
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}
//=========================



- (void)swChange:(UISwitch *)sw {
    self.isNightMode = sw.isOn;

    // 更改背景颜色和选项的字体颜色
    if (self.isNightMode) {
        self.tableView.backgroundColor = [UIColor blackColor];
        self.tabBarController.tabBar.backgroundColor = [UIColor darkGrayColor];
        self.tabBarController.tabBar.barTintColor = [UIColor darkGrayColor];
        self.tabBarController.tabBar.tintColor = [UIColor redColor]; // 设置选中的 TabBarItem 颜色
    } else {
        UIColor *wechatBackgroundColor = [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0];
        self.tableView.backgroundColor = wechatBackgroundColor;
        self.tabBarController.tabBar.backgroundColor = wechatBackgroundColor;
        self.tabBarController.tabBar.barTintColor = wechatBackgroundColor;
        self.tabBarController.tabBar.tintColor = [UIColor grayColor]; // 恢复默认的 TabBarItem 颜色
        
    }
    
    // 刷新 tableView，以便重新加载单元格的颜色
    [self.tableView reloadData];
    
}

-(void)unselectCell:(id)sender{
[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   //跳转等其他操作
  [self performSelector:@selector(unselectCell:) withObject:nil afterDelay:0.5];
}

- (void)buttonTapped{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
