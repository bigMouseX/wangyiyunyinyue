//
//  findViewController.m
//  WangYiYunApp
//
//  Created by 夏楠 on 2023/6/6.
//

#import "FindViewController.h"
#import "FindTableViewCell.h"
@interface FindViewController ()

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstTableView .autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    //设置数据视图的代理对象
    self.firstTableView.delegate = self;
    //设置数据视图的数据源对象
    self.firstTableView.dataSource = self;
    self.firstTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 373 * 3, 200) style:UITableViewStyleGrouped];
    [self.firstTableView registerClass:[FindTableViewCell class] forCellReuseIdentifier:@"Find"];
    self.firstTableView.userInteractionEnabled = YES;

    
    self.scrollView1.userInteractionEnabled = YES;
    UIColor *wechatBackgroundColor = [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0];
    self.navigationController.navigationBar.backgroundColor = wechatBackgroundColor;
    
    //======================导航栏按钮==============================
    // 创建一个自定义按钮
    UIButton *customButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [customButton1 setImage:[UIImage imageNamed:@"caidan.png"] forState:UIControlStateNormal];
    [customButton1 addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    [customButton1 setFrame:CGRectMake(0, 0, 30, 30)]; // 设置按钮的大小
    
    // 创建一个UIBarButtonItem，并将自定义按钮设置为其自定义视图
    UIBarButtonItem *customBarButtonItem1= [[UIBarButtonItem alloc] initWithCustomView:customButton1];
    
    // 将UIBarButtonItem添加到导航栏的左侧
    self.navigationItem.leftBarButtonItem = customBarButtonItem1;
    
    UIButton *customButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [customButton2 setImage:[UIImage imageNamed:@"maikefeng.png"] forState:UIControlStateNormal];
    [customButton2 addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    [customButton2 setFrame:CGRectMake(0, 0, 30, 30)]; // 设置按钮的大小
    
    // 创建一个UIBarButtonItem，并将自定义按钮设置为其自定义视图
    UIBarButtonItem *customBarButtonItem2 = [[UIBarButtonItem alloc] initWithCustomView:customButton2];
    
    // 将UIBarButtonItem添加到导航栏的左侧
    self.navigationItem.rightBarButtonItem = customBarButtonItem2;
    //======================导航栏按钮==============================
    
    //======================导航栏文本框==============================
    self.textField = [[UITextField alloc]init];
    self.textField.frame = CGRectMake(60, 0, 280, 40);
    self.textField.placeholder = @"雪Distance 骆驼";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    // 设置文本框的圆角
    self.textField.layer.cornerRadius = self.textField.bounds.size.height / 2.0;
    self.textField.layer.masksToBounds = YES;
    self.textField.backgroundColor = [UIColor whiteColor];  // 设置背景颜色
    self.textField.layer.borderColor = [UIColor whiteColor].CGColor;  // 设置边框颜色
    self.textField.layer.borderWidth = 1.0;  // 设置边框宽度
    
    
    [self.navigationController.navigationBar addSubview:self.textField];
    
    //======================导航栏文本框==============================
    
    //================主滚动视图=====================
    self.scrollView1 = [[UIScrollView alloc] init];
    self.scrollView1.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    //是否按照整页来滚动
    //是否可以开启滚动效果
    self.scrollView1.scrollEnabled = YES;
    //设置画布的大小，画布显示在滚动视图内部，一般大雨Frame的大小
    //通过足够大的画布来承受足够多的图片
    
    //高增大会增大纵向滚动条
    self.scrollView1.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 1150);

    
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
    //========================================
    
    //================顶部滚动视图=====================
    self.scrollView2 = [[UIScrollView alloc] init];
    self.scrollView2.frame = CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, 125);
    
    //是否按照整页来滚动
    self.scrollView2.pagingEnabled = YES;
    //是否可以开启滚动效果
    self.scrollView2.scrollEnabled = YES;
    //设置画布的大小，画布显示在滚动视图内部，一般大雨Frame的大小
    //通过足够大的画布来承受足够多的图片
    
    //高增大会增大纵向滚动条
    self.scrollView2.contentSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 20) * 7, 125);
    
    //是否可以边缘弹动效果
    //这个是比较有用的点，可以让我们第一张与最后一张图片只能向前或向后拉动，而不能向没有图片的方向拉动
    //bounces的意思是弹动
    self.scrollView2.bounces = YES;
    //开启横向弹动效果
    self.scrollView2.alwaysBounceHorizontal = YES;
    //开启纵向弹动效果
    //一般会开启，但是对于滚动的只有图片不需要刷新的最好不要开启
    //    sv.alwaysBounceVertical = YES;
    //显示横向滚动条
    //    sv.showsHorizontalScrollIndicator = YES;
    //是否显示纵向滚动条
    //必须要画布大小大于滚动视图框架大小才能显示
    self.scrollView2.showsVerticalScrollIndicator = YES;
    //设置背景颜色
    self.scrollView2.backgroundColor = [UIColor whiteColor];
    
    // 设置滚动视图的圆角
    self.scrollView2.layer.cornerRadius = self.textField.bounds.size.height / 2.0;
    self.scrollView2.layer.masksToBounds = YES;
    [self.scrollView1 addSubview:self.scrollView2];
    
    //================顶部循环滚动视图实现===============================
    // 图片视图的尺寸
    CGFloat imageViewWidth1 = [UIScreen mainScreen].bounds.size.width - 20;
    CGFloat imageViewHeight1 = 125;
    
    // 遍历添加图片视图
    for (int i = 0; i <= 6; i++) {
        NSString *strName = [NSString stringWithFormat:@"findhead%d.jpg", (i % 5) + 1];
        
        // 创建图片
        UIImage *image = [UIImage imageNamed:strName];
        // 创建视图
        UIImageView *iView = [[UIImageView alloc] initWithImage:image];
        
        // 设置每个视图的frame
        if (i == 6) {
            // 最后一张图片视图
            iView.frame = CGRectMake(0, 0, imageViewWidth1, imageViewHeight1);
        } else {
            // 其他图片视图
            //这里的尺寸记得第一个参数一定要是图片尺寸的大小
            iView.frame = CGRectMake(imageViewWidth1 * (i + 1), 0, imageViewWidth1, imageViewHeight1);
        }
        
        // 添加视图到滚动视图中
        //这里之所以我们的上面第一个参数一定要是图片尺寸的大小。是因为我们是将iview添加到滚动视图中，所以是以滚动视图的尺寸为基准，也就是说0的地方就是滚动视图的左上角而不是屏幕的左上角，这点要重点记
        [self.scrollView2 addSubview:iView];
    }
    
    
    // 设置初始偏移量到第二张图片
    [self.scrollView2 setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width - 20, 0) animated:NO];
    
    // 实现滚动到最后一张视图时，再次滚动能回到第一张视图
    self.scrollView2.delegate = self;
    
    //================顶部循环滚动视图实现===============================
    
    //================顶部循环滚动视图的小控件实现===============================
    self.scrollView3 = [[UIScrollView alloc] init];
    self.scrollView3.frame = CGRectMake(10, 125, [UIScreen mainScreen].bounds.size.width - 20, 80);
    
    //是否可以开启滚动效果
    self.scrollView3.scrollEnabled = YES;
    //设置画布的大小，画布显示在滚动视图内部，一般大雨Frame的大小
    //通过足够大的画布来承受足够多的图片
    
    //高增大会增大纵向滚动条
    self.scrollView3.contentSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 20) / 5 * 9, 80);
    
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
    self.scrollView3.backgroundColor = [UIColor whiteColor];
    
    // 设置滚动视图的圆角
    self.scrollView3.layer.cornerRadius = self.textField.bounds.size.height / 2.0;
    self.scrollView3.layer.masksToBounds = YES;
    [self.scrollView1 addSubview:self.scrollView3];
    
    CGFloat imageViewWidth2 = ([UIScreen mainScreen].bounds.size.width - 20) / 5;
    
    
    _arrayData = @[@[@"每日推荐", @"私人漫游", @"歌单", @"排行榜", @"有声书", @"数字专辑", @"直播", @"收藏夹", @"游戏专区"]];
    
    
    for (int i = 0; i <= 8; i++) {
        NSString *strName = [NSString stringWithFormat:@"headelse%d.png", i + 1];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        // 创建普通状态按钮图片
        [btn setImage:[UIImage imageNamed:strName] forState:UIControlStateNormal];
        // 设置按钮普通状态标题
        [btn setTitle:_arrayData[0][i] forState:UIControlStateNormal];
        // 设置按钮字体
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        // 设置按钮普通状态标题颜色
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        // 设置按钮高亮或选中状态标题颜色
        //        [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
        // 设置按钮背颜色
        //        [btn setBackgroundColor:[UIColor grayColor]];
        
        
        // 按钮坐标和尺寸
        btn.frame = CGRectMake((imageViewWidth2) * i, 10, imageViewWidth2, 40);
        // 按钮图片和标题总高度
        CGFloat totalHeight = (btn.imageView.frame.size.height + btn.titleLabel.frame.size.height);
        // 设置按钮图片偏移
        [btn setImageEdgeInsets:UIEdgeInsetsMake(-(totalHeight - btn.imageView.frame.size.height) + 20, 20, 0, -btn.titleLabel.frame.size.width  + 25)];
        // 设置按钮标题偏移
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(20.0, -btn.imageView.frame.size.width , -(totalHeight - btn.titleLabel.frame.size.height),0.0)];
        
        [self.scrollView3 addSubview:btn];
        
    }
    self.scrollView3.backgroundColor = wechatBackgroundColor;
    
    //================顶部循环滚动视图的小控件实现===============================
    
    //================顶部滚动视图===============================
    
    
    //================推荐歌单视图===============================
    UIButton *btn_tuijian = [UIButton buttonWithType:UIButtonTypeCustom];
    // 设置按钮普通状态标题
    [btn_tuijian setTitle:@"推荐歌单>" forState:UIControlStateNormal];
    // 设置按钮字体
    btn_tuijian.titleLabel.font = [UIFont systemFontOfSize:15.5];
    // 设置按钮普通状态标题颜色
    [btn_tuijian setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //按钮文字靠左侧对齐
    btn_tuijian.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    // 按钮坐标和尺寸
    btn_tuijian.frame = CGRectMake(15, 195, imageViewWidth2 + 20, 35);
    
    UIImageView *tuijian_more = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 35, 205, 15, 20)];
    UIImage *more = [UIImage imageNamed:@"more.png"];
    tuijian_more.image = more;
    [self.scrollView1 addSubview: tuijian_more];
    
    [self.scrollView1 addSubview:btn_tuijian];
    
    self.scrollView4 = [[UIScrollView alloc] init];
    self.scrollView4.frame = CGRectMake(10, 230, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.width / 3 + 50);
    
    //是否可以开启滚动效果
    self.scrollView4.scrollEnabled = YES;
    //设置画布的大小，画布显示在滚动视图内部，一般大雨Frame的大小
    //通过足够大的画布来承受足够多的图片
    
    //高增大会增大纵向滚动条
    self.scrollView4.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 3 * 6, [UIScreen mainScreen].bounds.size.width / 3 + 50);
    
    //是否可以边缘弹动效果
    //这个是比较有用的点，可以让我们第一张与最后一张图片只能向前或向后拉动，而不能向没有图片的方向拉动
    //bounces的意思是弹动
    self.scrollView4.bounces = YES;
    //开启横向弹动效果
    self.scrollView4.alwaysBounceHorizontal = YES;

    self.scrollView4.showsVerticalScrollIndicator = YES;
    //设置背景颜色
    self.scrollView4.backgroundColor = [UIColor redColor];
    
    [self.scrollView1 addSubview:self.scrollView4];
    
    CGFloat imageViewWidth3 = ([UIScreen mainScreen].bounds.size.width) / 3;

    for (int i = 0; i <= 5; i++) {
        NSString *strName = [NSString stringWithFormat:@"tuijian%d.jpg", i + 1];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        // 创建普通状态按钮图片
        [btn setImage:[UIImage imageNamed:strName] forState:UIControlStateNormal];
        
        btn.frame = CGRectMake((imageViewWidth3) * i , 0, imageViewWidth3, [UIScreen mainScreen].bounds.size.width / 3 + 50);


        [self.scrollView4 addSubview:btn];

    }
    self.scrollView4.backgroundColor = wechatBackgroundColor;

        //================推荐歌单视图===============================

    //================热门博客==================================
    UIButton *btn_boke = [UIButton buttonWithType:UIButtonTypeCustom];
    // 设置按钮普通状态标题
    [btn_boke setTitle:@"热门博客>" forState:UIControlStateNormal];
    // 设置按钮字体
    btn_boke.titleLabel.font = [UIFont systemFontOfSize:15.5];
    // 设置按钮普通状态标题颜色
    [btn_boke setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    // 按钮坐标和尺寸
    btn_boke.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn_boke.frame = CGRectMake(15, 420, imageViewWidth2 + 20, 30);
    
    UIImageView *boke_more = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 35, 420, 15, 20)];
    boke_more.image = more;
    [self.scrollView1 addSubview: boke_more];
    
    [self.scrollView1 addSubview:btn_boke];
    
    self.scrollView5 = [[UIScrollView alloc] init];
    self.scrollView5.frame = CGRectMake(10, 450, [UIScreen mainScreen].bounds.size.width - 20, 200);
    
    //是否按照整页来滚动
    self.scrollView5.pagingEnabled = YES;
    //是否可以开启滚动效果
    self.scrollView5.scrollEnabled = YES;
    //设置画布的大小，画布显示在滚动视图内部，一般大雨Frame的大小
    //通过足够大的画布来承受足够多的图片
    
    //高增大会增大纵向滚动条
    self.scrollView5.contentSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 20) * 3, 200);
    
    //是否可以边缘弹动效果
    //这个是比较有用的点，可以让我们第一张与最后一张图片只能向前或向后拉动，而不能向没有图片的方向拉动
    //bounces的意思是弹动
    self.scrollView5.bounces = YES;
    //开启横向弹动效果
    self.scrollView5.alwaysBounceHorizontal = YES;
    //开启纵向弹动效果
    //一般会开启，但是对于滚动的只有图片不需要刷新的最好不要开启
    //    sv.alwaysBounceVertical = YES;
    //显示横向滚动条
    //    sv.showsHorizontalScrollIndicator = YES;
    //是否显示纵向滚动条
    //必须要画布大小大于滚动视图框架大小才能显示
    self.scrollView5.showsVerticalScrollIndicator = YES;
    //设置背景颜色
    self.scrollView5.backgroundColor = wechatBackgroundColor;
    
    [self.scrollView1 addSubview:self.scrollView5];
    [self.scrollView5 addSubview:self.firstTableView];
    
    //实现滚动单元格
    CGFloat imageViewWidth4 = ([UIScreen mainScreen].bounds.size.width - 20);
    _bokeArray = @[@"这就是爱吗", @"一吻天荒（吉他版）", @"恶作剧", @"如果爱忘了", @"山楂树の恋", @" 1022-比尔的歌", @"我下班了蟹老板", @"山羊", @"素颜"];
    
    for (int i = 0; i <= 2; i++) {
        NSString *strName = [NSString stringWithFormat:@"boke0%d.jpg", i + 1];
        
        FindTableViewCell *cell = [[FindTableViewCell alloc] init];
        cell.frame = CGRectMake(0 , 65 * i, imageViewWidth4, 65);
        cell.firstImageView.image = [UIImage imageNamed:strName];
        cell.firstLabel.text = _bokeArray[i];
        cell.backgroundColor = wechatBackgroundColor;
        [self.firstTableView addSubview:cell];
    }
    for (int i = 0; i <= 2; i++) {
        NSString *strName = [NSString stringWithFormat:@"boke0%d.jpg", i + 4];
        
        FindTableViewCell *cell = [[FindTableViewCell alloc] init];
        cell.frame = CGRectMake(imageViewWidth4 , 65 * i, imageViewWidth4, 65);
        cell.firstImageView.image = [UIImage imageNamed:strName];
        cell.firstLabel.text = _bokeArray[i + 3];
        cell.backgroundColor = wechatBackgroundColor;
        [self.firstTableView addSubview:cell];
    }
    for (int i = 0; i <= 2; i++) {
        NSString *strName = [NSString stringWithFormat:@"boke0%d.jpg", i + 7];
        
        FindTableViewCell *cell = [[FindTableViewCell alloc] init];
        cell.frame = CGRectMake(imageViewWidth4 * 2 , 65 * i, imageViewWidth4, 65);
        cell.firstImageView.image = [UIImage imageNamed:strName];
        cell.firstLabel.text = _bokeArray[i + 6];
        cell.backgroundColor = wechatBackgroundColor;
        [self.firstTableView addSubview:cell];
    }
    //实现滚动单元格
