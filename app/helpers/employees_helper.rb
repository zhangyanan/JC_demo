#encoding:utf-8
module EmployeesHelper
  def employee_department_name department_id
    return Department.find(department_id).name
  end

end
