require 'formula'

class Tmux < Formula
  url 'http://sourceforge.net/projects/tmux/files/tmux/tmux-1.4/tmux-1.4.tar.gz'
  md5 '0bfc7dd9a5bab192406167589c716a21'
  homepage 'http://tmux.sourceforge.net'

  depends_on 'libevent'

  def install
    ENV['PREFIX'] = prefix
    system "./configure"

    inreplace "GNUmakefile" do |s|
      # Put docs in the right place
      s.gsub! "man/man1", "share/man/man1"
    end

    system "make install"
  end
end
