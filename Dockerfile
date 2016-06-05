FROM trenpixster/elixir

RUN mix local.hex --force && \
    mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

WORKDIR /hello

COPY mix.exs .
COPY mix.lock .

RUN yes | mix deps.get

COPY . .

ENV PORT 4000
ENV MIX_ENV prod

RUN mix compile
RUN mix phoenix.digest

EXPOSE 4000

CMD mix phoenix.server
