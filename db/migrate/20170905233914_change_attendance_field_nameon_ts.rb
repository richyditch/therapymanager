class ChangeAttendanceFieldNameonTs < ActiveRecord::Migration[5.0]
  def change
    rename_column :therapysessions, :attendance, :did_not_attend
   end
end
