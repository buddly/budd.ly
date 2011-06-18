module ApplicationHelper
  
  
  def ajax_flash(page)
    model = instance_variable_get("@#{params[:controller].singularize}")
    if model
      model.errors.full_messages.each do |msg|
        flash.now[:alert] ||= ''
        flash.now[:alert] << "<div>#{msg}</div>".html_safe
      end
    end
    
    page.replace 'flash-container', :partial => 'shared/flash_messages'
    page << "Buddly.show_flash_messages();"
  end
  
  def form_errors_for(object)
    render :partial => 'shared/form_errors_for', :locals => {:object => object}
    flash.clear
  end
  
  def format_date(date, format)
    if date.present?
      l(@milestone.ends_at, :format => :mdy)
    end
  end
  
  # seems that css3buttons doesn't work with <input> elements, only <a> and
  # <button>, so here's a helper to make <button> submits for forms.
  # 
  # pass in the form builder object and it does the rest.
  # 
  def submit_button_for(builder, value=nil, options={})
    value ||= builder.send(:submit_default_value)
    content_tag(:button, value, options.reverse_merge(:class => 'button big', :id => "#{builder.object_name}_submit"))
  end
  
end
