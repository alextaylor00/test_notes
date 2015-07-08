module NotesHelper
  def preview_text(text, length=140)
    if length <= length
      text
    else
      "#{text[0..length]}..."
    end
  end
end
