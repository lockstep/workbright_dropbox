class DropboxService
  @@client = DropboxApi::Client.new(ENV['DROPBOX_ACCESS_TOKEN']) 

  def self.client
    @@client
  end

  def self.save_url(path, url)
    @@client.save_url(path, url)
  end

  def self.create_folder(path)
    @@client.create_folder(path)
  end

  def self.delete(path)
    @@client.delete(path)
  end

  def self.list_folder(path, options={})
    @@client.list_folder(path, options)
  end

  def self.list_revisions(path, options={})
    @@client.list_revisions(path, options)
  end

  def self.upload(path, content, options={})
    @@client.upload(path, content, options)
  end
end
