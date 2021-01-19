cohort_list = {
  "onl01-seng-ft-110920-a" => {
    :program => "Software Engineering",
    :time => "Full-Time"
  },
  "onl01-seng-pt-110920-a" => {
    :program => "Software Engineering",
    :time => "Part-Time"
  }
}

cohort_list.each do |name, cohort_hash|
  c = Cohort.new
  c.name = name
  cohort_hash.each do |attribute, value|
    c[attribute] = value
  end
  c.save
end