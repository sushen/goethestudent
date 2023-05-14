import 'package:goethestudent/models/class_booking.dart';

class LocalService {
  static List<ClassBooking> getClassList() {
    return [
      ClassBooking(
          thumbnaile:
              'https://www.etudemy.com/wp-content/uploads/2021/09/Graphic-Designing-Courses-in-perinthalmannamalappuram.jpg',
          title: 'Graphic design',
          description:
              "Graphic design is a craft where professionals create visual content to communicate messages. By applying visual hierarchy and page layout techniques, designers use typography and pictures to meet users' specific needs and focus on the logic of displaying elements in interactive designs, to optimize the user experience.",
          price: 3999,
          totalLesson: 20,
          teacher: TeacherInfo(
              name: 'Mr. John Dee',
              category: 'Graphic design',
              experience: 2,
              profileImage:
                  'https://us.123rf.com/450wm/antonioguillem/antonioguillem1910/antonioguillem191000230/133951620-front-view-portrait-of-a-happy-entrepreneur-gesturing-thumbs-up-at-office.jpg?ver=6')),
      ClassBooking(
          thumbnaile:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-2q1FT3Btrb9j-ZHSNw1uzLzfoDQ4qXIqIQ&usqp=CAU',
          title: 'Mobile App Development',
          description:
              'Application development is the process of creating a computer program or a set of programs to perform the different tasks that a business requires. From calculating monthly expenses to scheduling sales reports, applications help businesses automate processes and increase efficiency',
          price: 2599,
          totalLesson: 25,
          teacher: TeacherInfo(
              name: 'Mr. Bolb Smith',
              category: 'App Developer',
              experience: 4,
              profileImage:
                  'https://us.123rf.com/450wm/gstockstudio/gstockstudio1511/gstockstudio151100309/48135480-how-may-i-help-you-handsome-young-man-holding-laptop-and-smiling-while-standing-against-grey.jpg?ver=6')),
      ClassBooking(
          thumbnaile:
              'https://pencilbox.edu.bd/batch-images/main/Online-Course-on-Modern-Web-Design.jpg',
          title: 'Web Development',
          description: '',
          price: 5999,
          totalLesson: 30,
          teacher: TeacherInfo(
              name: 'Mrs. Marry Dee',
              category: 'Web Developer',
              experience: 3,
              profileImage:
                  'https://media.istockphoto.com/id/871802194/photo/smiling-young-female-entrepreneur-working-on-a-laptop-at-home.jpg?s=612x612&w=0&k=20&c=cfYIc4SLau5iuCVWPVHtK9FcyfgapsIW5D7dPP4KbE0=')),
      ClassBooking(
          thumbnaile:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnCTAJY8awUf7ZwK77b-TbEyLe7ANIAqo4GWBhIEsm5XFpMeXzWCHkeqBW24mR02YyQgo&usqp=CAU',
          title: 'SEO',
          description:
              "SEO means Search Engine Optimization and is the process used to optimize a website's technical configuration, content relevance and link popularity so its pages can become easily findable, more relevant and popular towards user search queries, and as a consequence, search engines rank them better.",
          price: 1699,
          totalLesson: 18,
          teacher: TeacherInfo(
              name: 'Mr. Jolbi',
              category: 'Engineer',
              experience: 3,
              profileImage:
                  'https://media.istockphoto.com/id/1128967675/photo/smiling-millennial-african-american-corporate-employee-executive-looking-at-camera.jpg?b=1&s=170667a&w=0&k=20&c=75HMNOLZKRu26iqJpgHUifqa16MgMRb_am0Gmv2Kmbk=')),
      ClassBooking(
          thumbnaile:
              'https://www.etudemy.com/wp-content/uploads/2021/09/Graphic-Designing-Courses-in-perinthalmannamalappuram.jpg',
          title: 'Graphic design',
          description:
              "Graphic design is a craft where professionals create visual content to communicate messages. By applying visual hierarchy and page layout techniques, designers use typography and pictures to meet users' specific needs and focus on the logic of displaying elements in interactive designs, to optimize the user experience.",
          price: 3999,
          totalLesson: 20,
          teacher: TeacherInfo(
              name: 'Mr. John Dee',
              category: 'Graphic design',
              experience: 2,
              profileImage:
                  'https://us.123rf.com/450wm/antonioguillem/antonioguillem1910/antonioguillem191000230/133951620-front-view-portrait-of-a-happy-entrepreneur-gesturing-thumbs-up-at-office.jpg?ver=6')),
      ClassBooking(
          thumbnaile:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-2q1FT3Btrb9j-ZHSNw1uzLzfoDQ4qXIqIQ&usqp=CAU',
          title: 'Mobile App Development',
          description:
              'Application development is the process of creating a computer program or a set of programs to perform the different tasks that a business requires. From calculating monthly expenses to scheduling sales reports, applications help businesses automate processes and increase efficiency',
          price: 2599,
          totalLesson: 25,
          teacher: TeacherInfo(
              name: 'Mr. Bolb Smith',
              category: 'App Developer',
              experience: 4,
              profileImage:
                  'https://us.123rf.com/450wm/gstockstudio/gstockstudio1511/gstockstudio151100309/48135480-how-may-i-help-you-handsome-young-man-holding-laptop-and-smiling-while-standing-against-grey.jpg?ver=6')),
      ClassBooking(
          thumbnaile:
              'https://pencilbox.edu.bd/batch-images/main/Online-Course-on-Modern-Web-Design.jpg',
          title: 'Web Development',
          description: '',
          price: 5999,
          totalLesson: 30,
          teacher: TeacherInfo(
              name: 'Mrs. Marry Dee',
              category: 'Web Developer',
              experience: 3,
              profileImage:
                  'https://media.istockphoto.com/id/871802194/photo/smiling-young-female-entrepreneur-working-on-a-laptop-at-home.jpg?s=612x612&w=0&k=20&c=cfYIc4SLau5iuCVWPVHtK9FcyfgapsIW5D7dPP4KbE0=')),
      ClassBooking(
          thumbnaile:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnCTAJY8awUf7ZwK77b-TbEyLe7ANIAqo4GWBhIEsm5XFpMeXzWCHkeqBW24mR02YyQgo&usqp=CAU',
          title: 'SEO',
          description:
              "SEO means Search Engine Optimization and is the process used to optimize a website's technical configuration, content relevance and link popularity so its pages can become easily findable, more relevant and popular towards user search queries, and as a consequence, search engines rank them better.",
          price: 1699,
          totalLesson: 18,
          teacher: TeacherInfo(
              name: 'Mr. Jolbi',
              category: 'Engineer',
              experience: 3,
              profileImage:
                  'https://media.istockphoto.com/id/1128967675/photo/smiling-millennial-african-american-corporate-employee-executive-looking-at-camera.jpg?b=1&s=170667a&w=0&k=20&c=75HMNOLZKRu26iqJpgHUifqa16MgMRb_am0Gmv2Kmbk=')),
    ];
  }
}
