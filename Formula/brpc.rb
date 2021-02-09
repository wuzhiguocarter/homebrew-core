class Brpc < Formula
  desc "Industrial-grade RPC framework used throughout Baidu"
  homepage "https://github.com/apache/incubator-brpc"
  url "https://github.com/apache/incubator-brpc/archive/0.9.7.tar.gz"
  sha256 "722cd342baf3b05189ca78ecf6c56ea6ffec22e62fc2938335e4e5bab545a49c"

  depends_on "gnu-getopt" => :build
  depends_on "coreutils" => :build
  depends_on "gflags"
  depends_on "gperftools"
  depends_on "leveldb"
  depends_on "openssl@1.1"
  depends_on "protobuf"

  def install
    system "./config_brpc.sh", "--headers=/usr/local/include",
                               "--libs=/usr/local/lib /usr/local/bin"
    system "make", "-j${nproc}"
    prefix.install Dir["output/*"]
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test brpc`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
