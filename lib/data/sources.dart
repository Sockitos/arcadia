class Source {
  const Source({
    required this.title,
    required this.url,
  });
  final String title;
  final String url;
}

const sources = <int, List<Source>>{
  1: [
    Source(
      title: '“Blue Whale”, Marine Mammal Center',
      url:
          'https://www.marinemammalcenter.org/animal-care/learn-about-marine-mammals/cetaceans/blue-whale',
    ),
  ],
  2: [
    Source(
      title:
          '“This is how humans have affected whale populations over the years”, World Economic Forum',
      url:
          'https://www.weforum.org/agenda/2019/10/whales-endangered-species-conservation-whaling/',
    ),
    Source(
      title:
          '“Future recovery of baleen whales is imperiled by climate change”, Global Change Biology',
      url: 'https://onlinelibrary.wiley.com/doi/pdf/10.1111/gcb.14573',
    ),
  ],
  3: [
    Source(
      title:
          '“Future recovery of baleen whales is imperiled by climate change”, Global Change Biology',
      url: 'https://onlinelibrary.wiley.com/doi/pdf/10.1111/gcb.14573',
    ),
    Source(
      title:
          '“This is how humans have affected whale populations over the years”, World Economic Forum',
      url:
          'https://www.weforum.org/agenda/2019/10/whales-endangered-species-conservation-whaling/',
    ),
  ],
  4: [
    Source(
      title:
          '“Nature’s Solution to Climate Change”, International Monetary Fund',
      url:
          'https://www.imf.org/Publications/fandd/issues/2019/12/natures-solution-to-climate-change-chami#author',
    ),
    Source(
      title: '“How much is a whale worth”, National Geographic',
      url:
          'https://www.nationalgeographic.com/environment/article/how-much-is-a-whale-worth',
    ),
    Source(
      title: '“What are phytoplankton?”, National Ocean Service',
      url: 'https://oceanservice.noaa.gov/facts/phyto.html',
    ),
    Source(
      title: '“What are Phytoplankton?”, NASA Earth Observatory',
      url: 'https://earthobservatory.nasa.gov/features/Phytoplankton',
    ),
    Source(
      title: '“CO2 Emissions by Country”, Worldometers',
      url:
          'https://www.worldometers.info/co2-emissions/co2-emissions-by-country/',
    ),
  ],
  5: [
    Source(
      title: '“Blue Whale”, National Geographic',
      url:
          'https://www.nationalgeographic.com/animals/mammals/facts/blue-whale',
    ),
  ],
  6: [
    Source(
      title: '“How much is a whale worth”, National Geographic',
      url:
          'https://www.nationalgeographic.com/environment/article/how-much-is-a-whale-worth',
    ),
    Source(
      title:
          '“The Impact of Whaling on the Ocean Carbon Cycle: Why Bigger Was Better”, Public Library of Science',
      url:
          'https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0012444',
    ),
    Source(
      title:
          '“Nature’s Solution to Climate Change”, International Monetary Fund',
      url:
          'https://www.imf.org/Publications/fandd/issues/2019/12/natures-solution-to-climate-change-chami#author',
    ),
  ],
  7: [
    Source(
      title: '“Climate Solutions 101”, Project Drawdown',
      url: 'https://drawdown.org/climate-solutions-101/',
    ),
    Source(
      title:
          '“Food waste is responsible for 6% of global greenhouse gas emissions”, Our World in Data',
      url: 'https://ourworldindata.org/food-waste-emissions',
    ),
    Source(
      title: 'Plant-rich Diets, Project Drawdown',
      url: 'https://drawdown.org/solutions/plant-rich-diets',
    ),
  ],
  8: [
    Source(
      title: '“Blue Whale”, National Geographic',
      url:
          'https://www.nationalgeographic.com/animals/mammals/facts/blue-whale',
    ),
  ],
  9: [
    Source(
      title:
          '“Surprising Findings From New Research Into Microplastics In Whales”, Plastic Soup Foundation',
      url:
          'https://www.plasticsoupfoundation.org/en/2021/12/surprising-findings-from-new-research-into-microplastics-in-whales/',
    ),
    Source(
      title:
          '“Arctic whales may be consuming thousands of microplastics each year”, Natural History Museum”',
      url:
          'https://www.nhm.ac.uk/discover/news/2021/november/arctic-whales-may-be-consuming-thousands-of-microplastics-a-year.html',
    ),
    Source(
      title: '“How Does Ocean Plastic Affect Whales?”, Blue Ocean Society',
      url:
          'https://www.blueoceansociety.org/blog/how-does-ocean-plastic-affect-whales/',
    ),
    Source(
      title:
          '“Plastic and other microfibers in sediments, macroinvertebrates and shorebirds from three intertidal wetlands of southern Europe and west Africa”',
      url: 'https://pubmed.ncbi.nlm.nih.gov/28797901/',
    ),
  ],
  10: [
    Source(
      title:
          '“This pregnant whale died with 50 pounds of plastic in her stomach”, National Geographic',
      url:
          'https://www.nationalgeographic.com/environment/article/dead-pregnant-whale-plastic-italy',
    ),
    Source(
      title: '“How Does Ocean Plastic Affect Whales?”, Blue Ocean Society',
      url:
          'https://www.blueoceansociety.org/blog/how-does-ocean-plastic-affect-whales/',
    ),
  ],
  11: [
    Source(
      title: 'Blue whale migration map: Aquamaps and WWF',
      url: 'https://www.aquamaps.org/',
    ),
    Source(
      title: 'Shipping data map: “Protecting Blue Corridors Report”, WWF',
      url: 'https://wwfwhales.org/resources/protecting-blue-corridors-report',
    ),
    Source(
      title:
          '– Thanks to WWF Protecting Whales and Dolphins Initiative for sharing both maps for this project.\n– Um especial agradecimento à WWF Protecting Whales and Dolphins Initiative por partilhar estes dois mapas para uso neste projecto.',
      url: 'https://wwfwhales.org/',
    ),
    Source(
      title:
          '“In the Oceans, the Volume Is Rising as Never Before”, The New York Times',
      url:
          'https://www.nytimes.com/2021/02/04/science/ocean-marine-noise-pollution.html',
    ),
    Source(
      title:
          '“By-catch, entanglement and ship-strike”, North Atlantic Marine Mammal Commission',
      url: 'https://nammco.no/by-catch-entanglement-and-ship-strike/',
    ),
  ],
  12: [
    Source(
      title:
          '“The Ocean Carbon Sink and Climate Change”, International Journal of Environmental Science and Development',
      url:
          'https://www.researchgate.net/publication/334083793_The_Ocean_Carbon_Sink_and_Climate_Change_2019_Article',
    ),
    Source(
      title: '“Tejo: como matar um rio”',
      url:
          'https://www.dn.pt/edicao-do-dia/27-set-2020/tejo-como-matar-um-rio-12738645.html',
    ),
  ],
  13: [],
  14: [
    Source(
      title:
          '“Nature’s Solution to Climate Change”, International Monetary Fund',
      url:
          'https://www.imf.org/Publications/fandd/issues/2019/12/natures-solution-to-climate-change-chami#author',
    ),
    Source(
      title: '“How much is a whale worth”, National Geographic',
      url:
          'https://www.nationalgeographic.com/environment/article/how-much-is-a-whale-worth',
    ),
  ],
};
