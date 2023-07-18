//
//  FindTableViewCell.m
//  WangYiYunApp
//
//  Created by 夏楠 on 2023/6/13.
//

#import "FindTableViewCell.h"

@implementation FindTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:@"Find"];
    if ([self.reuseIdentifier isEqual:@"Find"]) {
        
        self.firstImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.firstImageView];
        
        self.firstLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.firstLabel];
        
        
    }
    return self;
}

- (void)layoutSubviews {
    self.firstImageView.frame = CGRectMake(0, 0, 65, 65);
    self.firstLabel.frame = CGRectMake(75, 20, 200, 25);

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
