//
//  AppDelegate.m
//  TF2 ModMaker
//
//  Created by Jeffrey Brice on 1/16/14.
//  Copyright (c) 2014 Spacebooke Games. All rights reserved.
//

#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#import "setArrays.h"

@implementation AppDelegate
@synthesize urlCustomDirectory, urlFilePath, urlModSpecificPath, urlTfDirectory, soundGroupTag, uiPath, voPath, weaponsPath, ambientPath, playerPath, commentaryPath, physicsPath, doorsPath, itemsPath, miscPath, soundPath, customPath, textFieldDefaultCustomFolder, textFieldReplacementSound, textFieldTFDirectoryLocation, defaultFolderString, tfString;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
}

// Saves location of tf directory to make selecting/saving custom directories faster
- (IBAction)selectTfDirectory:(id)sender {
    NSOpenPanel * panelTfDirectory = [NSOpenPanel new];
    
    panelTfDirectory.message = @"Please select your tf/custom directory. You can find it's location by right clicking TF2 in steam -> properties -> local files -> browse local files.";
    panelTfDirectory.canChooseFiles = NO;
    panelTfDirectory.canChooseDirectories = YES;
    panelTfDirectory.allowsMultipleSelection = NO;
    panelTfDirectory.showsHiddenFiles = YES;
    
    if ([panelTfDirectory runModal] == NSFileHandlingPanelOKButton) {
        urlTfDirectory = panelTfDirectory.URL;
        tfString = [panelTfDirectory.URL absoluteString];
        
        textFieldTFDirectoryLocation.stringValue = tfString;
    }
}

