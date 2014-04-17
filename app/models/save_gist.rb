class SaveGist
  def initialize(gist)
    @gist = gist
  end

  def call(update_attributes = {})
    @gist.transaction do
      @gist.assign_attributes(update_attributes)

      init_repo = @gist.new_record?
      @gist.save!
      # gist has to be persited at this point
      # as gist.id is used to generate repo's name
      @gist.init_repo if init_repo
      begin
        @gist.gist_write #async?
        @gist.touch
      rescue RepoWriter::NothingToCommitError => e
        # TODO: log it
        Rails.logger.warn("Nothing to commit")
      end
    end
    @gist
  end
end
