class ItemController < UITableViewController

  ITEM_CELL_ID = "ItemCell"

  def viewDidLoad
    super

    load_data

    rmq.stylesheet = ItemControllerStylesheet

    view.tap do |table|
      table.delegate = self
      table.dataSource = self
      rmq(table).apply_style :table
    end
  end

  def load_data
    @data = 0.upto(rand(100)).map do |i| # Test data
      {
        name: %w(Lorem ipsum dolor sit amet consectetur adipisicing elit sed).sample,
        num: rand(100),
      }
    end
  end

  def tableView(table_view, numberOfRowsInSection: section)
    @data.length
  end

  def tableView(table_view, heightForRowAtIndexPath: index_path)
    rmq.stylesheet.item_cell_height
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    data_row = @data[index_path.row]

    cell = table_view.dequeueReusableCellWithIdentifier(ITEM_CELL_ID) || begin
      rmq.create(ItemCell, :item_cell, reuse_identifier: ITEM_CELL_ID).get
    end

    cell.update(data_row)
    cell
  end

  # Remove if you are only supporting portrait
  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskAll
  end

  # Remove if you are only supporting portrait
  def willAnimateRotationToInterfaceOrientation(orientation, duration: duration)
    rmq.all.reapply_styles
  end
end
