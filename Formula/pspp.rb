class Pspp < Formula
  desc "statistical analysis of sampled data"
  homepage "https://www.gnu.org/software/pspp"
  url "https://ftp.gnu.org/gnu/pspp/pspp-1.6.2.tar.gz"
  sha256 "73294ca2f5b2f7fc41bbf8b78c5888c8075f43c6097fd482abb04f85ab0847b6"
  head "https://benpfaff.org/~blp/pspp-master/latest-source.tar.gz"

  option "with-relocation", "Build a relocatable application which is required for a bundle"

  depends_on "glib" => :build
  depends_on "gtk+3"
  depends_on "gtksourceview4"
  depends_on "adwaita-icon-theme"
  depends_on "gettext"
  depends_on "texinfo" => :build
  depends_on "gdk-pixbuf"
  depends_on "python" => :build
  depends_on "gsl"
  depends_on "coreutils" => :build
  depends_on "spread-sheet-widget"

  def install
    args = ["--disable-dependency-tracking",
            "--disable-silent-rules"]
    if build.with? "relocation"
      args << "--enable-relocatable"
      args << "--disable-rpath"
    end
    system "./configure", "--disable-debug",
                          "--without-perl-module",
                          *args,
                          "--prefix=#{prefix}"
    system "make"
    system "make", "check"
    system "make", "install"
    system "make", "html"
    system "make", "install-html"
  end

  test do
    system "false"
  end
end
