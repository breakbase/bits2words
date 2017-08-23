class Bits2words
  module WordLists
    NUMBERS    = (2..33).map(&:to_s).freeze

    ADJECTIVES = %w[
      able absolute acrobatic afraid aggressive appropriate attached authorized batty
      bewitched capable careful condemned craven crushing damaging dazzling debonair
      dim discrete dispensable distant draconian dull dusty eager empty essential
      esteemed exclusive exhilarated flimsy frightened frivolous frugal funny
      grave grimy grizzled half heartfelt heavenly hoarse homely hot humdrum
      imaginary imperturbable incompatible incredible inexperienced intent
      irritable jumpy junior keen knobby late likeable linear lively lucky mad
      masculine meager mealy menacing mighty musty oafish obvious opposite optimal
      outlandish outlying overconfident pertinent piquant plausible pleased precious
      probable purring quiet ragged repulsive resolute rhetorical right righteous
      ritzy rude ruthless salty savory scrawny soft solid some speedy square studious
      stupendous tattered teeming tempting tender tiny trifling trivial trusting
      uncomfortable unfortunate unrealistic unruly unsteady upbeat uptight
      vacuous verifiable virtuous vivid voracious which white wiry worrisome
      zealous
    ].freeze

    NOUNS      = %w[
      akbashes akita albatrosses anteaters antelopes armadillos axolotls
      bandicoots barbs bats beetles binturongs birds bisons bobcats bongos bulldogs
      burmeses butterflies caimen camels chameleons chamois cheetahs chickens
      chihuahuas chipmunks cichlids coatis cockroaches cougars cuscus dodos
      dolphins donkeys dormouses dugongs dunkers eagles emus falcons flounders flies
      fossas foxes frogs geckos gerbils gharials goats gophers grouses harriers
      havaneses hedgehogs herons himalayans humen ibis iguanas impalas indris
      jackals javaneses koalas ladybirds lemurs leopards ligers lions lobsters
      meerkats millipedes mollies mongrels monkeys moorhens newts numbats octopi
      okapis opossums ostriches panthers pekingeses penguins pigs pikas piranhas
      platypus pointers poodles possums pumas quolls rabbits raccoons rats
      reindeers robins scorpions sheep shrimps siameses siberians snails snakes
      snowshoes sparrows sponges squids squirrels starfishes tangs termites
      tigers tortoises tuataras vultures walrus warthogs weasels wolves
      wolverines wombats woodlouses yaks zebus
    ].freeze

    VERB       = %w[
      admire admit approve attack attract back battle behave belong brake bubble
      carve chase cheat clip colour connect consist correct count crash crush dare
      develop drag dream drip drown employ empty escape exist explode fade fax
      fear file fill film flower force found gather grab grin happen harass harm
      head hum improve inject instruct juggle kiss knit like list lock manage mate
      matter melt memorise mend moor name notice obtain overflow paste perform permit
      pinch play poke possess practise preach precede pull puncture radiate realise
      reject rely reply report rhyme rinse roll sack satisfy scatter scream scrub
      shade share shiver sign sip smash snatch sneeze sniff soothe stamp steer step
      stir strap subtract suggest suspect tame thank tick tickle treat trust turn
      walk want waste welcome whirl wink zoom
    ].freeze

    ADVERB     = %w[
      actually ahead always anyway badly bitterly blindly boldly busily clearly
      coolly coyly daily dearly deeply directly else even fairly famously fatally
      finally freely gladly greatly hastily however hungrily joyously keenly
      lively loosely merely neatly not oddly openly politely quaintly queerly
      quirkily rapidly rather readily recently scarily shakily shrilly shyly
      solemnly sweetly tenderly then tomorrow upright urgently usefully vastly
      very warmly weakly wearily wrongly zestily
    ].freeze
  end
end
