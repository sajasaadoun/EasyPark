class QuestionAr {
  final String questionText;
  final List<AnswerAr> answerList;
  QuestionAr(this.questionText, this.answerList);
}

class AnswerAr {
  final String answerText;
  final bool isCorrect;
  AnswerAr(this.answerText, this.isCorrect);
}

List<QuestionAr> getQuestions() {
  List<QuestionAr> list = [];

  list.add(QuestionAr(
    "على مدار الأسبوع الماضي ، هل واجهت مشاكل في تذكر الأشياء ، أو متابعة المحادثات ، أو الانتباه ، أو التفكير بوضوح ، أو إيجاد طريقك في المنزل أو في المدينة؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));
  list.add(QuestionAr(
    "هل رأيت أو سمعت أو شممت أو شعرت خلال الأسبوع الماضي بأشياء لم تكن موجودة بالفعل؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));
  list.add(QuestionAr(
    "هل شعرت خلال الأسبوع الماضي بالإحباط أو الحزن أو اليأس أو عدم القدرة على الاستمتاع بالأشياء؟ إذا كانت الإجابة بنعم ، فهل استمر هذا الشعور لمدة تزيد عن يوم واحد في كل مرة؟ هل جعل من الصعب عليك القيام بأنشطتك المعتادة أو أن تكون مع الناس؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "هل شعرت خلال الأسبوع الماضي بالتوتر أو القلق أو التوتر؟ إذا كانت الإجابة بنعم ، فهل استمر هذا الشعور لمدة تزيد عن يوم واحد في كل مرة؟ هل جعل من الصعب عليك متابعة أنشطتك المعتادة أو التواجد مع أشخاص آخرين؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "هل شعرت خلال الأسبوع الماضي بعدم المبالاة بالقيام بالأنشطة أو التواجد مع الناس؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "على مدار الأسبوع الماضي ، هل كانت لديك حوافز قوية بشكل غير عادي يصعب التحكم فيها؟ هل تشعر بأنك مدفوع لفعل شيء ما أو تفكر فيه وتجد صعوبة في التوقف؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "خلال الأسبوع الماضي ، هل واجهت صعوبة في النوم ليلاً أو البقاء نائماً طوال الليل؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "خلال الأسبوع الماضي ، هل واجهت صعوبة في البقاء مستيقظًا أثناء النهار؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "خلال الأسبوع الماضي ، هل شعرت بمشاعر غير مريحة في جسدك مثل الألم ، أو الأوجاع ، أو الوخز ، أو التشنجات؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "على مدار الأسبوع الماضي ، هل واجهت مشكلة في التحكم في البول؟ على سبيل المثال ، حاجة ملحة للتبول ، الحاجة للتبول بكثرة ، أو حوادث التبول؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "هل عانيت خلال الأسبوع الماضي من مشاكل الإمساك التي تسبب لك صعوبة في تحريك أمعائك؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));
  list.add(QuestionAr(
    "خلال الأسبوع الماضي ، هل شعرت بالإغماء أو الدوار أو الضباب عند الوقوف بعد الجلوس أو الاستلقاء؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "على مدار الأسبوع الماضي ، هل شعرت عادة بالإرهاق؟ هذا الشعور ليس جزءًا من الشعور بالنعاس أو الحزن",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "2.1-خلال الأسبوع الماضي ، هل واجهت مشاكل في حديثك؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "2.2-خلال الأسبوع الماضي ، هل عانيت في العادة من إفراط في اللعاب أثناء استيقاظك أو أثناء نومك؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));
  list.add(QuestionAr(
    "2.3-خلال الأسبوع الماضي ، هل عانيت عادة من مشاكل في بلع الحبوب أو تناول وجبات الطعام؟ هل تحتاج إلى تقطيع حبوبك أو سحقها أو أن تكون وجباتك طرية أو مفرومة أو ممزوجة لتجنب الاختناق؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "2.4-خلال الأسبوع الماضي ، هل عانيت عادة من مشاكل في التعامل مع طعامك واستخدام أدوات الأكل؟ على سبيل المثال ، هل تواجه مشكلة في التعامل مع الأطعمة التي تعمل بالأصابع أو استخدام الشوك والسكاكين والملاعق وعيدان تناول الطعام؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));
  list.add(QuestionAr(
    "2.5-خلال الأسبوع الماضي ، هل عانيت عادة من مشاكل في ارتداء الملابس؟ على سبيل المثال ، هل أنت بطيء أو تحتاج إلى مساعدة في الأزرار ، أو استخدام السحابات ، أو ارتداء أو خلع ملابسك أو مجوهراتك؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));
  list.add(QuestionAr(
    "2.6-على مدار الأسبوع الماضي ، هل كنت عادة بطيئًا أو تحتاج إلى مساعدة في الغسيل أو الاستحمام أو الحلاقة أو تنظيف الأسنان أو تمشيط شعرك أو في النظافة الشخصية الأخرى؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "2.7-خلال الأسبوع الماضي ، هل واجه الناس عادة مشكلة في قراءة خط يدك؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "2.8-خلال الأسبوع الماضي ، هل واجهت عادة مشكلة في ممارسة هواياتك أو أشياء أخرى تحب القيام بها؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "2.9-خلال الأسبوع الماضي ، هل تواجه عادة مشكلة في الانقلاب في السرير؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "2.10-على مدار الأسبوع الماضي ، هل عانيت عادة من رعشة أو رعشة؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "2.11-خلال الأسبوع الماضي ، هل عانيت عادة من صعوبة في النهوض من السرير أو مقعد السيارة أو الكرسي العميق؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "2.12-على مدار الأسبوع الماضي ، هل عانيت عادة من مشاكل في التوازن والمشي؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  list.add(QuestionAr(
    "2.13-خلال الأسبوع الماضي ، في يومك المعتاد عند المشي ، هل تتوقف فجأة أو تتجمد كما لو كانت قدميك عالقة على الأرض؟",
    [
      AnswerAr("طبيعي", true),
      AnswerAr("طفيف", true),
      AnswerAr("خفيف", true),
      AnswerAr("متوسط", true),
      AnswerAr("شديد", true),
    ],
  ));

  //part2

  return list;
}
