#define kBundlePath @"/Library/Application Support/OSXVolumeSound/nl.d4ni.osxvolumesound.bundle"
#import <AudioToolbox/AudioToolbox.h>

NSBundle *bundle = [[[NSBundle alloc] initWithPath:kBundlePath] autorelease];
NSString *sound = [bundle pathForResource:@"volume" ofType:@"aiff"];

%hook VolumeControl
-(void) increaseVolume {
  SystemSoundID soundID;
  AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:sound], &soundID);
  AudioServicesPlaySystemSound(soundID);
  return %orig;
}
%end

%hook VolumeControl
-(void) decreaseVolume {
  SystemSoundID soundID;
  AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:sound], &soundID);
  AudioServicesPlaySystemSound(soundID);
  return %orig;
}
%end
