
/// Bu ve diğer eklenmeyen sayfalar aynı şekilde firebase veritabanaına eklenerek
/// veriler oradan çekilmesi daha iyi olurdu fakat işlemler aynı şekilde olduğu için
/// vakit kaybetmemek için bu şekikde tammaladım.
///
class Campaigns {
  final String id;
  final String title;
  final String content;
  final String iconPath;

  Campaigns({
    required this.id,
    required this.title,
    required this.content,
    required this.iconPath
  });
}

List<Campaigns> campaignsItems = [
  Campaigns(
    id: '1',
    title: 'title1',
    content: "content1",
    iconPath: 'https://files.sikayetvar.com/complaint/2744/27440043/starbucks-kampanya-beklentileri-ve-musteri-tepkileri-1.jpg',
  ),
  Campaigns(
    id: '2',
    title: 'title2',
    content: "content2",
    iconPath: 'https://content.sbuxtr.com/images/541faecb-a696-4416-a3ad-e4886efa7121.png',
  ),
  Campaigns(
    id: '3',
    title: 'title3',
    content: "content3",
    iconPath: 'https://www.denizbonus.com//assets/img/campaign/starbucks_150_170423.jpg',
  ),
  Campaigns(
    id: '4',
    title: 'title4',
    content: "content4",
    iconPath: 'https://content.sbuxtr.com/images/ead9019c-2eea-4165-952e-7860f8ced311.jpeg',
  ),
  Campaigns(
    id: '5',
    title: 'title5',
    content: "content5",
    iconPath: 'https://www.bisektor.com/wp-content/uploads/2022/06/starbucks-bardak-kullanim.jpg',
  ),
  Campaigns(
    id: '6',
    title: 'title6',
    content: "content6",
    iconPath: 'https://i0.wp.com/kampanyol.net/wp-content/uploads/2022/02/Tosla-Starbucks.jpeg?w=1170',
  ),
  Campaigns(
    id: '7',
    title: 'title7',
    content: "content7",
    iconPath: 'https://pokus.com.tr/media/15jnz1q0/starbucks_indirim_390x390.png',
  ),
  Campaigns(
    id: '8',
    title: 'title8',
    content: "content8",
    iconPath: 'https://www.haberx.com/wp-content/uploads/2024/11/termos.jpg',
  ),
  Campaigns(
    id: '9',
    title: 'title9',
    content: "content9",
    iconPath: 'https://www.instyle.com.tr/wp-content/uploads/2023/01/starbucksdan-yildiz-yagmuru-64210-7122021125358-scaled.jpg',
  ),
];