//
//  myViewController.m
//  WangYiYunApp
//
//  Created by 夏楠 on 2023/6/6.
//

#import "MyViewController.h"
#import "CloudViewController.h"
@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 创建一个自定义按钮
    UIButton *customButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [customButton1 setImage:[UIImage imageNamed:@"yunpan.png"] forState:UIControlStateNormal];
    [customButton1 addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    [customButton1 setFrame:CGRectMake(0, 0, 30, 30)]; // 设置按钮的大小
    
    // 创建一个UIBarButtonItem，并将自定义按钮设置为其自定义视图
    UIBarButtonItem *customBarButtonItem1 = [[UIBarButtonItem alloc] initWithCustomView:customButton1];
    
    // 将UIBarButtonItem添加到导航栏的左侧
    self.navigationItem.leftBarButtonItem = customBarButtonItem1;

    
    UIColor *wechatBackgroundColor = [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0];
    
    self.view.backgroundColor = wechatBackgroundColor;
    
    // 创建一个自定义按钮
    UIButton *customButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [customButton2 setImage:[UIImage imageNamed:@"sousuo-2.png"] forState:UIControlStateNormal];
    [customButton2 addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    [customButton2 setFrame:CGRectMake(0, 0, 30, 30)]; // 设置按钮的大小
    
    // 创建一个UIBarButtonItem，并将自定义按钮设置为其自定义视图
    UIBarButtonItem *customBarButtonItem2 = [[UIBarButtonItem alloc] initWithCustomView:customButton2];
    
    // 将UIBarButtonItem添加到导航栏的左侧
    self.navigationItem.rightBarButtonItem = customBarButtonItem2;

//======================主滚动视图===========================
    self.scrollView1 = [[UIScrollView alloc] init];
    self.scrollView1.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    //是否按照整页来滚动
    //是否可以开启滚动效果
    self.scrollView1.scrollEnabled = YES;
    //设置画布的大小，画布显示在滚动视图内部，一般大雨Frame的大小
    //通过足够大的画布来承受足够多的图片
    
    //高增大会增大纵向滚动条
    self.scrollView1.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 800);

    
    //是否可以边缘弹动效果
    //这个是比较有用的点，可以让我们第一张与最后一张图片只能向前或向后拉动，而不能向没有图片的方向拉动
    //bounces的意思是弹动
    self.scrollView1.bounces = YES;
    //开启纵向弹动效果
    //一般会开启，但是对于滚动的只有图片不需要刷新的最好不要开启
    self.scrollView1.alwaysBounceVertical = YES;
    //显示横向滚动条
    //    sv.showsHorizontalScrollIndicator = YES;
    //是否显示纵向滚动条
    //必须要画布大小大于滚动视图框架大小才能显示
    self.scrollView1.showsVerticalScrollIndicator = YES;
    //设置背景颜色
    //    UIColor *wechatBackgroundColor = [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0];
    self.scrollView1.backgroundColor = wechatBackgroundColor;
    
    [self.view addSubview:self.scrollView1];
//======================主滚动视图===========================
    
//====================我的——头像框=================
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];

    btn.frame = CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, 135);
    btn.backgroundColor = [UIColor whiteColor];
    [self.scrollView1 addSubview:btn];
    
    
    //cornerRadius是拐角半径的意思
    btn.layer.cornerRadius = 20;
    btn.layer.masksToBounds = YES;
//====================我的——头像框=================
    
//====================我的——头像=================
    _btn_head = [[UIButton alloc] init];
    [_btn_head setImage:[UIImage imageNamed:@"touxiang.jpeg"] forState:UIControlStateNormal];
    // 设置按钮普通状态标题

    // 按钮坐标和尺寸
    _btn_head.frame = CGRectMake(20, 20, 55, 55);
    _btn_head.layer.cornerRadius = _btn_head.frame.size.width / 2;
    _btn_head.layer.masksToBounds = YES;
    _btn_head.clipsToBounds = YES;
    
    SEL extractedExpr = @selector(changePhoto);
    [_btn_head addTarget:self action:extractedExpr forControlEvents:UIControlEventTouchUpInside];
    
    [btn addSubview:_btn_head];
