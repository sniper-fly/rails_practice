class Inquiry < ApplicationRecord
  enum category_kinds: {
    achieve: 0,
    text: 1,
    info_session: 2,
    others: 3
  }

  CATEGORY_TITLE = {
    Inquiry.category_kinds[:achieve] => "Achieve",
    Inquiry.category_kinds[:text] => "テキスト",
    Inquiry.category_kinds[:info_session] => "説明会",
    Inquiry.category_kinds[:others] => "その他"
  }

  def get_category
    CATEGORY_TITLE[self.category]
  end
end
