
class Sub < Struct.new :no, :timekey, :text
  
  def to_s
    <<-OUTPUT
##{no}
#{timekey}
#{text}
    OUTPUT
  end
  
end

subs = File.read(ARGV[0]).
  split(/\n\n/).
  map do |e|
    e = e.lines.map(&:chomp)
    Sub.new(e[0], e[1], e.drop(2).join("\n"))
  end
