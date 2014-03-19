require 'spec_helper'

describe "Emails" do
  let(:connection) { build(:connection) }
  let(:user) { create(:user, connections: [connection]) }

  describe 'メールアドレス設定画面' do
    context 'ログインしていない' do
      before do
        visit edit_my_email_path
      end
      it 'ログイン画面へ遷移する' do
        expect(current_path).to eq root_path
      end
    end

    context 'ログインしている' do
      before do
        sign_in(user)
        visit edit_my_email_path
      end
      it '画面遷移する' do
        expect(current_path).to eq edit_my_email_path
      end

      context '現在のメールアドレスがない' do
        before do
          user.update_column(:email, nil)
          reload
        end
        it '現在のメールアドレスが設定されていない' do
          expect(page).to have_content I18n.t('emails.edit.unregistered')
        end
      end

      context '現在のメールアドレスがある' do
        it '現在のメールアドレスが表示される' do
          expect(find('.label-email')).to have_content user.email
        end
      end

      describe '新しいメールアドレスを設定する' do
        let(:new_email) { Faker::Internet.email }
        before do
          find('form input#email').set(new_email)
          find("form[action='/my/email'] input[type=submit]").click()
        end

        it 'メッセージが表示される' do
          expect(page).to have_content I18n.t('emails.updated')
        end

        describe '確認URL画面' do
          before do
            user.reload
            visit confirmation_my_email_path(hash: user.hash_to_confirm_email)
          end

          it 'メッセージが表示される' do
            expect(page).to have_content I18n.t('emails.confirmation.complete')
          end

          describe 'メール設定画面へ遷移する' do
            before do
              visit my_email_path
            end
            it '新しいメールアドレスが表示される' do
              expect(find('.label-email')).to have_content new_email
            end
          end
        end
      end
    end
  end
end
