module AccountsHelper
  def work_options
    [["Please select ...",nil],["Contractor","Contractor"],["Employed","Employed"],["Unemployed","Unemployed"],["Prefer Not to Answer","Prefer Not to Answer"]]
  end

  def shirt_size_options
    [["Please select ...",nil],["M-small","M-small"],["M-medium","M-medium"],["M-large","M-large"],["M-x-large","M-x-large"],["W-small","W-small"],["W-medium","W-medium"],["W-large","W-large"],["W-x-large","W-x-large"]]
  end

  def age_range_options
    [["Please select ...",nil],["14-20","14-20"],["21-30","21-30"],["31-40","31-40"],["41-60","41-60"],["60+","60+"],["Prefer not answer","Prefer not answer"]]
  end

  def gender_options
    [["Please select ...",nil],["Male","Male"],["Female","Female"]]
  end
end