// Selects a directory to store the mod in. Creates subdirectories if they do not exist
- (IBAction)selectCustomDirectory:(id)sender {
    NSOpenPanel * panelCustomDirectory = [NSOpenPanel new];
    
    panelCustomDirectory.message = @"Please select which custom folder you would like your mod stored in.";
    panelCustomDirectory.canChooseFiles = NO;
    panelCustomDirectory.canChooseDirectories = YES;
    panelCustomDirectory.allowsMultipleSelection = NO;
    if (urlTfDirectory != nil) {
        [panelCustomDirectory setDirectoryURL:urlTfDirectory];
    }
    
    if ([panelCustomDirectory runModal] == NSFileHandlingPanelOKButton) {
        defaultFolderString = [panelCustomDirectory.URL absoluteString];
        textFieldDefaultCustomFolder.stringValue = defaultFolderString;

        
        // Defines URLs for directories
        urlCustomDirectory = panelCustomDirectory.URL;
        customPath = [NSURL URLWithString:panelCustomDirectory.nameFieldStringValue];
        NSString *soundString = [NSString stringWithFormat:@"%@/sound", customPath];
        soundPath = [NSURL URLWithString:@"sound" relativeToURL:urlCustomDirectory];
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
        
        // Converts URLs to strings for fileExistsAtPath comparison
        NSString *physicsString = [physicsPath absoluteString];
        NSString *playerString = [playerPath absoluteString];
        NSString *ambientString = [ambientPath absoluteString];
        NSString *voString = [voPath absoluteString];
        NSString *weaponsString = [weaponsPath absoluteString];
        NSString *commentaryString = [commentaryPath absoluteString];
        NSString *doorsString = [doorsPath absoluteString];
        NSString *itemsString = [itemsPath absoluteString];
        NSString *miscString = [miscPath absoluteString];
        NSString *uiString = [uiPath absoluteString];
        
        // Checks if directory exists and creates it if it doesn't
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if ([fileManager fileExistsAtPath:soundString]) {
            if (![fileManager fileExistsAtPath:uiString]) {
                [fileManager createDirectoryAtURL:uiPath
                      withIntermediateDirectories:YES
                                       attributes:nil
                                            error:NULL];
            }
            if (![fileManager fileExistsAtPath:physicsString]) {
                [fileManager createDirectoryAtURL:physicsPath
                      withIntermediateDirectories:NO
                                       attributes:nil
                                            error:NULL];
            
            }
            if (![fileManager fileExistsAtPath:playerString]) {
                [fileManager createDirectoryAtURL:playerPath
                      withIntermediateDirectories:NO
  
                                       attributes:nil
                                            error:NULL];
            }
            if (![fileManager fileExistsAtPath:ambientString]) {
                [fileManager createDirectoryAtURL:ambientPath
                      withIntermediateDirectories:NO
                                       attributes:nil
                                            error:NULL];
            }
            if (![fileManager fileExistsAtPath:voString]) {
                [fileManager createDirectoryAtURL:voPath
                      withIntermediateDirectories:NO
                                       attributes:nil
                                            error:NULL];
            }
            if (![fileManager fileExistsAtPath:weaponsString]) {
                [fileManager createDirectoryAtURL:weaponsPath
                      withIntermediateDirectories:NO
                                       attributes:nil
                                            error:NULL];
            }
            if (![fileManager fileExistsAtPath:commentaryString]) {
                [fileManager createDirectoryAtURL:commentaryPath
                      withIntermediateDirectories:NO
                                       attributes:nil
                                            error:NULL];
            }
            if (![fileManager fileExistsAtPath:doorsString]) {
                [fileManager createDirectoryAtURL:doorsPath
                      withIntermediateDirectories:NO
                                       attributes:nil
                                            error:NULL];
            }
            if (![fileManager fileExistsAtPath:itemsString]) {
                [fileManager createDirectoryAtURL:itemsPath
                      withIntermediateDirectories:NO
                                       attributes:nil
                                            error:NULL];
            }
            if (![fileManager fileExistsAtPath:miscString]) {
                [fileManager createDirectoryAtURL:miscPath
                      withIntermediateDirectories:NO
                                       attributes:nil
                                            error:NULL];
            }
        }
        else {
            [fileManager createDirectoryAtURL:soundPath
                  withIntermediateDirectories:NO
                                   attributes:nil
                                        error:NULL];
            if (![fileManager fileExistsAtPath:uiString]) {
                [fileManager createDirectoryAtURL:uiPath
                      withIntermediateDirectories:YES
                                       attributes:nil
                                            error:NULL];
            }
            if (![fileManager fileExistsAtPath:physicsString]) {
                [fileManager createDirectoryAtURL:physicsPath
                      withIntermediateDirectories:NO
                                       attributes:nil
                                            error:NULL];
                
            }
            if (![fileManager fileExistsAtPath:playerString]) {
                [fileManager createDirectoryAtURL:playerPath
                      withIntermediateDirectories:NO
                                       attributes:nil
                                            error:NULL];
            }
            if (![fileManager fileExistsAtPath:ambientString]) {
                [fileManager createDirectoryAtURL:ambientPath
                      withIntermediateDirectories:NO
                                       attributes:nil
                                            error:NULL];
            }
            if (![fileManager fileExistsAtPath:voString]) {
                [fileManager createDirectoryAtURL:voPath
                      withIntermediateDirectories:NO
                                       attributes:nil
                                            error:NULL];
            }
            if (![fileManager fileExistsAtPath:weaponsString]) {
                [fileManager createDirectoryAtURL:weaponsPath
                      withIntermediateDirectories:NO
                                       attributes:nil
                                            error:NULL];
            }
            if (![fileManager fileExistsAtPath:commentaryString]) {
                [fileManager createDirectoryAtURL:commentaryPath
                      withIntermediateDirectories:NO
                                       attributes:nil
                                            error:NULL];
            }
            if (![fileManager fileExistsAtPath:doorsString]) {
                [fileManager createDirectoryAtURL:doorsPath
                      withIntermediateDirectories:NO
                                       attributes:nil
                                            error:NULL];
            }
            if (![fileManager fileExistsAtPath:itemsString]) {
                [fileManager createDirectoryAtURL:itemsPath
                      withIntermediateDirectories:NO
                                       attributes:nil
                                            error:NULL];
            }
            if (![fileManager fileExistsAtPath:miscString]) {
                [fileManager createDirectoryAtURL:miscPath
                      withIntermediateDirectories:NO
                                       attributes:nil
                                            error:NULL];
            }

        }
        
    }
}

