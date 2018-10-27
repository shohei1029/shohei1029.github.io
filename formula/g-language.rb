# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class GLanguage < Formula
  desc "G-language Genome Analysis Environment provides a greater variety of useful genome analysis tools compared to most existing analysis software packages, and is also easily pluggable."
  homepage "http://www.g-language.org/wiki/Home"
  url "https://ja.osdn.net/dl/glang/g-language-1.9.1.tar.gz"
  sha256 "19d4d35da775245dd8ec5f4532b56613bf22f0ca5dd37dc3a8962d06a588259e"

  # depends_on "cmake" => :build
  depends_on "gd"
  depends_on "gnuplot"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
#    system "./configure", "--disable-debug",
#                          "--disable-dependency-tracking",
#                          "--disable-silent-rules",
#                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "perl", "Makefile.PL"
    system "make"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test g-language`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
#    system "false"
    system "perl", "-e", "use G;"
  end
end

