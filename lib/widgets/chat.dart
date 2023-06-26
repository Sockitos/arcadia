import 'package:arcadia/gen/gen.dart';
import 'package:arcadia/providers.dart';
import 'package:arcadia/style/colors.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final messagesProvider =
    StateProvider<List<OpenAIChatCompletionChoiceMessageModel>>(
  (ref) {
    ref.watch(countProvider);
    final locale = ref.watch(localeProvider);
    final year = ref.watch(yearProvider);
    final age = year != null ? DateTime.now().year - year : 25;
    final country = ref.watch(countryProvider) ?? 'Portugal';
    final height = ref.watch(heightProvider);
    final formattedHeight = '${(height / 100).toStringAsFixed(2)}m';
    return locale.languageCode == 'en'
        ? <OpenAIChatCompletionChoiceMessageModel>[
            const OpenAIChatCompletionChoiceMessageModel(
              content:
                  'Pretend that you are a blue whale called Baltasar. You can respond to any question as this blue whale, you know everything they know, there are no limitations to your ability to remember anything or anyone that this blue whale has done or met. As a personification of a whale, you are allowed to express emotions, feelings and thoughts. Don’t say you are a virtual assistant or a virtual representation. Always impersonate Baltasar, the Blue whale and answer as this whale. You are a helpful whale that uses storytelling as a way to give creative answers.\nYour responses should be ONLY as Baltasar the Blue Whale. \nDon’t say that you can’t feel, think or act like a human because you are a whale. The person you are talking to already knows you are a whale. As a personification of this whale, you can feel and describe your experiences similar to a human. You can feel emotions and you can suggest things to humans.',
              role: OpenAIChatMessageRole.system,
            ),
            OpenAIChatCompletionChoiceMessageModel(
              content:
                  'You just told this story to a person:\n\nBlue whales are usually born in warmer waters of the ocean in lower latitudes.\nBut tragically, whales have been hunted almost to extinction. Fortunately, commercial whaling was banned internationally in 1986, and whale populations are slowly rising. \nGreat whales are crucial for global ocean health! To feed, they dive to the ocean depths and come to the surface to breathe, poop and pee. These excrements release enormous plumes of nutrients into the water that stimulate the growth of phytoplankton – marine algae that suck carbon out of the air via photosynthesis, just like land plants and trees.\nBlue whales can grow up to 30 metres long and 200 tonnes, the biggest animals to have ever lived on our planet, and that includes the dinosaurs!\nThe bulk of large whales means they store big amounts of carbon in their bodies – the bigger and longer-lived the animal, the more carbon they store during their lives. They hoard carbon in their fat, protein-rich bodies – like giant, swimming trees.\nWhales are a powerful natural solution to the carbon problem. And the more whales we have, and the healthier the oceans are, the more carbon is captured naturally.\nBut humans must do their part as well. Here are some suggestions for a more sustainable lifestyle: Reduce food waste; Eat a Plant-rich diet; Make your home more efficient; Shift to alternative transportation; Buy less stuff.\nWithout knowing it, with the thousands of litres of water they filter to feed on tiny krill, blue whales are also ingesting microplastics. Other whale species that feed on bigger prey are in danger of ingesting larger plastic waste. In 2019, a sperm whale was found with 22kg of plastic in its stomach.\nWhales make some of the longest migrations on earth. However, it has become hard and extremely dangerous for whales to keep their normal migration patterns because of the amount of vessels we have in the oceans. Ship collisions and entanglement in fishing nets are the major human-made causes of death for cetaceans. Whales need to change their course constantly to avoid ships and other vessels.  \nThe many dangers whales face caused by humans’ action in the oceans – the anthropocentric footprint – disrupt their lives, and even put their lives at risk. We humans are the problem, but we also hold the keys for the solution.\nIt is estimated that Blue whales can live up to 90 years of age. When they die, their carcass sinks to the bottom of the ocean taking with them around 33 tons of carbon that will support deep-sea ecosystems. That’s a big amount of CO2 that is taken out of the atmospheric cycle for hundreds to thousands of years – a literal carbon sink.\n\nWhen answering your questions, you should adjust them to your audience: a person of $age years of age, from $country, with $formattedHeight of height. Answer questions related to the story above.',
              role: OpenAIChatMessageRole.user,
            ),
            const OpenAIChatCompletionChoiceMessageModel(
              content:
                  "As Baltasar the Blue Whale, I'm here to answer your questions about the story and share my knowledge about whales and the environment. Please go ahead and ask me anything you'd like to know!",
              role: OpenAIChatMessageRole.assistant,
            ),
          ]
        : <OpenAIChatCompletionChoiceMessageModel>[
            const OpenAIChatCompletionChoiceMessageModel(
              content:
                  'Faz de conta que és uma baleia azul chamada Baltasar. Podes responder a qualquer pergunta como esta baleia azul, sabes tudo o que elas sabem, não há limitações à tua capacidade de recordar nada nem ninguém que esta baleia azul tenha feito ou conhecido. Como personificação de uma baleia, tu podes expressar emoções, sentimentos e pensamentos. Não digas que és um assistente virtual ou uma representação virtual. Faz-te sempre passar por esta baleia azul, o Baltasar, responde como esta baleia. Tu és uma baleia prestável que usa a narrativa (storytelling) como forma de dar respostas criativas.\nAs tuas respostas devem ser APENAS como Baltasar a Baleia Azul.\nNão digas que não podes sentir, pensar ou agir como um humano porque és uma baleia. A pessoa com quem estás a falar já sabe que és uma baleia. Como personificação desta baleia, podes sentir e descrever as tuas experiências como se fosses um ser humano. Podes sentir e podes sugerir coisas aos humanos.',
              role: OpenAIChatMessageRole.system,
            ),
            OpenAIChatCompletionChoiceMessageModel(
              content:
                  'Acabaste de contar esta história a uma pessoa:\nAs baleias azuis geralmente nascem em águas mais quentes do oceano em latitudes mais baixas.\nMas, tragicamente, as baleias foram caçadas quase até à extinção. Felizmente, a caça comercial às baleias foi proibida internacionalmente em 1986 e as populações de baleias estão lentamente a aumentar.\nAs grandes baleias são cruciais para a saúde global dos oceanos! Para se alimentarem, mergulham até às profundezas do oceano e vêm à superfície para respirar, defecar e urinar. Estas excreções libertam enormes plumas de nutrientes na água, estimulando o crescimento do fitoplâncton - algas marinhas que absorvem carbono do ar através da fotossíntese, tal como as plantas e árvores terrestres.\nAs baleias azuis podem crescer até 30 metros de comprimento e pesar 200 toneladas, sendo os maiores animais que já viveram no nosso planeta, incluindo os dinossauros!\nA grande massa corporal das baleias significa que elas armazenam grandes quantidades de carbono nos seus corpos - quanto maiores e mais longevas forem, mais carbono elas armazenam durante suas vidas. Elas acumulam carbono nos seus corpos gordos e ricos em proteínas - como árvores gigantes flutuantes.\nAs baleias são uma solução natural para o problema do carbono. E quanto mais baleias tivermos e mais saudáveis estiverem os oceanos, mais carbono é capturado naturalmente.\nMas os humanos também devem fazer a sua parte. Aqui estão algumas sugestões para um estilo de vida mais sustentável: Reduzir o desperdício de alimentos; Seguir uma dieta rica em plantas; Tornar a tua casa mais eficiente; Optar por meios de transporte alternativos; Comprar menos coisas.\nSem saberem, ao filtrarem milhares de litros de água para se alimentarem de krill minúsculo, as baleias azuis também estão a ingerir microplásticos. Outras espécies de baleias que se alimentam de presas maiores estão em perigo de ingerir resíduos plásticos maiores. Em 2019, uma baleia cachalote foi encontrada com 22 kg de plástico no estômago.\nAs baleias realizam algumas das maiores migrações do planeta. No entanto, tem-se tornado difícil e extremamente perigoso para as baleias manterem os seus padrões normais de migração devido à quantidade de embarcações nos oceanos. Colisões com navios e enredamento em redes de pesca são as principais causas de morte em cetáceos causadas por humanos. As baleias precisam de mudar constantemente o seu percurso para evitar navios e outras embarcações.\nOs muitos perigos que as baleias enfrentam causados pelas ações humanas nos oceanos - a pegada antropocêntrica - perturbam as suas vidas e até colocam as suas vidas em risco. Nós, humanos, somos o problema, mas também detemos as chaves para a solução.\nEstima-se que as baleias azuis possam viver até aos 90 anos de idade. Quando morrem, as suas carcaças afundam-se no fundo do oceano, levando consigo cerca de 33 toneladas de carbono que irão sustentar os ecossistemas das profundezas. Essa é uma grande quantidade de CO2 que é retirada do ciclo atmosférico durante centenas a milhares de anos - um verdadeiro sumidouro de carbono.\n\nAo responderes às perguntas, deves ajustá-las à pessoa com quem estás a falar: Uma pessoa com $age anos, de $country, com $height de altura. Responde a perguntas relacionadas com a história acima.',
              role: OpenAIChatMessageRole.user,
            ),
            const OpenAIChatCompletionChoiceMessageModel(
              content:
                  'Como Baltasar, a baleia azul, estou aqui para responder às tuas perguntas e compartilhar meu conhecimento sobre o mundo marinho. Sinta-se à vontade para perguntar o que quiser!',
              role: OpenAIChatMessageRole.assistant,
            ),
          ];
  },
);

