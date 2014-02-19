
TEST_NAME=Api
include(../auto.pri)

DEFINES += SRCDIR=\\\"$$PWD/\\\"

!exists(ApiConfig.h) {
  system($$QMAKE_COPY ApiConfig.h.example ApiConfig.h)
}

# depends SqliteMigrator.lib {
CONFIG(release, debug|release): LIBS += -lSqliteMigrator
else:CONFIG(debug, debug|release): LIBS += -lSqliteMigratord

INCLUDEPATH += $$QSQLMIGRATOR_ROOT/plugins
DEPENDPATH += $$DESTDIR

win32:CONFIG(release, debug|release): PRE_TARGETDEPS += $$LIB_PATH/SqliteMigrator.dll
else:win32:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$LIB_PATH/SqliteMigratord.dll
else:unix:CONFIG(release, debug|release): PRE_TARGETDEPS += $$LIB_PATH/libSqliteMigrator.so
else:unix:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$LIB_PATH/libSqliteMigratord.so
# }

SOURCES += tst_ApiTest.cpp \
	 M20132201_180943_CreateCars.cpp \
	 M20132201_175827_CreateAddresses.cpp \
	 M20131501_191807_CreateUsers.cpp \
	 M20133001_164323_AddUsers.cpp \
	 SqliteAddUser.cpp

HEADERS += \
	 M20132201_180943_CreateCars.h \
	 M20132201_175827_CreateAddresses.h \
	 M20131501_191807_CreateUsers.h \
	 M20133001_164323_AddUsers.h \
	 SqliteAddUser.h \
	 ApiConfig.h \
	 ApiConfig.h.example
