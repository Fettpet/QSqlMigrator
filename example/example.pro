# Copyright (C) 2014, HicknHack Software
# All rights reserved.
# Contact: http://www.hicknhack-software.com/contact
#
# This file is part of the QSqlMigrator
#
# GNU Lesser General Public License Usage
# This file may be used under the terms of the GNU Lesser
# General Public License version 2.1 as published by the Free Software
# Foundation and appearing in the file LICENSE.LGPL included in the
# packaging of this file.  Please review the following information to
# ensure the GNU Lesser General Public License version 2.1 requirements
# will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
#
# GNU General Public License Usage
# Alternatively, this file may be used under the terms of the GNU
# General Public License version 3.0 as published by the Free Software
# Foundation and appearing in the file LICENSE.GPL3 included in the
# packaging of this file.  Please review the following information to
# ensure the GNU General Public License version 3.0 requirements will be
# met: http://www.gnu.org/copyleft/gpl.html.
TARGET=Example
PROJECT_ROOT = $$PWD/..

!exists(Config.h) {
  system($$QMAKE_COPY Config.h.example Config.h)
}

SOURCES += \
    example.cpp \
    MyAppMigrator.cpp \
    M201503301340654_CreateUsers.cpp

HEADERS += \
    Config.h \
    Config.h.example \
    MyAppMigrator.h \
    M201503301340654_CreateUsers.h

include($$PROJECT_ROOT/build/qmake/_test.pri)

# SqliteMigrator {
LIBS += -lSqliteMigrator

DEPENDPATH += $$LIB_PATH

win32: PRE_TARGETDEPS += $$LIB_PATH/SqliteMigrator.dll
else: PRE_TARGETDEPS += $$LIB_PATH/libSqliteMigrator.so
# }
