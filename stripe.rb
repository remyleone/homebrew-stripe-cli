# This file was generated by GoReleaser. DO NOT EDIT.
class Stripe < Formula
  desc "Stripe CLI utility"
  homepage "https://stripe.com"
  version "0.9.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/stripe/stripe-cli/releases/download/v0.9.1/stripe_0.9.1_mac-os_x86_64.tar.gz"
    sha256 "377c45af0487fd9463811dfba7e56829a83d4d90cb6cd57ebec125859a775077"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/stripe/stripe-cli/releases/download/v0.9.1/stripe_0.9.1_linux_x86_64.tar.gz"
      sha256 "5d4b68106729f02e142bfbb7d71bccfb5266ac59abde27584e28986aeb2208b6"
    end
  end

  def install
    bin.install "stripe"
    rm Dir["#{bin}/{stripe-completion.bash,stripe-completion.zsh}"]
    system bin/"stripe", "completion"
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
