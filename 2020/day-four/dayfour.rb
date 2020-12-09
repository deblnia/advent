file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path)

passes = input.split("\n\n")

expect = %w(byr iyr eyr hgt hcl ecl pid) # getting words 


# part 1 

puts passes.count { |pass| # sets parameters 
    expect.all? { |field| pass.match?(/#{field}:\S+/)} # regexing 
}

# part 2 

DATA = File.read('input.txt').split("\n\n").map{ |line| line.gsub("\n", " ") }

def valid_height? h
    case h
    when /(\d+)cm/
        $1.to_i.between?(150, 193)
    when /(\d+)in/
        $1.to_i.between?(59, 76)
    else
        false
    end
end

PART2 = DATA.count do |passport|
    vals = passport.scan(/(...):([\w\d#]+)/).to_h
    [
        vals["byr"].to_i.between?(1920, 2002),
        vals["iyr"].to_i.between?(2010, 2020),
        vals["eyr"].to_i.between?(2020, 2030),
        valid_height?(vals["hgt"]),
        vals["hcl"] =~ /^#[a-f0-9]{6}$/,
        vals["ecl"] =~ /^(amb|blu|brn|gry|grn|hzl|oth)$/,
        vals["pid"] =~ /^\d{9}$/,
    ].all?
end

puts 'Part 2: %s' % PART2