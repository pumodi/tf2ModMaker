//
//  AppDelegate.h
//  TF2 ModMaker
//
//  Created by Jeffrey Brice on 1/16/14.
//  Copyright (c) 2014 Spacebooke Games. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (unsafe_unretained) IBOutlet NSPanel *panelFirstRun;
@property (weak) IBOutlet NSButton *btnSelectTF2;
@property (weak) IBOutlet NSButton *btnMakeCustomFolder;
@property (weak) IBOutlet NSButton *btnSelectCustomFolder;
@property (weak) IBOutlet NSButton *btnSgroupAmbient;
@property (weak) IBOutlet NSButton *btnSgroupVO;
@property (weak) IBOutlet NSButton *btnSgroupWeapons;
@property (weak) IBOutlet NSButton *btnSgroupCommentary;
@property (weak) IBOutlet NSButton *btnSgroupDoors;
@property (weak) IBOutlet NSButton *btnSgroupPlayer;
@property (weak) IBOutlet NSButton *btnSgroupMisc;
@property (weak) IBOutlet NSButton *btnSgroupPhysics;
@property (weak) IBOutlet NSButton *btnSgroupUI;
@property (weak) IBOutlet NSButton *btnSgroupItems;
@property (weak) IBOutlet NSPopUpButton *btnDropdownSoundToReplace;
@property (weak) IBOutlet NSTextField *textFieldReplacementSound;
@property (weak) IBOutlet NSTextField *textFieldTFDirectoryLocation;
@property (weak) IBOutlet NSTextField *textFieldDefaultCustomFolder;
@property (weak) IBOutlet NSButton *btnSelectReplacementSound;
@property (weak) IBOutlet NSButton *btnPlayPreview;
@property (weak) IBOutlet NSButton *btnStopPreview;
@property (weak) IBOutlet NSButton *btnMakeVPKandMove;
@property (weak) IBOutlet NSButton *btnMove;
@property (weak) IBOutlet NSButton *btnMakeZip;
@property (weak) IBOutlet NSButton *btnMakeVPK;
@property (weak) IBOutlet NSButton *btnShowFirstRun;

@property (nonatomic) NSURL *urlTfDirectory;
@property (nonatomic) NSURL *urlCustomDirectory;
@property (nonatomic) NSURL *urlFilePath;
@property (nonatomic) NSURL *urlModSpecificPath;
@property (nonatomic) NSURL *soundPath;
@property (nonatomic) NSURL *uiPath;
@property (nonatomic) NSURL *physicsPath;
@property (nonatomic) NSURL *playerPath;
@property (nonatomic) NSURL *ambientPath;
@property (nonatomic) NSURL *voPath;
@property (nonatomic) NSURL *weaponsPath;
@property (nonatomic) NSURL *commentaryPath;
@property (nonatomic) NSURL *doorsPath;
@property (nonatomic) NSURL *itemsPath;
@property (nonatomic) NSURL *miscPath;
@property (nonatomic) NSURL *customPath;
@property (nonatomic) int soundGroupTag;
@property (nonatomic) NSString *tfString;
@property (nonatomic) NSString *defaultFolderString;

@property (nonatomic) CFStringRef tfDirectory;
@property (nonatomic) CFStringRef tfDirectoryPath;
@property (nonatomic) CFStringRef customDirectory;
@property (nonatomic) CFStringRef customDirectoryPath;
@property (nonatomic) CFStringRef showFirstRun;
@property (nonatomic) CFBooleanRef showFirstRunBool;

@end
