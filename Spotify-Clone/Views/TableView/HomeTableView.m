//
//  HomeTableView.m
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/10/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

#import "HomeTableView.h"
#import "Spotify_Clone-Swift.h"

/// Table view for Home screen
@implementation HomeTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self setContentInset:UIEdgeInsetsMake(15.0, 0.0, 0.0, 0.0)];
        [self setShowsVerticalScrollIndicator:NO];
        
        [self registerClass:CarouselTableViewCell.self forCellReuseIdentifier: Common.itemReuseIdentifier];
        [self registerClass:GridTableViewCell.self forCellReuseIdentifier: Common.gridItemReuseIdentifier];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        //
    }
    return self;
}

@end