//====================我的——头像else=================
    UIButton *btn_headelse1 = [[UIButton alloc] init];
    [btn_headelse1 setImage:[UIImage imageNamed:@"myheadelse1.jpg"] forState:UIControlStateNormal];
    // 设置按钮普通状态标题

    // 按钮坐标和尺寸
    btn_headelse1.frame = CGRectMake(80, 5, [UIScreen mainScreen].bounds.size.width - 120, 80);
    
    [btn addSubview:btn_headelse1];
    
    UIButton *btn_headelse2 = [[UIButton alloc] init];
    [btn_headelse2 setImage:[UIImage imageNamed:@"myheadelse2.jpg"] forState:UIControlStateNormal];
    // 设置按钮普通状态标题

    // 按钮坐标和尺寸
    btn_headelse2.frame = CGRectMake(20, 75, [UIScreen mainScreen].bounds.size.width - 70, 55);
    
    [btn addSubview:btn_headelse2];
//====================我的——头像else=================
    
//=======================我的小控件======================
    self.p1 = [UIButton buttonWithType:UIButtonTypeSystem];
    _p1.backgroundColor = [UIColor clearColor];
    [_p1 setTitle:@"收藏" forState:UIControlStateNormal];
    
    UIImage *t1 = [UIImage imageNamed:@"mySmall_1.png"];
    t1 = [t1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_p1 setImage:t1 forState:UIControlStateNormal];
    
    [_p1 setTintColor:[UIColor blackColor]];
    _p1.imageEdgeInsets = UIEdgeInsetsMake(-_p1.titleLabel.intrinsicContentSize.height + 10, 0, 0, -_p1.titleLabel.intrinsicContentSize.width);
    _p1.titleEdgeInsets = UIEdgeInsetsMake(_p1.currentImage.size.height + 30, -_p1.currentImage.size.width, 0, 0);
    [self.scrollView1 addSubview:self.p1];
    
    self.p2 = [UIButton buttonWithType:UIButtonTypeSystem];
    _p2.backgroundColor = [UIColor clearColor];
    [_p2 setTitle:@"本地" forState:UIControlStateNormal];
    
    UIImage *t2 = [UIImage imageNamed:@"mySmall_2.png"];
    t2 = [t2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_p2 setImage:t2 forState:UIControlStateNormal];
    
    [_p2 setTintColor:[UIColor blackColor]];
    _p2.imageEdgeInsets = UIEdgeInsetsMake(-_p2.titleLabel.intrinsicContentSize.height + 10, 0, 0, -_p2.titleLabel.intrinsicContentSize.width);
    _p2.titleEdgeInsets = UIEdgeInsetsMake(_p2.currentImage.size.height + 30, -_p2.currentImage.size.width, 0, 0);
    [self.scrollView1 addSubview:self.p2];
    
    self.p3 = [UIButton buttonWithType:UIButtonTypeSystem];
    _p3.backgroundColor = [UIColor clearColor];
    [_p3 setTitle:@"有声" forState:UIControlStateNormal];
    
    UIImage *t3 = [UIImage imageNamed:@"mySmall_3.png"];
    t3 = [t3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_p3 setImage:t3 forState:UIControlStateNormal];
    
    [_p3 setTintColor:[UIColor blackColor]];
    _p3.imageEdgeInsets = UIEdgeInsetsMake(-_p3.titleLabel.intrinsicContentSize.height + 10, 0, 0, -_p3.titleLabel.intrinsicContentSize.width);
    _p3.titleEdgeInsets = UIEdgeInsetsMake(_p3.currentImage.size.height + 30, -_p3.currentImage.size.width, 0, 0);
    [self.scrollView1 addSubview:self.p3];
    
    self.p4 = [UIButton buttonWithType:UIButtonTypeSystem];
    _p4.backgroundColor = [UIColor clearColor];
    [_p4 setTitle:@"已购" forState:UIControlStateNormal];
    
    UIImage *t4 = [UIImage imageNamed:@"mySmall_4.png"];
    t4 = [t4 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_p4 setImage:t4 forState:UIControlStateNormal];
    
    [_p4 setTintColor:[UIColor blackColor]];
    _p4.imageEdgeInsets = UIEdgeInsetsMake(-_p4.titleLabel.intrinsicContentSize.height + 10, 0, 0, -_p4.titleLabel.intrinsicContentSize.width);
    _p4.titleEdgeInsets = UIEdgeInsetsMake(_p4.currentImage.size.height + 30, -_p4.currentImage.size.width, 0, 0);
    [self.scrollView1 addSubview:self.p4];
    
    float wid = [UIScreen mainScreen].bounds.size.width / 4;
    _p1.frame = CGRectMake(0, 150, wid, wid);
    _p2.frame = CGRectMake(wid, 150, wid, wid);
    _p3.frame = CGRectMake(wid * 2, 150, wid, wid);
    _p4.frame = CGRectMake(wid * 3, 150, wid, wid);
