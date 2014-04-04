class ItemCell < UITableViewCell 

  def rmq_build
    rmq(self.contentView).tap do |q|
      # Add your subviews, init stuff here
      # @foo = q.append(UILabel, :foo).get
      #
      # Or use the built-in table cell controls, if you don't use 
      # these, they won't exist at runtime
      # q.build(self.imageView, :cell_image)
      @name = q.build(self.textLabel, :cell_label).get
      @detail = q.append(self.detailTextLabel, :cell_detail_label).get
    end
  end

  def update(data)
    # Update data here
    @name.text = data[:name]
    @detail.text = "test"
  end

end
