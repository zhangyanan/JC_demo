module ProjectHelper
  def project_and_creator project
    content_tag(:div,:class=> 'project_and_creator') do
      project.project_creator.name+ "/"+ project.name
    end
  end
end
