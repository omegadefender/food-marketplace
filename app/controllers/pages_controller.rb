class PagesController < ApplicationController
  def welcome
    @main_header = "Foodtopia"
    @second_header = "Our Mission"
    @website_description = ":Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Phasellus rhoncus. Integer in sapien. Etiam commodo dui eget wisi. Ut tempus purus at lorem. Nullam eget nisl. Mauris dictum facilisis augue. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent id justo in neque elementum ultrices. In convallis. "

  end
end
