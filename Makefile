ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
THEOS_BUILD_DIR = debs

include theos/makefiles/common.mk

TWEAK_NAME = OSXVolumeSound
OSXVolumeSound_FILES = Tweak.xm
OSXVolumeSound_PRIVATE_FRAMEWORKS  = AudioToolbox

include $(THEOS_MAKE_PATH)/tweak.mk

BUNDLE_NAME = nl.d4ni.osxvolumesound

nl.d4ni.osxvolumesound_INSTALL_PATH = /Library/Application Support/OSXVolumeSound

include $(THEOS)/makefiles/bundle.mk

after-install::
	install.exec "killall -9 SpringBoard"
