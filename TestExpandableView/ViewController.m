//
//  ViewController.m
//  TestExpandableView
//
//  Created by yangzhexu on 2018/6/8.
//  Copyright © 2018 yangzhexuxjtu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;
@property (nonatomic) BOOL toggled;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.view1];
    [self.view addSubview:self.view2];
    [self.view addSubview:self.view3];
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(200));
        make.height.equalTo(@(66));
        make.leading.mas_equalTo(90);
        make.top.mas_equalTo(190);
        make.width.lessThanOrEqualTo(self.view);
        make.height.lessThanOrEqualTo(self.view);

    }];
    
    [self.view2 mas_makeConstraints:^(MASConstraintMaker *make) {

        make.width.equalTo(@(200));
        make.height.equalTo(@(66));
        make.leading.mas_equalTo(90);
        make.top.mas_equalTo(self.view1.mas_bottom).offset(22);
        make.width.lessThanOrEqualTo(self.view);
        make.height.lessThanOrEqualTo(self.view);
    }];

    [self.view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(200));
        make.height.equalTo(@(66));
        make.leading.mas_equalTo(90);
        make.top.mas_equalTo(self.view2.mas_bottom).offset(22);
        make.width.lessThanOrEqualTo(self.view);
        make.height.lessThanOrEqualTo(self.view);
    }];
}

- (void)updateViewConstraints {
    if (self.toggled) {
        [self.view2 mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(200));
            make.height.equalTo(@(166));
            make.leading.mas_equalTo(90);
            make.top.mas_equalTo(self.view1.mas_bottom).offset(22);
            make.width.lessThanOrEqualTo(self.view);
            make.height.lessThanOrEqualTo(self.view);
        }];
        self.toggled = false;
    }else{
        [self.view2 mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.width.equalTo(@(200));
            make.height.equalTo(@(76));
            make.leading.mas_equalTo(90);
            make.top.mas_equalTo(self.view1.mas_bottom).offset(22);
            make.width.lessThanOrEqualTo(self.view);
            make.height.lessThanOrEqualTo(self.view);
        }];
        self.toggled = true;
    }
//    [self.view3 removeFromSuperview];

    [super updateViewConstraints];
}


- (IBAction)epandIt:(id)sender {
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    [UIView animateWithDuration:3.0 animations:^{
        [self.view layoutIfNeeded];
    }];

}

-(UIView *)view1{
    if (_view1 == nil) {
        _view1 = [UIView new];
        _view1.backgroundColor = [UIColor greenColor];
    }
    return _view1;
}

-(UIView *)view2{
    if (_view2 == nil) {
        _view2 = [UIView new];
        _view2.backgroundColor = [UIColor blueColor];
    }
    return _view2;
}

-(UIView *)view3{
    if (_view3 == nil) {
        _view3 = [UIView new];
        _view3.backgroundColor = [UIColor greenColor];
    }
    return _view3;
}


@end
