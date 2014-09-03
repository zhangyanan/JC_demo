#encoding:utf-8
module MenuHelper
  def show_menu
    content_tag(:div, :class => "menu") do
      content_tag(:div, :class => "side_menuTop") do
        #raw(content_tag(:span,:class => "side_menuLeft"){} +  content_tag(:span,:class=>"side_menuTitle") { link_to "菜单管理","#"} + content_tag(:span,:class=>"side_menuRight"){})
      end
      content_tag(:div,:class=>"side_menu") do
        link_to "菜单1","#"
      end
      content_tag(:div,:class=>"side_menuDown") {}
    end

  end
end