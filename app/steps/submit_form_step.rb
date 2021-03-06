class SubmitFormStep < Step
  property :name, :string
  
  validates_presence_of :name
  
  def run!(session, check_run)
    session.log "submitting form #{name}"
    session.submit_form name
  end
end
