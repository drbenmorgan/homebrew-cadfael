require 'formula'

# Please don't update me to the 2.x branch yet until issues discussed in
# https://github.com/Homebrew/homebrew/issues/45812 are resolved.
# If you want 2.x now, file a PR in homebrew/versions. Thanks!

class Gsl < Formula
  homepage 'http://www.gnu.org/software/gsl/'
  stable do
    url 'http://ftpmirror.gnu.org/gsl/gsl-1.15.tar.gz'
    mirror 'http://ftp.gnu.org/gnu/gsl/gsl-1.15.tar.gz'
    sha1 'd914f84b39a5274b0a589d9b83a66f44cd17ca8e'
  end

  devel do
    url 'http://ftpmirror.gnu.org/gsl/gsl-1.16.tar.gz'
    sha256 "73bc2f51b90d2a780e6d266d43e487b3dbd78945dd0b04b14ca5980fe28d2f53"
  end

  option :universal

  def install
    ENV.universal_binary if build.universal?

    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make" # A GNU tool which doesn't support just make install! Shameful!
    system "make install"

  end

  test do
    system bin/"gsl-randist", "0", "20", "cauchy", "30"
  end
end
