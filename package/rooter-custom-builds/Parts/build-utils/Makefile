#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=build-utils
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/build-utils
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=BuildSections
  DEPENDS:=+webconsole +ext-command +nano +picocom +wget +qfirehose +ext-extra \
  		+bwmon +ext-speedtest +kmod-sched-cake +pingtest
  TITLE:=Util packages
  PKGARCH:=all
endef

define Package/build-utils/description
  Util packages
endef


define Build/Compile
endef

$(eval $(call BuildPackage,build-utils))
