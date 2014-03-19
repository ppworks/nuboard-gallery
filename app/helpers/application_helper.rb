module ApplicationHelper
  def boolean_icon(bool)
    return unless bool
    capture_haml do
      haml_tag('i.fa.fa-check')
    end
  end
end
