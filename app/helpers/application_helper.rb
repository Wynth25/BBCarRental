module ApplicationHelper

  def sortable(sort_key, title)
  
    direction = (params[:sort] == sort_key && params[:direction] == "asc") ? "desc" : "asc"

    icon = if params[:sort] == sort_key
             direction == "asc" ? " <i class='fa-solid fa-sort-down'></i>" : " <i class='fa-solid fa-sort-up'></i>"
           else
             " <i class='fa-solid fa-sort' style='color: #ccc; opacity: 0.5;'></i>"
           end

    link_to (title + icon).html_safe, request.params.merge(sort: sort_key, direction: direction), class: "sort-link"
  end
end