//============================热门博客==================================
    
//============================精品有声书博客==================================
    UIButton *btn_youshengshu = [UIButton buttonWithType:UIButtonTypeCustom];
    // 设置按钮普通状态标题
    [btn_youshengshu setTitle:@"精品有声书>" forState:UIControlStateNormal];
    // 设置按钮字体
    btn_youshengshu.titleLabel.font = [UIFont systemFontOfSize:15.5];
    // 设置按钮普通状态标题颜色
    [btn_youshengshu setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    // 按钮坐标和尺寸
    btn_youshengshu.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn_youshengshu.frame = CGRectMake(15, 660, imageViewWidth2 + 20, 30);
    
    [self.scrollView1 addSubview:btn_youshengshu];
    
    UIImageView *youshengshu_more = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 35, 670, 15, 20)];
    youshengshu_more.image = more;
    [self.scrollView1 addSubview: youshengshu_more];
    
    self.scrollView6 = [[UIScrollView alloc] init];
    self.scrollView6.frame = CGRectMake(10, 690, [UIScreen mainScreen].bounds.size.width - 20, 200);
    
    //是否按照整页来滚动
    self.scrollView6.pagingEnabled = YES;
    //是否可以开启滚动效果
    self.scrollView6.scrollEnabled = YES;
    //设置画布的大小，画布显示在滚动视图内部，一般大雨Frame的大小
    //通过足够大的画布来承受足够多的图片
    
    //高增大会增大纵向滚动条
    self.scrollView6.contentSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 20) * 3, 200);

    //是否可以边缘弹动效果
    //这个是比较有用的点，可以让我们第一张与最后一张图片只能向前或向后拉动，而不能向没有图片的方向拉动
    //bounces的意思是弹动
    self.scrollView6.bounces = YES;
    //开启横向弹动效果
    self.scrollView6.alwaysBounceHorizontal = YES;

    self.scrollView6.showsVerticalScrollIndicator = YES;
    //设置背景颜色
    self.scrollView6.backgroundColor = wechatBackgroundColor;
    
    [self.scrollView1 addSubview:self.scrollView6];
    
    CGFloat imageViewWidth5 = ([UIScreen mainScreen].bounds.size.width - 20);
    
    for (int i = 0; i <= 2; i++) {
        NSString *strName = [NSString stringWithFormat:@"youshengshu%d.jpg", i + 1];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        // 创建普通状态按钮图片
        [btn setImage:[UIImage imageNamed:strName] forState:UIControlStateNormal];
        
        btn.frame = CGRectMake((imageViewWidth5) * i , 0, imageViewWidth5, 200);

        [self.scrollView6 addSubview:btn];

    }
    
