//
//  AppDelegate.m
//  TF2 ModMaker
//
//  Created by Jeffrey Brice on 1/16/14.
//  Copyright (c) 2014 Spacebooke Games. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate
@synthesize urlCustomDirectory, urlFilePath, urlModSpecificPath, urlTfDirectory, soundGroupTag, ambientItemArray, voItemArray, weaponsItemArray, commentaryItemArray, doorsItemArray, itemsItemArray, playerItemArray, physicsItemArray, miscItemArray, uiItemArray, uiPath, voPath, weaponsPath, ambientPath, playerPath, commentaryPath, physicsPath, doorsPath, itemsPath, miscPath, soundPath, customPath;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

}

- (IBAction)selectTfDirectory:(id)sender {
    NSOpenPanel * panelTfDirectory = [NSOpenPanel new];
    
    panelTfDirectory.message = @"Please select your tf directory. You can find it's location by right clicking TF2 in steam -> properties -> local files -> browse local files.";
    panelTfDirectory.canChooseFiles = NO;
    panelTfDirectory.canChooseDirectories = YES;
    panelTfDirectory.allowsMultipleSelection = NO;
    
    if ([panelTfDirectory runModal] == NSFileHandlingPanelOKButton) {
        urlTfDirectory = panelTfDirectory.URL;
        self.textFieldReplacementSound.stringValue = urlTfDirectory.path;
    }
}

- (IBAction)selectCustomDirectory:(id)sender {
    NSOpenPanel * panelCustomDirectory = [NSOpenPanel new];
    
    panelCustomDirectory.message = @"Please select which custom folder you would like your mod stored in.";
    panelCustomDirectory.canChooseFiles = NO;
    panelCustomDirectory.canChooseDirectories = YES;
    panelCustomDirectory.allowsMultipleSelection = NO;
    
    if ([panelCustomDirectory runModal] == NSFileHandlingPanelOKButton) {
        urlCustomDirectory = panelCustomDirectory.URL;
    }
}

- (IBAction)saveCustomDirectory:(id)sender {
    NSSavePanel * panelSaveCustomDirectory = [NSSavePanel new];
    
    panelSaveCustomDirectory.message = @"Please select which custom folder you would like your mod stored in.";
    panelSaveCustomDirectory.canCreateDirectories = YES;
    
    if ([panelSaveCustomDirectory runModal] == NSFileHandlingPanelOKButton) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        urlCustomDirectory = panelSaveCustomDirectory.URL;
        customPath = [NSURL URLWithString:panelSaveCustomDirectory.nameFieldStringValue relativeToURL:urlCustomDirectory];
        soundPath = [NSURL URLWithString:@"sound" relativeToURL:customPath];
        uiPath = [NSURL URLWithString:@"sound/ui" relativeToURL:soundPath];
        physicsPath = [NSURL URLWithString:@"sound/physics" relativeToURL:soundPath];
        playerPath = [NSURL URLWithString:@"sound/player" relativeToURL:soundPath];
        ambientPath = [NSURL URLWithString:@"sound/ambient" relativeToURL:soundPath];
        voPath = [NSURL URLWithString:@"sound/vo" relativeToURL:soundPath];
        weaponsPath = [NSURL URLWithString:@"sound/weapons" relativeToURL:soundPath];
        commentaryPath = [NSURL URLWithString:@"sound/commentary" relativeToURL:soundPath];
        doorsPath = [NSURL URLWithString:@"sound/doors" relativeToURL:soundPath];
        itemsPath = [NSURL URLWithString:@"sound/items" relativeToURL:soundPath];
        miscPath = [NSURL URLWithString:@"sound/misc" relativeToURL:soundPath];
        
        [fileManager createDirectoryAtURL:urlCustomDirectory
              withIntermediateDirectories:NO
                               attributes:nil
                                    error:NULL];
        [fileManager createDirectoryAtURL:soundPath
               withIntermediateDirectories:NO
                                attributes:nil
                                     error:NULL];
        [fileManager createDirectoryAtURL:uiPath
               withIntermediateDirectories:NO
                                attributes:nil
                                     error:NULL];
        [fileManager createDirectoryAtURL:physicsPath
               withIntermediateDirectories:NO
                                attributes:nil
                                     error:NULL];
        [fileManager createDirectoryAtURL:playerPath
               withIntermediateDirectories:NO
                                attributes:nil
                                     error:NULL];
        [fileManager createDirectoryAtURL:ambientPath
               withIntermediateDirectories:NO
                                attributes:nil
                                     error:NULL];
        [fileManager createDirectoryAtURL:voPath
               withIntermediateDirectories:NO
                                attributes:nil
                                     error:NULL];
        [fileManager createDirectoryAtURL:weaponsPath
               withIntermediateDirectories:NO
                                attributes:nil
                                     error:NULL];
        [fileManager createDirectoryAtURL:commentaryPath
               withIntermediateDirectories:NO
                                attributes:nil
                                     error:NULL];
        [fileManager createDirectoryAtURL:doorsPath
               withIntermediateDirectories:NO
                                attributes:nil
                                     error:NULL];
        [fileManager createDirectoryAtURL:itemsPath
               withIntermediateDirectories:NO
                                attributes:nil
                                     error:NULL];
        [fileManager createDirectoryAtURL:miscPath
               withIntermediateDirectories:NO
                                attributes:nil
                                     error:NULL];
    }
}

- (IBAction)changeSoundGroup:(NSButton *)sender {
    switch (sender.tag) {
        case 0:
            soundGroupTag = 1;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)ambientItemArray];
            break;
        case 1:
            soundGroupTag = 2;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)voItemArray];
            break;
        case 2:
            soundGroupTag = 3;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)weaponsItemArray];
            break;
        case 3:
            soundGroupTag = 4;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)commentaryItemArray];
            break;
        case 4:
            soundGroupTag = 5;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)doorsItemArray];
            break;
        case 5:
            soundGroupTag = 6;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)itemsItemArray];
            break;
        case 6:
            soundGroupTag = 7;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)playerItemArray];
            break;
        case 7:
            soundGroupTag = 9;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)physicsItemArray];
            break;
        case 8:
            soundGroupTag = 10;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)miscItemArray];
            break;
        case 9:
            soundGroupTag = 11;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)uiItemArray];
            break;
        default:
            soundGroupTag = 0;
            break;
    }
}

- (IBAction)selectFile:(NSButton *)sender {
    NSOpenPanel * panelOpenFile = [NSOpenPanel new];
    
    panelOpenFile.message = @"Please select your file";
    panelOpenFile.canChooseFiles = YES;
    panelOpenFile.canCreateDirectories = NO;
    panelOpenFile.allowsMultipleSelection = NO;
    
    if ([panelOpenFile runModal] == NSFileHandlingPanelOKButton) {
        urlFilePath = panelOpenFile.URL;
        self.textFieldReplacementSound.stringValue = urlFilePath.path;
    }
}

- (IBAction)addToTempFolder:(id)sender {
    
}

- (IBAction)moveToCustomFolder:(NSButton *)sender {
    NSFileManager *movementManager = [NSFileManager defaultManager];
    [movementManager moveItemAtURL:urlFilePath toURL:urlModSpecificPath error:nil];
}

- (IBAction)makeZip:(NSButton *)sender {
    
}

- (IBAction)previewAudio:(NSButton *)sender {
    
}

@end
