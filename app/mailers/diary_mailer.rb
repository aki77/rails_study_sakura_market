class DiaryMailer < ApplicationMailer
  def comment_email(comment)
    @comment = comment
    mail(to: @comment.diary.user.email, subject: "[sakura-market] #{@comment.user.nickname}さんからコメントが投稿されました")
  end

  def good_email(good)
    @good = good
    mail(to: @good.diary.user.email, subject: "[sakura-market] #{@good.user.nickname}さんからGood!がありました")
  end
end
