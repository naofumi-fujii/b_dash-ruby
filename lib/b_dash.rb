require "b_dash/version"
require "net/sftp"

module BDash
  class Error < StandardError; end

  # Your code goes here...

  class SFTP
    # username: required for b-dash sftp access.
    # hostname: required for b-dash sftp access.
    # port:     required for b-dash sftp access.
    #
    # local_filepath: path to csv you want to transfer to b-dash. example: '/tmp/users.csv'
    # ssh_key_path:   your ssh file path. example: '~/.ssh/id_rsa'
    def self.upload!(username:, hostname:, port:, local_filepath:, ssh_key_path:)
      option = {
        keys: ssh_key_path,
        passphrase: "",
        port: port,
      }

      Net::SFTP.start(hostname, username, option) do |sftp|
        dest = "input/#{File.basename(local_filepath)}"
        # puts "#{local_filepath} -> #{dest}"
        sftp.upload!(local_filepath, dest)
      end
    end
  end
end
