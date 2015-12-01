class SignUpMailer < ApplicationMailer
    default from: "kelvey29@gmail.com"
    
    def new_sign_up(user)
        headers["In-Reply-To"] = "<user/#{user.id}@your-app-name.example>"
        
        @user = user
        
        mail(to: user.email, subject: "Thank you #{user.name} for signing up for Wikipedia")
        
    end
end
