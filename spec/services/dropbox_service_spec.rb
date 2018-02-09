require 'webmock'
include WebMock::API
WebMock.allow_net_connect!

describe DropboxService do
  describe '#create a folder' do
    before do
      begin
      DropboxService.delete('/test_folder')
      rescue
      end
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
    it 'can create a file from a url' do
      DropboxService.save_url('/google.html', 'https://www.google.com')
      expect(
        DropboxService.list_revisions('/google.html')
      ).to be_a(DropboxApi::Results::ListRevisionsResult)
    end
  end

  describe '#upload' do
    after do
      begin
        DropboxService.delete('/binary_string_data')
      rescue
      end
    end
    context 'data contains binary string' do
      it 'can upload the file with binary string' do
        data = "\xAB\xCD\xEF"
        DropboxService.upload('/binary_string_data', data)
        expect(
          DropboxService.list_revisions('/binary_string_data')
        ).to be_a(DropboxApi::Results::ListRevisionsResult)
      end
    end
  end
end
