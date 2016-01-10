module ProjectsHelper
  def format_date(project)
    if project.ended?
      content_tag :strong, 'All Done!'
    else
      "#{distance_of_time_in_words(Time.now, project.pledging_ends_on)} remaining"
    end
  end

  def image_for(project)
    if project.image_file_name.blank?
      image_tag('placeholder.png')
    else
      image_tag(project.image_file_name)
    end
  end

  def format_pledge_link(project)
    if project.funded?
      content_tag :h2, 'Funded'
    else
      link_to new_project_pledge_path(project), class: 'button ok' do
        tag1 = content_tag :h3, 'Pledge!', class: 'title'
        tag2 = content_tag :span, "Only #{number_to_currency(project.amount_outstanding)} left!", class: 'subtitle'
        (tag1 + tag2).html_safe
      end
    end
  end
end
