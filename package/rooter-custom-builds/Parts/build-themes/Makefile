#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=build-themes
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/build-themes
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=BuildSections
  DEPENDS:=+ext-theme +luci-theme-argon +luci-theme-argondark +ext-login \
		+luci-theme-tomato
  TITLE:=Themes packages
  PKGARCH:=all
endef

define Package/build-themesdescription
  Themes packages
endef


define Build/Compile
endef

$(eval $(call BuildPackage,build-themes))