//=======================我的小控件======================
    
//====================最近播放==========================
    UIButton *btn_zuijin = [UIButton buttonWithType:UIButtonTypeCustom];
    // 设置按钮普通状态标题
    [btn_zuijin setTitle:@"最近播放" forState:UIControlStateNormal];
    // 设置按钮字体
    btn_zuijin.titleLabel.font = [UIFont systemFontOfSize:18];
    // 设置按钮普通状态标题颜色
    [btn_zuijin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //按钮文字靠左侧对齐
    btn_zuijin.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

    // 按钮坐标和尺寸
    btn_zuijin.frame = CGRectMake(15, 280, 100, 35);
    [self.scrollView1 addSubview:btn_zuijin];
    
    self.scrollView2 = [[UIScrollView alloc] init];
    self.scrollView2.frame = CGRectMake(10, 315, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.width / 3 + 50);
    
    //是否可以开启滚动效果
    self.scrollView2.scrollEnabled = YES;
    //设置画布的大小，画布显示在滚动视图内部，一般大雨Frame的大小
    //通过足够大的画布来承受足够多的图片
    
    //高增大会增大纵向滚动条
    self.scrollView2.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 3 * 6, [UIScreen mainScreen].bounds.size.width / 3 + 50);
    
    //是否可以边缘弹动效果
    //这个是比较有用的点，可以让我们第一张与最后一张图片只能向前或向后拉动，而不能向没有图片的方向拉动
    //bounces的意思是弹动
    self.scrollView2.bounces = YES;
    //开启横向弹动效果
    self.scrollView2.alwaysBounceHorizontal = YES;

    self.scrollView2.showsVerticalScrollIndicator = YES;
    //设置背景颜色
//    self.scrollView2.backgroundColor = [UIColor redColor];
    
    [self.scrollView1 addSubview:self.scrollView2];
    
    CGFloat imageViewWidth3 = ([UIScreen mainScreen].bounds.size.width) / 3;

    for (int i = 0; i <= 5; i++) {
        NSString *strName = [NSString stringWithFormat:@"zuijin%d.jpg", i + 1];
        
        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        
        // 创建普通状态按钮图片
        [btn1 setImage:[UIImage imageNamed:strName] forState:UIControlStateNormal];
        
        btn1.frame = CGRectMake((imageViewWidth3) * i , 0, imageViewWidth3, [UIScreen mainScreen].bounds.size.width / 3 + 50);

        [self.scrollView2 addSubview:btn1];

    }
    self.scrollView2.backgroundColor = wechatBackgroundColor;
    
//====================最近播放==========================

//======================歌单=========================
    self.gedan1 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.gedan2 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.gedan1 setTitle:@"自建歌单" forState:UIControlStateNormal];
    // 设置按钮字体
    self.gedan1.titleLabel.font = [UIFont systemFontOfSize:18];
    // 设置按钮普通状态标题颜色
//    [self.gedan1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    //按钮文字靠左侧对齐
    self.gedan1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //选中时按钮的背景颜色为透明
    [self.gedan1 setBackgroundImage:[[UIImage alloc] init] forState:UIControlStateSelected];
    [self.gedan1 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.gedan1 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];

    
    [self.gedan2 setTitle:@"收藏歌单" forState:UIControlStateNormal];
    // 设置按钮字体
    self.gedan2.titleLabel.font = [UIFont systemFontOfSize:18];
    // 设置按钮普通状态标题颜色
//    [self.gedan2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    //按钮文字靠左侧对齐
    self.gedan2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.gedan2 setBackgroundImage:[[UIImage alloc] init] forState:UIControlStateSelected];
    [self.gedan2 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.gedan2 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];

    [self.gedan1 setBackgroundColor:[UIColor clearColor]];
    [self.gedan2 setBackgroundColor:[UIColor clearColor]];
    
    // 按钮坐标和尺寸
    self.gedan1.frame = CGRectMake(15, 540, 80, 35);
    self.gedan2.frame = CGRectMake(100, 540, 80, 35);
    [self.scrollView1 addSubview:self.gedan1];
    [self.scrollView1 addSubview:self.gedan2];
    
    [self.gedan1 addTarget:self action:@selector(gedanButtonTapped1:) forControlEvents:UIControlEventTouchUpInside];
    [self.gedan2 addTarget:self action:@selector(gedanButtonTapped2:) forControlEvents:UIControlEventTouchUpInside];
    


    
    self.gedan1.selected = YES;
