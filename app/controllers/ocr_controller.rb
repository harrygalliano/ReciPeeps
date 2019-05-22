class OcrController < ApplicationController

  def create
    image = params[:image].tempfile
    response = RestClient.post 'https://api.ocr.space/parse/image',
      file: image, apikey: ENV['OCR_SPACE_API_KEY'], isCreateSearchablePdf: true,
      isSearchablePdfHideTextLayer: true, scale: true
    flash[:ocr_text] = JSON.parse(response.body)['ParsedResults'][0]['ParsedText']
    redirect_to '/recipes/new'
  end
end
