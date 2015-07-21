module NotesHelper
  def preview_text(text, length=140)
    if length <= length
      text
    else
      "#{text[0..length]}..."
    end
  end

  def separate_with_commas(text)
    # used to separate tag_list when editing.
    text.split(" ").join(", ")
  end
end
