//
//  TransparentCell.m
//  TransparentCell
//
//  Created by shan on 2018/6/20.
//  Copyright © 2018年 shan. All rights reserved.
//

#import "TransparentCell.h"

@interface TransparentCell ()

@property(nonatomic,strong) UIImage *image;
@property(nonatomic,assign) CGFloat imageViewWidth;
@property(nonatomic,assign) CGFloat imageViewHeight;

@end

@implementation TransparentCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor redColor];
        self.imageViewWidth = self.frame.size.width;
        self.imageViewHeight = 200;
        UIImageView *imageVIew = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.imageViewWidth, self.imageViewHeight)];
        imageVIew.backgroundColor = [UIColor orangeColor];
        imageVIew.tag = 1000;
        
        self.image = [UIImage imageNamed:@"test"];
       
        [self.contentView addSubview:imageVIew];
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = self.frame.origin.y - scrollView.contentOffset.y ;
    //    NSLog(@"-=-=-=: %f",y);
    
    CGFloat ff =  scrollView.frame.size.height - y;
    
//    NSLog(@"-=rrr-=-=: %f",ff);//ff从负值到等于0的时候，cell从底部开始出现
    
    UIImageView *imageView = [self.contentView viewWithTag:1000];
    imageView.contentMode = UIViewContentModeTop;
    
    if (ff > scrollView.frame.size.height) {
        imageView.contentMode = UIViewContentModeBottom;
    }
    
    CGRect rect = CGRectMake(0,   self.image.size.height - ff , self.image.size.width, ff < self.imageViewHeight? ff:self.imageViewHeight);
    NSLog(@"======: %@",NSStringFromCGRect(rect));
    CGImageRef imageRef=CGImageCreateWithImageInRect([self.image CGImage],rect);
    UIImage *image1=[UIImage imageWithCGImage:imageRef];
    imageView.image = image1;
}
@end
