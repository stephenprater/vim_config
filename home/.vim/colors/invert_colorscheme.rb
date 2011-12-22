require 'ruby-debug'


filename = ARGV[0]

cs = File.open(filename)
csi = File.open(filename.split(/\./).insert(-2,"-inverted").join("."),"w+")

total_i = cs.lines.count
color_lines = {}
comm_lines = {}

cs.rewind

cs.each_line.each_with_index do |c,i|
  if c =~ /^hi/ and c !~ /link/ then
    color_lines[i] = c
  else
    comm_lines[i] = c
  end
end

dup_lines = color_lines.dup
dup_lines.each do |k,v|
  puts v
  color_lines[k] = v.split(/\s{2,}/).inject "" do |memo, i|
    unless i =~ /gui(fg)|(bg)/
      memo << i + "      "
    else
      color_line = i.split(/#(.*?)$/)
      begin
        color_line[1] = color_line[1].scan(/.{2}/).collect { |i| nc = (235 - i.to_i(16)); nc = (nc < 0) ? 0 : nc; '%02x' % nc }.join
      rescue NoMethodError => e
        color_line[1] = "NONE" if e.name == :scan
      end
      if color_line[-1] !~ /\n/
        color_line[1] << "     "
      else
        color_line.pop
        color_line[1] << "\n"
      end
      memo << color_line.join("#")
    end
    memo
  end
  puts color_lines[k]
  puts "-----" * 10
end

0.upto total_i do |i|
  if comm_lines.has_key? i
    csi << comm_lines[i]
  else
    csi << color_lines[i]
  end
end

cs.close
csi.close