// Creates a directory to store the mod in. Creates all subdirectories
- (IBAction)saveCustomDirectory:(id)sender {
    NSSavePanel * panelSaveCustomDirectory = [NSSavePanel new];
    
    panelSaveCustomDirectory.message = @"Please select which custom folder you would like your mod stored in.";
    panelSaveCustomDirectory.canCreateDirectories = YES;
    if (urlTfDirectory != nil) {
        [panelSaveCustomDirectory setDirectoryURL:urlTfDirectory];
    }
    
    if ([panelSaveCustomDirectory runModal] == NSFileHandlingPanelOKButton) {
        defaultFolderString = [panelSaveCustomDirectory.URL absoluteString];
        textFieldDefaultCustomFolder.stringValue = defaultFolderString;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        // Defines URls to create directories
        urlCustomDirectory = panelSaveCustomDirectory.URL;
        customPath = [NSURL URLWithString:panelSaveCustomDirectory.nameFieldStringValue];
        NSString *soundString = [NSString stringWithFormat:@"%@/sound", customPath];
        soundPath = [NSURL URLWithString:soundString relativeToURL:urlCustomDirectory];
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
        NSString *uiString = [uiPath absoluteString];
        NSLog(@"%@", uiString);
    
        // Creates directories relative to mod root folder
        [fileManager createDirectoryAtURL:urlCustomDirectory
              withIntermediateDirectories:YES
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

// Changes available sounds in the dropdown menu
- (IBAction)changeSoundGroup:(NSButton *)sender {
    setArrays *arraySetter = [[setArrays alloc] init];
    [arraySetter setButtonArrays:sender];
    switch (sender.tag) {
        case 0:
            soundGroupTag = 1;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)arraySetter.ambientItemArray];
            urlModSpecificPath = ambientPath;
            break;
        case 1:
            soundGroupTag = 2;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)arraySetter.voItemArray];
            urlModSpecificPath = voPath;
            break;
        case 2:
            soundGroupTag = 3;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)arraySetter.weaponsItemArray];
            urlModSpecificPath = weaponsPath;
            break;
        case 3:
            soundGroupTag = 4;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)arraySetter.commentaryItemArray];
            urlModSpecificPath = commentaryPath;
            break;
        case 4:
            soundGroupTag = 5;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)arraySetter.doorsItemArray];
            urlModSpecificPath = doorsPath;
            break;
        case 5:
            soundGroupTag = 6;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)arraySetter.itemsItemArray];
            urlModSpecificPath = itemsPath;
            break;
        case 6:
            soundGroupTag = 7;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)arraySetter.playerItemArray];
            urlModSpecificPath = playerPath;
            break;
        case 7:
            soundGroupTag = 9;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)arraySetter.physicsItemArray];
            urlModSpecificPath = physicsPath;
            break;
        case 8:
            soundGroupTag = 10;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)arraySetter.miscItemArray];
            urlModSpecificPath = miscPath;
            break;
        case 9:
            soundGroupTag = 11;
            [_btnDropdownSoundToReplace removeAllItems];
            [_btnDropdownSoundToReplace addItemsWithTitles:(NSArray *)arraySetter.uiItemArray];
            urlModSpecificPath = uiPath;
            break;
        default:
            soundGroupTag = 0;
            urlModSpecificPath = soundPath;
            break;
    }
}

// Selects an audio file
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

// Renames current file and moves it to the selected custom folder
- (IBAction)moveToCustomFolder:(NSButton *)sender {
    NSFileManager *movementManager = [NSFileManager defaultManager];
    NSString *urlModString = [soundPath absoluteString];
    NSString *newFileName = _btnDropdownSoundToReplace.titleOfSelectedItem;
    NSString *newPath = [NSString stringWithFormat:@"%@/%@", urlModString, newFileName];
    NSURL *newUrl = [NSURL URLWithString:newPath];
    [movementManager copyItemAtURL:urlFilePath toURL:newUrl error:nil];
    
   // if ([movementManager fileExistsAtPath:newPath]) {
        NSAlert *moveSuceeded = [[NSAlert alloc] init];
        [moveSuceeded  setMessageText: @"Your file has been processed!"];
        [moveSuceeded  setAlertStyle: NSInformationalAlertStyle];
        [moveSuceeded  runModal];
   // }
  /*  else {
        NSAlert *moveFailed = [[NSAlert alloc] init];
        [moveFailed setMessageText: @"Processing the file has failed, please try again."];
        [moveFailed setInformativeText:@"This could be caused by using the wrong type of file or not specifying your TF/Custom Mod Directory"];
        [moveFailed setAlertStyle: NSWarningAlertStyle];
        [moveFailed runModal];
    } */
}

// Makes a zip file of all files in the custom folder and stores it on the desktop
/* - (IBAction)makeZip:(NSButton *)sender {
    
}*/

// Plays back the selected audio file
/* - (IBAction)previewAudio:(NSButton *)sender {
    NSURL *audioFile = urlFilePath;
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioFile error:nil];
    [audioPlayer setNumberOfLoops:0];
    audioPlayer.rate = 1.0;
    audioPlayer.volume = 1.0;
    [audioPlayer play];
} */

-(IBAction)changeFirstRunDefault:(NSButton *)sender {

}

@end
