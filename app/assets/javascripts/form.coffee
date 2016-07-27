$(document).ready((e) ->
  document.addEventListener('turbolinks:load', ->
    $('#login-form-control')
      .form(
        inline: true,
        on: 'blur',
        fields: {
          email: {
            identifier: 'email'
            rules: [
              {
                type: 'empty',
                prompt: 'Enter your email'
              },
              {
                type: 'email'
                prompt: "Invalid e-mail"
              }
            ]
          },
          password: {
            identifier: 'password'
            rules: [
              {
                type: 'empty',
                prompt: 'Enter your password'
              }
            ]
          }
        }
      )
    $('#new_user')
      .form(
        inline: true,
        on: 'blur',
        fields: {
          email: {
            identifier: 'user[email]'
            rules: [
              {
                type: 'empty',
                prompt: 'Please enter an email'
              },
              {
                type: 'email',
                prompt: 'Please enter a valid email'
              }
            ]
          },
          fname: {
            identifier: 'user[fname]'
            rules: [
              {
                type: 'empty',
                prompt: 'Please enter your first name'
              },
              {
                type: 'minLength[2]',
                prompt: 'Please enter atleast 2 characters'
              }
            ]
          },
          password: {
            identifier: 'user[password]'
            rules: [
              {
                type: 'minLength[6]',
                prompt: 'Please enter atleast 6 characters'
              }
            ]
          }
          password_confirmation: {
            identifier: 'user[password_confirmation]'
            rules: [
              {
                type: 'match[user[password]]'
                prompt: "Your password doesn't match"
              }
            ]
          }

        }
      )
    $('.edit_user').form(
      inline: true,
      on: 'blur'
      fields: {
        fname: {
          identifier: 'user[fname]'
          rules: [
            {
              type: 'empty',
              prompt: 'Please enter your first name'
            },
            {
              type: 'minLength[2]',
              prompt: 'Please enter atleast 2 characters'
            }
          ]
        }
      }
    )
  )
)
