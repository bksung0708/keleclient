module Roadmap
  def get_roadmap(roadmap_id)
    response = self.class.get("/roadmaps/#{roadmap_id}", headers: { "authorization" => @auth_token } )
    @roadmap_data = JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get("/checkpoints/#{checkpoint_id}", headers: { "authorization" => @auth_token } )
    @checkpoint_data = JSON.parse(response.body)
  end

  def create_submission(enrollment_id, checkpoint_id, assignment_branch, assignment_commit_link, comment)
    response = self.class.post("/checkpoint_submissions", body: { "enrollment_id" => enrollment_id, "checkpoint_id" => checkpoint_id, "assignment_branch" => assignment_branch, "assignment_commit_link" => assignment_commit_link, "comment" => comment } )
  end
end

# 2.4.0 :003 > enrollment_id = 31472
#  => 31472
# 2.4.0 :004 > checkpoint_id = 2555
#  => 2555
# 2.4.0 :005 > assignment_branch = "kele_7"
#  => "kele_7"
# 2.4.0 :006 > assignment_commit_link = "https://github.com/bksung0708/keleclient/commits/kele_7"
#  => "https://github.com/bksung0708/keleclient/commits/kele_7"
