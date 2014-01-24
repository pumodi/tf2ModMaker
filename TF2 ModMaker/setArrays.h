//
//  setArrays.h
//  TF2 ModMaker
//
//  Created by Jeffrey Brice on 1/24/14.
//  Copyright (c) 2014 Spacebooke Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface setArrays : NSObject

@property (nonatomic) NSArray *ambientItemArray;
@property (nonatomic) NSArray *voItemArray;
@property (nonatomic) NSArray *weaponsItemArray;
@property (nonatomic) NSArray *commentaryItemArray;
@property (nonatomic) NSArray *doorsItemArray;
@property (nonatomic) NSArray *itemsItemArray;
@property (nonatomic) NSArray *playerItemArray;
@property (nonatomic) NSArray *physicsItemArray;
@property (nonatomic) NSArray *miscItemArray;
@property (nonatomic) NSArray *uiItemArray;

-(void)setButtonArrays:(id)sender;

@end
