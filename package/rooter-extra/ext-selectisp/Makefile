#Owned by DairyMan@Whirlpool
# 
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=ext-selectisp
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/ext-selectisp
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=Optional Applications
  DEPENDS:=+coreutils-base64 
  TITLE:=support for ISP Selection
  PKGARCH:=all
endef

define Package/ext-selectisp/description
  Helper scripts to add ISP Selection
endef


define Build/Compile
endef

define Package/ext-selectisp/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,ext-selectisp))
