class SubmissionsMailer < ActionMailer::Base
  default from: "patrick@onboard.com"

  def new(submission)
    # share the variable that comes in with the text email
    @submission = submission

    # submission belongs to a job, posted by a user, we need his email
    # the submission is related to the user who did the submission
    mail to: @submission.job.user.email, subject: "New submission from #{@submission.user.name}"
  end
end