//============================精品有声书博客==================================
    
//===========================新歌==================================
    UIButton *btn_xinge = [UIButton buttonWithType:UIButtonTypeCustom];
    // 设置按钮普通状态标题
    [btn_xinge setTitle:@"新歌新碟\数字专辑>" forState:UIControlStateNormal];
    // 设置按钮字体
    btn_xinge.titleLabel.font = [UIFont systemFontOfSize:15.5];
    // 设置按钮普通状态标题颜色
    [btn_xinge setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    // 按钮坐标和尺寸
    btn_xinge.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn_xinge.frame = CGRectMake(15, 900, 200, 30);
    
    UIImageView *xinge_more = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 35, 910, 15, 20)];
    xinge_more.image = more;
    [self.scrollView1 addSubview: xinge_more];
    
    [self.scrollView1 addSubview:btn_xinge];
    
    self.scrollView7 = [[UIScrollView alloc] init];
    self.scrollView7.frame = CGRectMake(10, 930, [UIScreen mainScreen].bounds.size.width - 20, 200);
    
    //是否按照整页来滚动
    self.scrollView7.pagingEnabled = YES;
    //是否可以开启滚动效果
    self.scrollView7.scrollEnabled = YES;
    //设置画布的大小，画布显示在滚动视图内部，一般大雨Frame的大小
    //通过足够大的画布来承受足够多的图片
    
    //高增大会增大纵向滚动条
    self.scrollView7.contentSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 20) * 3, 200);

    //是否可以边缘弹动效果
    //这个是比较有用的点，可以让我们第一张与最后一张图片只能向前或向后拉动，而不能向没有图片的方向拉动
    //bounces的意思是弹动
    self.scrollView7.bounces = YES;
    //开启横向弹动效果
    self.scrollView7.alwaysBounceHorizontal = YES;

    self.scrollView6.showsVerticalScrollIndicator = YES;
    //设置背景颜色
    self.scrollView7.backgroundColor = wechatBackgroundColor;
    
    [self.scrollView1 addSubview:self.scrollView7];
    
    
    for (int i = 0; i <= 2; i++) {
        NSString *strName = [NSString stringWithFormat:@"xinge%d.jpg", i + 1];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        // 创建普通状态按钮图片
        [btn setImage:[UIImage imageNamed:strName] forState:UIControlStateNormal];
        
        btn.frame = CGRectMake((imageViewWidth5) * i , 0, imageViewWidth5, 200);

        [self.scrollView7 addSubview:btn];

    }
