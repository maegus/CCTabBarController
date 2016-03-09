//
//  CCTabBarItem.m
//  Pods
//
//  Created by Draveness on 16/3/9.
//
//

#import "CCTabBarItem.h"
#import "UIImage+Color.h"
#import <Masonry/Masonry.h>

@interface CCTabBarItem ()

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *promptLabel;

@end

@implementation CCTabBarItem

- (instancetype)initWithMaker:(void (^)(CCTabBarItem *))maker {
    if (self = [super init]) {
        _backgroundImageView = [[UIImageView alloc] init];

        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.contentMode = UIViewContentModeCenter;

        _promptLabel = [[UILabel alloc] init];

        [self addSubview:_backgroundImageView];
        [self addSubview:_iconImageView];
        [self addSubview:_promptLabel];

        [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];

        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];

        maker(self);

        [self addTarget:self action:@selector(ha)
       forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    if (highlighted) {
        self.backgroundImageView.image = self.highlightedBackgroundImage;
        self.iconImageView.image = self.highlightedImage;
    } else {
        self.backgroundImageView.image = self.normalBackgroundImage;
        self.iconImageView.image = self.normalImage;
    }
}

- (void)ha {

}

@end
