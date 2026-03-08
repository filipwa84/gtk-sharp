# GTK# for .NET

GTK# is a .NET language binding for the GTK+ 2.x toolkit and assorted GNOME libraries. This fork provides .NET 9/10 compatible NuGet packages.

## Packages

| Package | Description |
|---------|-------------|
| **GtkSharp.Glib** | GLib object system bindings |
| **GtkSharp.Cairo** | Cairo 2D graphics bindings |
| **GtkSharp.Atk** | ATK accessibility toolkit bindings |
| **GtkSharp.Pango** | Pango text layout bindings |
| **GtkSharp.Gdk** | GDK windowing bindings |
| **GtkSharp.Gtk** | GTK+ widget toolkit bindings |
| **GtkSharp.Glade** | Glade UI designer bindings |
| **GtkSharp.GtkDotNet** | .NET interop utilities |

## Installation

Add the GitHub Packages source to your NuGet configuration:

```xml
<configuration>
  <packageSources>
    <add key="github" value="https://nuget.pkg.github.com/filipwa84/index.json" />
  </packageSources>
</configuration>
```

Then install the packages:

```bash
dotnet add package GtkSharp.Gtk --version 2.12.50
```

## Requirements

- .NET 9.0 or .NET 10.0
- GTK+ 2.x libraries installed on your system

On Debian/Ubuntu:
```bash
apt-get install libgtk2.0-0 libpango1.0-0 libglade2-0 libcairo2
```

## License

GTK# is free software, licensed under the GNU LGPL.

## Original Project

This is a fork of [mono/gtk-sharp](https://github.com/mono/gtk-sharp) with .NET 9/10 support.
