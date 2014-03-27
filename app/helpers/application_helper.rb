module ApplicationHelper
  def human(model_class, attr_name)
    model_class.human_attribute_name(attr_name)
  end

  def boolean_icon(bool)
    return unless bool
    capture_haml do
      haml_tag('i.fa.fa-check')
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to('#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")}) do
      haml_concat(name)
    end
  end
end
