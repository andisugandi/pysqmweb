class App < Sinatra::Base
  require 'sinatra'

  get '/' do
    @title = "Galeri Data SQM"
    @pictures = picture_urls.map { |url| {
      :picture_url => url,
      :picture_name => url.slice(10..17),
      :page_url => url.sub(/\.\w+$/, '.html')
      }
    }
    erb :index
  end

  get '/pictures/:picture.html' do
    @picture = params['picture']
    @picture_url = find_picture_url(params['picture']) or halt 404
    @dat_file = find_data_url(params['picture'])
    if @dat_file != nil
      @dat_file_name = @dat_file.sub('/data/', '')
      @dat_file_title = @dat_file.slice(6..@dat_file.length-1)
      @dat_file_url = @dat_file or halt 404
      @title = @dat_file_title
      erb :picture
    else
      @picture_file_title = @picture_url.slice(10..@picture_url.length-1)
      @title = @picture_file_title
      erb :picture_no_dat
    end
  end

  not_found do
    "Page Not Found"
  end

  def picture_urls
    Dir.glob('public/pictures/**').map { |path| path.sub('public', '') }
  end

  def find_picture_url(basename)
    picture_urls.select { |path| File.basename(path, '.*') == basename }.first
  end

  def data_urls
    Dir.glob('public/data/**').map { |path| path.sub('public', '') }
  end

  def find_data_url(basename)
    data_urls.select { |path| File.basename(path, '.*') == basename }.first
  end
end