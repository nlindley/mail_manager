class UsernameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << 'can only contain letters, number, periods, underscores, and hyphens' unless /\A[\w.-]+\z/.match(value)
    record.errors[attribute] << 'cannot have two periods in a row' if value.include?('..')
    record.errors[attribute] << 'cannot start or end with a period' if value[0] == '.' || value[-1] == '.'
  end
end