//======================歌单=========================

    
//=======================歌单滚动视图=======================
    self.scrollView3 = [[UIScrollView alloc] init];
    self.scrollView3.frame = CGRectMake(10, 590, [UIScreen mainScreen].bounds.size.width - 20, 200);
    
    //是否按照整页来滚动
    self.scrollView3.pagingEnabled = YES;
    //是否可以开启滚动效果
    self.scrollView3.scrollEnabled = YES;
    //设置画布的大小，画布显示在滚动视图内部，一般大雨Frame的大小
    //通过足够大的画布来承受足够多的图片
    
    //高增大会增大纵向滚动条
    self.scrollView3.contentSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 20) * 2, 200);
    
    //是否可以边缘弹动效果
    //这个是比较有用的点，可以让我们第一张与最后一张图片只能向前或向后拉动，而不能向没有图片的方向拉动
    //bounces的意思是弹动
    self.scrollView3.bounces = YES;
    //开启横向弹动效果
    self.scrollView3.alwaysBounceHorizontal = YES;
    //开启纵向弹动效果
    //一般会开启，但是对于滚动的只有图片不需要刷新的最好不要开启
    //    sv.alwaysBounceVertical = YES;
    //显示横向滚动条
    //    sv.showsHorizontalScrollIndicator = YES;
    //是否显示纵向滚动条
    //必须要画布大小大于滚动视图框架大小才能显示
    self.scrollView3.showsVerticalScrollIndicator = YES;
    //设置背景颜色
    self.scrollView3.backgroundColor = wechatBackgroundColor;
    
    [self.scrollView1 addSubview:self.scrollView3];
    
    CGFloat imageViewWidth4 = ([UIScreen mainScreen].bounds.size.width - 20);
    
    for (int i = 0; i <= 2; i++) {
        NSString *strName = [NSString stringWithFormat:@"boke%d.jpg", i + 1];
        
        UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        
        // 创建普通状态按钮图片
        [btn2 setImage:[UIImage imageNamed:strName] forState:UIControlStateNormal];
        
        btn2.frame = CGRectMake((imageViewWidth4) * i , 0, imageViewWidth4, 200);

        [self.scrollView3 addSubview:btn2];

    }
    self.scrollView3.delegate = self;
//=======================歌单滚动视图=======================
    

}

- (void)buttonTapped {
    CloudViewController *cloud = [[CloudViewController alloc] init];
    [self.navigationController pushViewController:cloud animated:YES];
}

//======================换头像=========================
- (void)changePhoto {
    PhotoWallViewController *photoWall = [[PhotoWallViewController alloc] init];
    photoWall.delegate = self;
    [self.navigationController pushViewController:photoWall animated:YES];
}
- (void)changePhoto:(UIImage *)image {
    [_btn_head setImage:image forState:UIControlStateNormal];
}
//======================换头像=========================

//======================歌单=========================
- (void)gedanButtonTapped1:(UIButton *)sender {
    // 切换按钮的选中状态
    self.gedan1.selected = YES;
    self.gedan2.selected = NO;

    // 根据选中状态执行相应的操作
    if (self.gedan1.selected) {
        [self.scrollView3 setContentOffset:CGPointMake(0, 0) animated:YES];
    } else {
        //
    }
}

- (void)gedanButtonTapped2:(UIButton *)sender {
    // 切换按钮的选中状态
    self.gedan2.selected = YES;
    self.gedan1.selected = NO;
    
    // 根据选中状态执行相应的操作
    if (self.gedan2.selected) {
        [self.scrollView3 setContentOffset:CGPointMake(self.scrollView3.frame.size.width, 0) animated:YES];
    } else {
        //
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 获取滚动视图的水平偏移量
    CGFloat contentOffsetX = scrollView.contentOffset.x;

    NSInteger selectedIndex = (double)(contentOffsetX / scrollView.frame.size.width + 0.5);
    
    if (selectedIndex == 0) {
        self.gedan1.selected = YES;
        self.gedan2.selected = NO;
    } else {
        self.gedan2.selected = YES;
        self.gedan1.selected = NO;
    }
}


//======================歌单=========================

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
