require 'webmock'
include WebMock::API
WebMock.allow_net_connect!

describe DropboxService do
  describe '#create a folder' do
    before do
      DropboxService.delete('/test_folder')
    end
    it 'can create a folder' do
      DropboxService.create_folder('/test_folder')
      expect(DropboxService.list_folder('/test_folder'))
        .to be_a(DropboxApi::Results::ListFolderResult)
    end
  end

  describe '#save_url' do
    after do
      begin
        DropboxService.delete('/google.html')
      rescue
      end
    end
    it 'can save a file from a url' do
      DropboxService.save_url('/google.html', 'https://www.google.com')
      expect(
        DropboxService.list_revisions('/google.html')
      ).to be_a(DropboxApi::Results::ListRevisionsResult)
    end
  end
end
