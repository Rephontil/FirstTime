//
//  ZYWordCell.m
//  Sisters
//
//  Created by ZhouYong on 16/6/23.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYWordCell.h"
#import <UIImageView+WebCache.h>

@implementation ZYWordCell

- (void)setWordModel:(ZYWordModel *)wordModel
{
    _wordModel = wordModel;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:wordModel.profile_image] placeholderImage:[UIImage imageNamed:@"author.jpg"]];
    self.nameLabel.text = wordModel.name;
    
//    self.timeLabel.text = wordModel.create_time;
    [self setLabelText:self.timeLabel date:wordModel.create_time DateFormat:@"yyyy-MM-dd HH:mm:ss"];

    [self setTitleforButton:self.dingBtn Count:wordModel.ding Placeholder:@" ding"];
    [self setTitleforButton:self.caiBtn Count:wordModel.cai Placeholder:@"踩"];
    [self setTitleforButton:self.sharedBtn Count:wordModel.repost Placeholder:@"分享"];
    [self setTitleforButton:self.commentBtn Count:wordModel.comment Placeholder:@"评论"];
    self.contentLabel.text = wordModel.text;
}


//把时间转换成秒的方法并在label上面显示，传入的时间格式可以自由设置
- (void)setLabelText:(UILabel *)label date:(NSString *)date DateFormat:(NSString *)Dateformat
{
    NSDate* now = [NSDate date];
    NSDateFormatter* fmt = [[NSDateFormatter alloc] init];
//    时间的格式可以设置如下形式：
//    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    fmt.dateFormat = Dateformat;
    NSDate* formalDate = [fmt dateFromString:date];
//    NSTimeInterval delta = [now timeIntervalSinceDate:formalDate];
//    label.text = [NSString stringWithFormat:@"%.1f",delta];
    
    NSDateComponents* cmp = [now deltaFrom:formalDate];
    label.text = [NSString stringWithFormat:@"%ld-%ld-%ld %ld:%ld:%ld",(long)cmp.year,(long)cmp.month,(long)cmp.day,(long)cmp.hour,(long)cmp.minute,(long)cmp.second];
    
    
}



//将时间转换成数字格式函数，可以通过dateFromString方法将一个字符串转换成时间格式
- (void)timeTest
{
//    第一种方法：逐一获取
    NSDate * nowDate = [NSDate date];
    NSCalendar * nowCalendar = [NSCalendar currentCalendar];
    NSInteger year = [nowCalendar component:NSCalendarUnitYear fromDate:nowDate];
    NSInteger month = [nowCalendar component:NSCalendarUnitMonth fromDate:nowDate];
    NSInteger day = [nowCalendar component:NSCalendarUnitDay fromDate:nowDate];
    NSInteger hour = [nowCalendar component:NSCalendarUnitHour fromDate:nowDate];
    NSLog(@"%ld %ld %ld %ld",year,month,day,hour);
    /*
     2016-06-23 22:20:27.454 Sisters[21938:1839779] 2016 6 23 22
     */

    
//    第二种方法：一次性获取
    NSDateComponents * DateComponents = [nowCalendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute fromDate:nowDate];
    NSLog(@"%ld %ld %ld %ld %ld",DateComponents.year,DateComponents.month,DateComponents.day,DateComponents.hour,DateComponents.minute);
    /*
     2016-06-23 22:53:24.217 Sisters[22074:1864548] 2016 6 23 22 53
     */
}



//button显示内容封装(适用于访问数量方面的数据处理)
- (void)setTitleforButton:(UIButton *)button
                    Count:(NSInteger)count
              Placeholder:(NSString *)placeholder
{
    if (count > 10000) {
        placeholder = [NSString stringWithFormat:@"%.1f万",count / 10000.0];
    }else if (count > 0)
    {
        placeholder = [NSString stringWithFormat:@"%ld",count];
    }
    [button setTitle:placeholder forState:UIControlStateNormal];
}



//如果我们自己创建的控件不希望外界修改我们的尺寸，我们需要在内部重写setFrame 或者setBounds方法，这样外界就无法修改我们的控件大小
- (void)setFrame:(CGRect)frame{
    static CGFloat margin = 10;
    frame.origin.x = margin;
    frame.size.width -= 2*frame.origin.x;
    frame.size.height -= margin;
//    self.layer.cornerRadius = 10;
    [super setFrame:frame];
}



- (void)awakeFromNib {
//    mainCellBackground
    UIImageView* backImage = [[UIImageView alloc] init];
    backImage.image = [UIImage imageNamed:@"mainCellBackground"];
    self.backgroundView = backImage;
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
