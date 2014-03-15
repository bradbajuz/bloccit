class FavoriteMailer < ActionMailer::Base
  default from: "brad@bradballard.com"

  def new_comment(user, post, comment)
    @user = user
    @post = post
    @comment = comment

    headers["Message-ID"] = "<comments/#{@comment.id}@brad-bloccit.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{@post.id}@brad-bloccit.herokuapp.com>"
    headers["References"] = "<post/#{@post.id}@brad-bloccit.herokuapp.com>"

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
