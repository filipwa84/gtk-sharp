#!/bin/bash
# Cross-compilation script for Windows glue DLLs
set -e

# Configuration
MINGW_PREFIX=~/src/gtk-sharp/mingw-gtk2/mingw64/mingw64
CC=x86_64-w64-mingw32-gcc
AR=x86_64-w64-mingw32-ar

# Common compiler flags
CFLAGS="-O2 -Wall -shared -DGTK_SHARP_2_6 -DGTK_SHARP_2_8 -DGTK_SHARP_2_10 -DGTK_SHARP_2_12 -DDISABLE_GTHREAD_CHECK -Wno-deprecated-declarations"
INCLUDES="-I$MINGW_PREFIX/include/glib-2.0 \
          -I$MINGW_PREFIX/lib/glib-2.0/include \
          -I$MINGW_PREFIX/include/gtk-2.0 \
          -I$MINGW_PREFIX/lib/gtk-2.0/include \
          -I$MINGW_PREFIX/include/gdk-pixbuf-2.0 \
          -I$MINGW_PREFIX/include/pango-1.0 \
          -I$MINGW_PREFIX/include/atk-1.0 \
          -I$MINGW_PREFIX/include/cairo \
          -I$MINGW_PREFIX/include/harfbuzz \
          -I$MINGW_PREFIX/include/freetype2 \
          -I."

LDFLAGS="-L$MINGW_PREFIX/lib"

echo "Building glibsharpglue-2.dll..."
$CC $CFLAGS $INCLUDES $LDFLAGS \
    -o glib/runtimes/win-x64/native/glibsharpglue-2.dll \
    glib/glue/closure.c \
    glib/glue/error.c \
    glib/glue/object.c \
    glib/glue/ptrarray.c \
    glib/glue/signal.c \
    glib/glue/type.c \
    glib/glue/unichar.c \
    glib/glue/value.c \
    glib/glue/valuearray.c \
    glib/glue/thread.c \
    glib/glue/win32dll.c \
    -lglib-2.0 -lgobject-2.0 -lintl

echo "Building gdksharpglue-2.dll..."
$CC $CFLAGS $INCLUDES $LDFLAGS \
    -o gdk/runtimes/win-x64/native/gdksharpglue-2.dll \
    gdk/glue/device.c \
    gdk/glue/dragcontext.c \
    gdk/glue/event.c \
    gdk/glue/generated.c \
    gdk/glue/selection.c \
    gdk/glue/windowmanager.c \
    gdk/glue/win32dll.c \
    -lgdk-win32-2.0 -lgdk_pixbuf-2.0 -lglib-2.0 -lgobject-2.0 -lintl

echo "Building gtksharpglue-2.dll..."
$CC $CFLAGS $INCLUDES $LDFLAGS \
    -o gtk/runtimes/win-x64/native/gtksharpglue-2.dll \
    gtk/glue/adjustment.c \
    gtk/glue/cellrenderer.c \
    gtk/glue/clipboard.c \
    gtk/glue/colorseldialog.c \
    gtk/glue/container.c \
    gtk/glue/generated.c \
    gtk/glue/nodestore.c \
    gtk/glue/object.c \
    gtk/glue/selectiondata.c \
    gtk/glue/statusicon.c \
    gtk/glue/style.c \
    gtk/glue/targetlist.c \
    gtk/glue/widget.c \
    gtk/glue/win32dll.c \
    -lgtk-win32-2.0 -lgdk-win32-2.0 -lgdk_pixbuf-2.0 -lglib-2.0 -lgobject-2.0 -lintl

echo "Building pangosharpglue-2.dll..."
$CC $CFLAGS $INCLUDES $LDFLAGS \
    -o pango/runtimes/win-x64/native/pangosharpglue-2.dll \
    pango/glue/attribute.c \
    pango/glue/generated.c \
    pango/glue/units.c \
    pango/glue/win32dll.c \
    -lpango-1.0 -lglib-2.0 -lgobject-2.0 -lintl

echo "Building atksharpglue-2.dll..."
$CC $CFLAGS $INCLUDES $LDFLAGS \
    -o atk/runtimes/win-x64/native/atksharpglue-2.dll \
    atk/glue/generated.c \
    atk/glue/hyperlink.c \
    atk/glue/misc.c \
    atk/glue/object.c \
    atk/glue/object_factory.c \
    atk/glue/util.c \
    atk/glue/win32dll.c \
    -latk-1.0 -lglib-2.0 -lgobject-2.0 -lintl

echo "Building gladesharpglue-2.dll..."
$CC $CFLAGS $INCLUDES $LDFLAGS \
    -I$MINGW_PREFIX/include/libglade-2.0 \
    -o glade/runtimes/win-x64/native/gladesharpglue-2.dll \
    glade/glue/generated.c \
    glade/glue/gladexml.c \
    glade/glue/win32dll.c \
    -lgladeui-1 -lgtk-win32-2.0 -lgdk-win32-2.0 -lglib-2.0 -lgobject-2.0 -lxml2 -lintl || echo "Warning: glade glue build failed (libglade may not be available)"

echo "Cross-compilation complete!"
ls -la */runtimes/win-x64/native/*.dll 2>/dev/null || echo "Check for errors above"
