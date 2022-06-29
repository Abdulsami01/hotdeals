import 'package:hotdealsgemet/core/extensions/package_imports_and_exports.dart';
import 'package:hotdealsgemet/core/services/firebase_remote_config.dart';

class FAQController extends GetxController {
  List<Map<String, String>> faq = [
    {
      "q":
          "Do I need to be a brick and mortar business (actual physical building business) in order to advertise on this app? ",
      "a":
          "Nope. Anyone who offers services or a product can place an ad on our app. You just have to be based in Hemet or very near to the border of Hemet."
    },
    {
      "q": "How much does it cost to run my ad?",
      "a":
          "For our launch, we are offering 1 month FREE to our first 50 customers. Currently, the monthly advertising rate is \$65 for 1 month (approximately 30 days), or \$50 if you set up for recurring automatic payment each month, billed monthly."
    },
    {
      "q":
          "Why should I post my business on here rather than on advertisement mailers?",
      "a":
          "Our app is the most user friendly and the easiest to manage. For example, magazine advertising is much more expensive, and once your ad is printed, it can’t be changed. Residents typically throw away advertisement mailers and your offer is then gone forever. Customers also often forget to cut out the coupons and bring them when they leave their house. With our app, we address all those problems. Customers will always have your business ad at their fingertips because it’s in their phone. Customers are more likely to scroll through an app than a magazine. You can always change your ad at any time, therefore, offering different deals during different days.  Mailers don’t allow that. "
    },
    {
      "q":
          "How does this advertising compare to other places like Yelp, Google Ads, Nextdoor, Groupon, magazine mailers etc?",
      "a":
          "Basically our rates are far less than those other advertising campaigns and we focus on only Hemet businesses. We are great for businesses who don’t want to pay “per click fees,” “traffic fees,” or “lead fees”. Also, we are purely about deals only, unlike Nextdoor in which your business ads stand a chance of getting lost amongst an array of other junk. Groupon is very similar to us but we don’t ask the users to pay us any money (and they like that). We charge the users nothing to find deals in Hemet, hence, they are more likely to use this app. Also, we don’t take a percentage of your income like Groupon does. "
    },
    {
      "q": "Can I list more than one ad? ",
      "a":
          "Yes. However, each ad is its own separate price. If, let’s say, you create one ad, it is \$50 and if you create a second ad with a different offer, that would be a separate \$50. But keep in mind you can change your ad on a day-to-day basis. You can also state in your ad that you are offering 20% off \$200, AND offer 10% off \$100 service, as long as you can fit all your information within your ad. You can essentially offer multiple deals in one ad. However, if you have multiple businesses, you would have to set up a different ad for each business and pay for each ad separately. In other words, you can’t offer watch repair and dog grooming in the same ad, even if you do both."
    },
    {
      "q": "Do I have to sign any contracts? ",
      "a":
          "No, there are no long term contracts. You can cancel at any time after your month payment date ends. You will only be obligated for the month you are currently in."
    },
    {
      "q": "How do I cancel if needed? ",
      "a":
          "You can either go in the app and cancel you recurring monthly payments (if that’s what you signed up for) or you can call us or e-mail us and our friendly support team can do it for you. If you signed up for one month only, it will automatically stop after that month ends."
    },
    {
      "q": "How long do my ads run? ",
      "a":
          "Your ad runs for 30 days from the date you pay for it. Your ads can run monthly with no hassle on a one time set up if you choose to sign up for “monthly recurring payments”. If you sign up for “one month” of advertising, your ad will automatically expire 30 days later. "
    },
    {
      "q": "What if I start my ad mid-month?",
      "a":
          "You can start at any time. Your “month” of advertising starts on the day you place your ad and then it expires 30 days later (if you are on a one-month payment plan). To give an example, if you start your ad on August 5th, your ad will expire approximately on September 4th. (30 days later)  However, if you are on monthly recurring payments, your ad with stay visible every month with no interruptions, and you will be billed on or around the 5th of every month. *If there are no funds in your account to cover the monthly ads, we will send you an e-mail notifying you. If we don’t hear back from you, your ad will come down and you would need to resubmit your ad all over again if you wish to continue advertising. "
    },
    {
      "q": "Can I change my ad offer mid-month if I decide I need to?",
      "a":
          "Yes! The great thing about our advertising is that you can change it daily, weekly, monthly, or never change your ad at all. It’s up to you. Just go on the app and click on your business settings to “change your ad”. This is great for businesses that want one specific deal during the week and a different one during the weekends. This is all up to you."
    },
    {
      "q": "Do I have to offer “a deal” or can I just advertise my business? ",
      "a":
          "Because we are a deal based app, hence our name “Hot Deals Hemet”, you must offer a deal to our users (your potential customers) while advertising on our app. This could be things such as 10% off, or \$20 off, or BOGO (buy one get one), etc. Basically, you must offer something for our users. Note: You must have the same prices on this app that you have in your store. In other words, you can’t say on our app that your product is \$200 and you are offering \$20 off for first time customers, and then when people go to your business, they see this same service is \$180 normally. Simply said, you must offer a value that customers cannot get by merely walking into your business any normal day."
    },
    {
      "q": "Can I just run my ad for a few days? ",
      "a":
          "You can, but you would still pay for a full month. In other words, if you want your ad to be only for one week, you can take it down after one week, but we still charge the same as if you had it up for 30 days. We don’t sell daily or weekly advertising."
    },
    {
      "q": "I am a user, not a business, how does this work for me?",
      "a":
          "Customers have access to the app for free. We want as many people using this app as possible, which is why we don’t charge for the app, and we don’t collect any money from customers. "
    },
    {
      "q": "Do I pay for the deal through the app?  ",
      "a":
          "No. Users/customers never pay us a dime. This is an app to find deals. You simply find the deals with businesses you like in Hemet, show them the deal on the app when you purchase your product or service, and they will honor that deal. \nPlease let us know immediately if any business does not offer the deal that they have posted so we can block that business from working with us in the future. We don’t want to be upsetting any customers."
    },
    {
      "q": "How do I find the deals? ",
      "a":
          "You simply download the app, click on “find deals” and just scroll to browse all the deals for that month. Another way would be to type in a specific type of business in the search bar. Don’t forget to check back daily because new business will be added in real time every day."
    },
    {
      "q": "Can I get notifications of specific deals? ",
      "a":
          "Yes. if you choose to have e-mail or text notifications, they will come to you automatically."
    },
    {
      "q": "What if I have an issue, is there a human I can speak with?",
      "a":
          "Yes. We believe in human communication so you can talk to someone if you have any questions or concerns. Just go to our contact page and we will speak to you as soon as we can."
    },
    {
      "q": "How do I pay to advertise on this app?",
      "a":
          "Just go the “create an ad” button on the home page and it will guide you through the prompts step-by-step. It’s easy!"
    },
    {
      "q": "How do I pay?",
      "a":
          "You can pay through the app with a credit card or PayPal. You will see the payment screen after you create your ad. Just follow the prompts. If you prefer to pay with cash or some other way, we can make arrangements for that but this process will delay your ad being posted until we have the funds submitted to us.  You will need to contact us before creating you ad if you need to pay us with cash or check.  The fastest way to get you ad up and running is through the app in “create an ad” section. "
    },
  ];

  @override
  void onInit() {}
}
