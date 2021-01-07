cohort_list = {
  "onl01-seng-ft-110920-a" => {
    :program => "Software Engineering",
    :time => "Full-Time"
  }
}

cohort_list.each do |name, cohort_hash|
  c = Cohort.new
  c.cohort_id = name
  cohort_hash.each do |attribute, value|
    c[attribute] = value
  end
  c.save
end