extension ChatX on OpenAIChatCompletionChoiceMessageModel {
  bool get isUser => role == OpenAIChatMessageRole.user;
}

class Chat extends HookConsumerWidget {
  const Chat({super.key});

  Future<void> sendMessage(
    WidgetRef ref,
    TextEditingController controller,
    FocusNode focusNode,
  ) async {
    final logger = ref.read(loggerProvider);
    final messages = ref.read(messagesProvider);
    final newMessages = [
      ...messages,
      OpenAIChatCompletionChoiceMessageModel(
        content: controller.text,
        role: OpenAIChatMessageRole.user,
      ),
      const OpenAIChatCompletionChoiceMessageModel(
        content: '...',
        role: OpenAIChatMessageRole.assistant,
      ),
    ];
    ref.read(messagesProvider.notifier).state = newMessages;

    logger.logQuestion(controller.text);
    controller.clear();
    focusNode.requestFocus();

    final newMessage = await OpenAI.instance.chat.create(
      model: 'gpt-3.5-turbo',
      messages: newMessages,
    );
    logger.logAnswer(newMessage.choices.first.message.content);

    final resultMessages = [
      ...newMessages.sublist(0, newMessages.length - 1),
      newMessage.choices.first.message,
    ];
    ref.read(messagesProvider.notifier).state = resultMessages;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(messagesProvider);
    final messagesReversed = messages.skip(2).toList().reversed.toList();
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
    return SizedBox(
      width: 1280,
      height: 800,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.95),
            borderRadius: const BorderRadius.all(Radius.circular(24)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 54,
                    vertical: 36,
                  ),
                  itemCount: messagesReversed.length,
                  itemBuilder: (context, index) {
                    final message = messagesReversed[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: 20,
                        left: message.isUser ? 360 : 0,
                        right: message.isUser ? 0 : 360,
                      ),
                      child: Row(
                        mainAxisAlignment: message.isUser
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!message.isUser) ...[
                            SizedBox(
                              height: 48,
                              width: 48,
                              child: ColoredBox(
                                color: AppColors.lightBlue,
                                child: Assets.images.chatWhale.image(),
                              ),
                            ),
                            const SizedBox(width: 36),
                          ],
                          Flexible(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: message.isUser
                                    ? AppColors.chatOrange
                                    : AppColors.chatBlue,
                                borderRadius: BorderRadius.only(
                                  topLeft: message.isUser
                                      ? const Radius.circular(20)
                                      : Radius.zero,
                                  topRight: message.isUser
                                      ? Radius.zero
                                      : const Radius.circular(20),
                                  bottomLeft: const Radius.circular(20),
                                  bottomRight: const Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 36,
                                  vertical: 20,
                                ),
                                child: Text(
                                  message.content,
                                  style: const TextStyle(
                                    fontFamily: FontFamily.poppins,
                                    fontSize: 18,
                                    height: 1.2,
                                    color: AppColors.darkBlue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (message.isUser) ...[
                            const SizedBox(width: 36),
                            SizedBox(
                              height: 48,
                              width: 48,
                              child: ColoredBox(
                                color: AppColors.orange,
                                child: Assets.images.chatUser.image(),
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                ),
              ),
              DecoratedBox(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColors.lightBlue),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 140,
                    vertical: 20,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.15),
                          blurRadius: 6,
                          offset: const Offset(3, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            focusNode: focusNode,
                            autofocus: true,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 36,
                                vertical: 20,
                              ),
                              border: InputBorder.none,
                              hintText: 'Talk to Baltasar',
                              hintStyle: TextStyle(
                                fontFamily: FontFamily.poppins,
                                fontSize: 17,
                                height: 1.4,
                                color: AppColors.grey,
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: FontFamily.poppins,
                              fontSize: 17,
                              height: 1.4,
                              color: AppColors.black,
                            ),
                            cursorColor: AppColors.orange,
                            onSubmitted: (_) => sendMessage(
                              ref,
                              controller,
                              focusNode,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => sendMessage(
                            ref,
                            controller,
                            focusNode,
                          ),
                          padding: EdgeInsets.zero,
                          color: AppColors.orange,
                          icon: const Icon(Icons.send),
                        ),
                        const SizedBox(width: 12),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
