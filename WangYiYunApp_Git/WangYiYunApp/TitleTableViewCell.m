//
//  titleTableViewCell.m
//  WangYiYunApp
//
//  Created by 夏楠 on 2023/6/8.
//

#import "TitleTableViewCell.h"

@implementation TitleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"title"]) {
        
        self.title = [[UILabel alloc] init];
        [self.contentView addSubview:self.title];

    }
    return self;
}

- (void)layoutSubviews{
    self.title.frame = CGRectMake(17, 0, 200, 40);
    self.title.font = [UIFont systemFontOfSize:14];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
