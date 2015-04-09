require 'formula'

class Sollya < Formula
  homepage 'http://sollya.gforge.inria.fr/'
  url 'https://gforge.inria.fr/frs/download.php/33151/sollya-4.1.tar.gz'
  sha1 'ec8505a7e47d475b88de8e84a8668aa1dc5570c8'

  depends_on 'gmp'
  depends_on 'mpfr'
  depends_on 'mpfi'
  depends_on 'fplll'
  depends_on 'libxml2' unless MacOS.version >= :lion
  depends_on 'gnuplot'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    (testpath/'sample.sollya').write <<-EOS.undent
    1+x==1+x;
    EOS
    system "#{bin}/sollya", "sample.sollya"
  end
end