//===========================新歌==================================
    

}

- (void)buttonTapped {
    
}

//======================导航栏文本框==============================
//点击空白处回收键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.textField resignFirstResponder];// 点击空白处收起
    
}
//======================导航栏文本框==============================

//================顶部循环滚动视图函数实现===============================
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //当前滚动到的x位置
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    CGFloat screenWidth = CGRectGetWidth(scrollView.frame);
    CGFloat contentWidth = scrollView.contentSize.width;
    
    // 滚动到最后一张视图之后，将滚动位置重置到第二张图片
    if (contentOffsetX >= contentWidth - screenWidth) {
        [scrollView setContentOffset:CGPointMake(screenWidth, 0) animated:NO];
    }
    // 滚动到第一张视图之前，将滚动位置重置到倒数第二张图片
    else if (contentOffsetX < screenWidth - scrollView.frame.size.width) {
        [scrollView setContentOffset:CGPointMake(contentWidth - 2 * screenWidth, 0) animated:NO];
    }
}
//================顶部循环滚动视图函数实现===============================

-(void)unselectCell:(id)sender{
[self.firstTableView deselectRowAtIndexPath:[self.firstTableView indexPathForSelectedRow] animated:YES];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   //跳转等其他操作
  [self performSelector:@selector(unselectCell:) withObject:nil afterDelay:0.5];
}

//=======================cell==========================
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section == 0) {
//        FindTableViewCell *cell = [self.firstTableView dequeueReusableCellWithIdentifier:@"Find" forIndexPath:indexPath];
//        cell.firstLabel.text = @"first";
//        return cell;
//    }
//    return 0;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    FindTableViewCell *cell = [_firstTableView dequeueReusableCellWithIdentifier:@"Find"];
//
//    return cell;
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 3;
//}


@end
