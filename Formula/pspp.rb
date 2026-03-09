class Pspp < Formula
  desc "statistical analysis of sampled data"
  homepage "https://www.gnu.org/software/pspp"
  url "https://ftpmirror.gnu.org/gnu/pspp/pspp-2.1.1.tar.gz"
  sha256 "b5e550937bdfa66a1e6ca729195272e8e5e66b3e04686b2d83fb2e66d4ef14c3"
  head "https://benpfaff.org/~blp/pspp-master/latest-source.tar.gz"

  option "with-relocation", "Build a relocatable application which is required for a bundle"

  depends_on "glib" => :build
  depends_on "readline"
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
  depends_on "libiconv"

  def install
    args = ["--disable-dependency-tracking",
            "--disable-silent-rules"]
    if build.with? "relocation"
      args << "--enable-relocatable"
      args << "--disable-rpath"
    end
    libiconv = Formula["libiconv"]
    system "./configure", "--disable-debug",
                          "--without-perl-module",
                          "--without-libiconv-prefix",
                          "--with-libiconv-prefix=#{libiconv.opt_prefix}",
                          "CPPFLAGS=-I#{HOMEBREW_PREFIX}/opt/readline/include",
                          "LDFLAGS=-L#{HOMEBREW_PREFIX}/opt/readline/lib",
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
