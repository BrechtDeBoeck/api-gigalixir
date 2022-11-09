## Internal API:

### Voorafgaand:

Om een Phoenix-applicatie op te starten, heeft men eerst Elixir en Phoenix nodig.

- Elixir kan men installeren via één van de volgende methoden. De
  meeste van deze opties installeren ook automatisch Erlang, dat Elixir
  nodig heeft om te kunnen werken:

  - macOS: Open een terminal en voer het volgende commando uit: **brew install elixir**
  - Debian/Ubuntu: Open een terminal en voer het volgende commando uit: **sudo apt-get install elixir**
  - Windows: Download de installateur via [deze link](https://repo.hex.pm/elixir-websetup.exe). Klik **tweemaal op next** en uiteindelijk op **finish**.

- Controleer je Erlang en Elixir-versies met de volgende commando's:

  ```bash
  erl -v
  elixir -v
  ```

### De applicatie opstarten:

- Ga naar de config-folder binnen de bestanden van de applicatie en maak een nieuw bestand aan genaamd **dev.secret.exs**.
- Kopieer de volgende code naar dit bestand. Vergeet niet de placeholders te vervangen door de gegevens van je eigen externe databank!

```elixir
import Config

config :api_Brecht_De_Boeck_r0838388, Api_Brecht_De_BoeckR0838388.Repo,
       username: "gebruikersnaam_externe_databank",
       password: "wachtwoord_externe_databank",
       hostname: "ip_adres_machine_waarop_de_externe_databank_gedraaid_wordt",
       database: "naam_externe_databank",
       port: poortnummer_externe_databank
```

- Open een command prompt of terminal (afhankelijk van het gebruikte besturingssysteem) in de hoofdfolder van de applicatie en voer de volgende commando's in de opgegeven volgorde uit:

  ```mix
  $ mix deps.get
  $ mix ecto.create
  $ mix ecto.migrate
  $ mix run priv/repo/seeds.exs
  ```

- De applicatie is nu gereed om opgestart te worden. Dit doet men met het volgende commando

  ```
  $ mix phx.server
  ```

- Als alles goed verlopen is, zou de applicatie nu beschikbaar moeten zijn op de URL http://localhost:4000. Voer deze in in de browsers en je zou op een testresultaat moeten ontvangen dat aangeeft dat de applicatie werkt.

### De API gebruiken:

- Momenteel zijn enkel de \_/XXX/list-routes beschikbaar in de browser. De rest van de routes zijn enkel beschikbaar via API-platformen zoals Postman.

- Routes: toegevoegd aan http://localhost:4000 wanneer de applicatie opgestart is

  - Games:

    - \_/products/list: Geeft een lijst terug van alle producten die op dit moment aangeboden worden in de webshop

    - \_/products/create: Voegt een nieuw product toe aan de webshop

      - Verwacht enkele attributen, die in de request mee verstuurd moeten worden in JSON-formaat:

        - title: **Verplicht**. De titel van de toegevoegde game

        - description: **Verplicht**. Een opsomming van de verschillende genres waartoe de game behoord

        - price: **Verplicht**. De prijs van de game. Enkel **gehele getallen groter dan 0** worden geaccepteerd.

        - picture_url: **Optioneel**. Een URL die wijst naar een afbeelding van de cover van de game op het Internet.

        - De structuur van de JSON is als volgt:

          ```json
          {
               "title": "...",
               "description": "...",
               "price": 25,
               "picture_url": "..."
          }
          ```

    - _/products/update/:id : Past de game met het gegeven ID aan met de gegeven waarden

        - De ID moet in gebruik zijn door een bepaalde game

          - Aanvaard dezelfde attributen als _/products/create (indien deze aangepast moeten worden), maar deze moeten geëncapsuleerd worden in een attribuut genaamd "**game**". De structuur zou er als volgt moeten uitzien:

            ```json
            {
                "game": {
                "title": "...",
                "description": "...",
                "price": 20,
                "picture_url": "..."
                }
            }
            ```

    - _/products/delete/:id : Verwijdert de game met het gegeven ID
      - De ID moet in gebruik zijn door een bepaalde game.

  - Orders

    - _/orders/list: Geeft een lijst terug van alle bestellingen die in de webshop geplaatst werden, evenals welke games er werden besteld.

    - _/orders/create: Plaatst een nieuwe bestelling met enkele games.

      - Verwacht een email-adres (**verplicht**) en een lijst van producten die men wil bestellen. De games in deze lijst worden geacht te bestaan, en de waarden van de verschillende attributen van de opgegeven game moeten overeen komen met die van de game in de webshop! De structuur van de JSON zou er als volgt moeten uitzien:

        ```json
            "email": "...",
                "products": [
                    {
                        "id": 4,
                        "title": "...",
                        "description": "...",
                        "price": 60,
                        "picture_url": "..."
                    },
                    ...
                ]
        ```

    - _/orders/update/:id : Past de bestelling met het gegeven ID aan met de gegeven waarden

      - Enkel de email is aanpasbaar. De structuur van de JSON moet er als volgt uitzien:

        ```json
        {
            "order": {
                "email": "..."
            }
        }
        ```

    - _/orders/delete/:id : Verwijdert de bestelling met het gegeven ID
      - De ID moet in gebruik zijn door een bepaalde bestelling
