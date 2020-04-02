ARCHS = arm64 arm64e
TARGET = iphone:clang:11.2:11.0
GO_EASY_ON_ME = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = rewriteSettings
rewriteSettings_FILES = Tweak.xm UIImage+ScaledImage.m BSProvider.m
rewriteSettings_PRIVATE_FRAMEWORKS = WiFiKitUI
rewriteSettings_EXTRA_FRAMEWORKS = UIKit
rewriteSettings_LIBRARIES = imagepicker
rewriteSettings_CFLAGS +=  -fobjc-arc
rewriteSettings_LDFLAGS += -lCSColorPicker -lCSPreferencesProvider

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += bettersettings
include $(THEOS_MAKE_PATH)/aggregate.mk
