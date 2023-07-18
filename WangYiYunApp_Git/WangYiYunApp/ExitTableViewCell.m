//
//  exitTableViewCell.m
//  WangYiYunApp
//
//  Created by 夏楠 on 2023/6/7.
//

#import "ExitTableViewCell.h"

@implementation ExitTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"exit"]) {
        
        self.exit = [[UILabel alloc] init];
        [self.contentView addSubview:self.exit];
        
    }
    return self;
}

- (void)layoutSubviews {
    self.exit.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 60, 0, 120, 60);
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
