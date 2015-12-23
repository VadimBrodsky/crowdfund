module ProjectsHelper
  def format_date(project)
    if project.ended?
      content_tag :strong, 'All Done!'
    else
      "#{distance_of_time_in_words(Time.now, project.pledging_ends_on)} remaining"
    end
  end
end
