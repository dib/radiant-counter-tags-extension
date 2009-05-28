module CounterTags
  include Radiant::Taggable

  desc "Prints the next consecutive integer." 
  tag "counter" do |tag|
    tag.globals.counter += 1 if tag.globals.counter
    tag.globals.counter = 0 unless tag.globals.counter
    return tag.globals.counter
  end
end