 // import $ from 'jquery';

// let cheerio = require('cheerio');
// let $ = cheerio.load("https://www.tripadvisor.com/Restaurant_Review-g60745-d7920950-Reviews-Izakaya_Ittoku-Boston_Massachusetts.html");

// const  restaurantInfo= [];
// const scripeWeb = (index, element) => {

//     restaurantInfo[index] = {};
//     var header = $(element).find('.restaurants-detail-top-info-TopInfo__container--vc64u');
//       const restaurantInfo[index]['name'] = $(header).find('[restaurants-detail-top-info-TopInfo__restaurantName--1IKBe]').text();
//       const restaurantInfo[index]['address'] = $(header).find('[restaurants-detail-top-info-TopInfo__infoCellLink--2ZRPG]')[1].text();
//       const restaurantInfo[index]['phone number'] = $(header).find('[restaurants-detail-top-info-TopInfo__infoCellLink--2ZRPG]')[2].text();
//       const restaurantInfo[index]['cuisine'] = $(header).find('[restaurants-detail-top-info-TopInfo__tagLink--2LkIo]').text();
//   };
// console.log(companiesList);

// export { scripeWeb };


let cheerio = require('cheerio');
let $ = cheerio.load('<div> class="restaurants-detail-top-info-TopInfo__container--vc64u"</div>');

  $('.restaurants-detail-top-info-TopInfo__restaurantName--1IKBe').text();
  $.root().html();

  cheerio.html($('.restaurants-detail-top-info-TopInfo__restaurantName--1IKBe'));
  cheerio.text($('body'));
  const $ = cheerio.load('<html><body></body></html>');
    $.prototype.logHtml = function () {
  console.log(this.html());
};

  $('body').logHtml();
