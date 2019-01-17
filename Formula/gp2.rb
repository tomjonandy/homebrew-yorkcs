class Gp2 < Formula
  desc "Visual, rule-based graph programming language"
  homepage "https://timothyatkinson.github.io/"
  url "https://github.com/UoYCS-plasma/GP2/archive/748fb26.tar.gz"
  sha256 "e81832c2ed8cd43e204ec98e7bbcb5782964ef694fff7b1ce279dcd488e2dfaa"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "bison" => :build
  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on "glib"

  def install
    Dir.chdir "Compiler"
    system "aclocal"
    system "autoconf"
    system "autoreconf", "--install"
    system "automake", "--add-missing", "--foreign"
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
