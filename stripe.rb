# This file was generated by GoReleaser. DO NOT EDIT.
class Stripe < Formula
  desc "Stripe CLI utility"
  homepage "https://stripe.com"
  version "1.2.2"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/stripe/stripe-cli/releases/download/v1.2.2/stripe_1.2.2_mac-os_x86_64.tar.gz"
    sha256 "b2510b606b62dbf49b28dc5b2563b12ee16ad84503a63d357b97bc0e8d8437c7"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/stripe/stripe-cli/releases/download/v1.2.2/stripe_1.2.2_linux_x86_64.tar.gz"
      sha256 "d96f2f30c04f5293ed43cbdf3629daf0c779de0e84bb22ef10a4a43b2bf0e5dd"
    end
  end

  def install
    bin.install "stripe"
    rm Dir["#{bin}/{stripe-completion.bash,stripe-completion.zsh}"]
    system bin/"stripe", "completion", "--shell", "bash"
    system bin/"stripe", "completion", "--shell", "zsh"
    bash_completion.install "stripe-completion.bash"
    zsh_completion.install "stripe-completion.zsh"
    (zsh_completion/"_stripe").write <<~EOS
      #compdef stripe
      _stripe () {
        local e
        e=$(dirname ${funcsourcetrace[1]%:*})/stripe-completion.zsh
        if [[ -f $e ]]; then source $e; fi
      }
    EOS
  end
end
