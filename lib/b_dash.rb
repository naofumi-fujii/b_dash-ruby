require "b_dash/version"
require "net/sftp"

module BDash
  class Error < StandardError; end

  # Your code goes here...

  class SFTP
    def self.upload!(username:, hostname:, port:, local_filepath:)
      option = {
        keys: "~/.ssh/id_rsa",
        passphrase: "",
        port: port,
      }

      Net::SFTP.start(hostname, username, option) do |sftp|
        dest = "input/#{File.basename(local_filepath)}"
        puts "#{local_filepath} -> #{dest}"
        sftp.upload!(local_filepath, dest)
      end
    end
  end
end
