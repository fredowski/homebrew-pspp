class Pspp < Formula
  desc "statistical analysis of sampled data"
  homepage "https://www.gnu.org/software/pspp"
  url "http://ftp.gnu.org/gnu/pspp/pspp-1.2.0.tar.gz"
  sha256 "a50e437974cff8d57f41ba87026509c9c383474e52717944ea6565e6ff11f71e"

  depends_on "gtk+3"
  depends_on "gtksourceview3"
  depends_on "gettext"
  depends_on "texinfo"
  depends_on "gdk-pixbuf"
  depends_on "spread-sheet-widget"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "false"
  end
end
