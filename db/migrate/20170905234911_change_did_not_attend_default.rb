class ChangeDidNotAttendDefault < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :therapysessions, :did_not_attend, false
  end
end
