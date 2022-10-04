FROM rust:1.64.0

# create workdir
WORKDIR /root/rust/

# update debian deps
RUN apt update -y && apt upgrade -y

# install and set zsh
RUN apt install zsh -y
RUN chsh -s "$(which zsh)"

# install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# add spaceship theme on zsh
RUN git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
RUN ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# add plugins
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh}/custom/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh}/custom/plugins/zsh-completions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh}/custom/plugins/zsh-syntax-highlighting

COPY .docker/.zshrc ~/.zshrc
