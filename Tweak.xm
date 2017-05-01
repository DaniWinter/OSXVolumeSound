#define kBundlePath @"/Library/Application Support/OSXVolumeSound/nl.d4ni.osxvolumesound.bundle"
#import <AudioToolbox/AudioToolbox.h>

NSBundle *bundle = [[[NSBundle alloc] initWithPath:kBundlePath] autorelease];
NSString *sound = [bundle pathForResource:@"volume" ofType:@"aiff"];

static void playOSX() {
  SystemSoundID soundID;
  AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:sound], &soundID);
  AudioServicesPlaySystemSound(soundID);
}

%hook VolumeControl
-(void) increaseVolume {
  playOSX();
  return %orig;
}
-(void) decreaseVolume {
  playOSX();
  return %orig;
}
%end
