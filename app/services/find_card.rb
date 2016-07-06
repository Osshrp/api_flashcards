class FindCard

  def self.find(id, current_user)
    @card = if id
      current_user.cards.find id
    elsif current_user.current_block
      current_user.current_block.cards.pending.first
      @card ||= current_user.current_block.cards.repeating.first
    else
      current_user.cards.pending.first
      @card ||= current_user.cards.repeating.first
    end
  end
end
