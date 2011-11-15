# -*- encoding: utf-8 -*-

class BlacklistValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record.errors.add(attribute, options[:message] || invalid_message(record, attribute)) if blacklisted?(value)
  end

  # Lazy load and transform directly words to patterns instead of creating regexps at each matching tests
  def blacklist
    @blacklist ||= YAML.load_file(blacklist_file).map { |word| /(#{word})+/i }
  end

  #######################
  ### Private methods ###
  #######################

  private

  def invalid_message(record, attribute)
    I18n.t  :blacklisted,
            scope:    "#{record.class.i18n_scope}.errors.models.#{record.class.model_name.i18n_key}.attributes.#{attribute}",
            default:  "is blacklisted"
  end

  def blacklisted?(str)
    blacklist.any? { |pattern| str =~ pattern }
  end

  def blacklist_file
    if defined?(Rails.root) && (blacklist_file_path = Rails.root.join("config", "blacklist.yml")).exist?
      return blacklist_file_path
    end
    File.join(File.dirname(__FILE__), "../config/blacklist.yml")
  end

end
