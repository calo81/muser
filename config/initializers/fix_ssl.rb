require 'open-uri'
require 'net/https'

module Net
  class HTTP
    alias_method :original_use_ssl=, :use_ssl=

    def use_ssl=(flag)
      # Ubuntu
      if File.exists?('/etc/ssl/certs')
        self.ca_path = '/etc/ssl/certs'

      # MacPorts on OS X
      # You'll need to run: sudo port install curl-ca-bundle
      elsif File.exists?('/opt/local/share/curl/curl-ca-bundle.crt')
        self.ca_file = '/opt/local/share/curl/curl-ca-bundle.crt'
      end

      self.verify_mode = OpenSSL::SSL::VERIFY_PEER
      self.original_use_ssl = flag
    end
  end
end