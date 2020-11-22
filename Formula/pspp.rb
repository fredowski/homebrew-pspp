class Pspp < Formula
  desc "statistical analysis of sampled data"
  homepage "https://www.gnu.org/software/pspp"
  url "http://ftp.gnu.org/gnu/pspp/pspp-1.4.0.tar.gz"
  sha256 "631073120c69ed0b6c0b636c2a36486bc616db1b71210dc8e2a358674bcb663f"
  head "https://benpfaff.org/~blp/pspp-master/latest-source.tar.gz"

  depends_on "gtk+3"
  depends_on "gtksourceview3"
  depends_on "adwaita-icon-theme"
  depends_on "gettext"
  depends_on "texinfo" => :build
  depends_on "gdk-pixbuf"
  depends_on "perl" => :build
  depends_on "gsl"
  depends_on "coreutils" => :build
  depends_on "spread-sheet-widget"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "check"
    system "make", "install"
    system "make", "install-html"
  end

  test do
    system "false"
  end
end
