TERMUX_PKG_HOMEPAGE=https://github.com/michalbednarski/TermuxAm
TERMUX_PKG_DESCRIPTION="Android Oreo-compatible am command reimplementation"
TERMUX_PKG_MAINTAINER="Michal Bednarski @michalbednarski"
TERMUX_PKG_VERSION=0.1
TERMUX_PKG_REVISION=1
TERMUX_PKG_SHA256=ed5dcb526d2cabb12754e471f1284822e052550c3206421e1bb889684b97c7b8
TERMUX_PKG_SRCURL=https://github.com/michalbednarski/TermuxAm/archive/v$TERMUX_PKG_VERSION.zip
TERMUX_PKG_PLATFORM_INDEPENDENT=yes
TERMUX_PKG_BUILD_IN_SRC=yes
TERMUX_PKG_CONFLICTS="termux-tools (<< 0.51)"

termux_step_make () {
	export ANDROID_HOME
	./gradlew :app:assembleRelease
}

termux_step_make_install () {
	cp $TERMUX_PKG_SRCDIR/am-libexec-packaged $TERMUX_PREFIX/bin/am
	mkdir -p $TERMUX_PREFIX/libexec/termux-am
	cp $TERMUX_PKG_SRCDIR/app/build/outputs/apk/release/app-release-unsigned.apk $TERMUX_PREFIX/libexec/termux-am/am.apk
}
