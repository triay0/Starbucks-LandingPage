

class utils {
  var pattern = RegExp(
      "#([A-Za-z0-9_-]+)|@([A-Za-z0-9_-]+)|^(?:https?:\\/\\/)?(?:www\\.)?[a-zA-Z0-9./]+\$");


/*
          fun AppCompatTextView.higlightHashtags(text: String) {
            val spannable = SpannableString(text)

            val matcher: Matcher =
                Pattern.compile(Utils.pattern)
                    .matcher(text)
            while (matcher.find()) {
                spannable.setSpan(
                    ForegroundColorSpan(
                        ContextCompat.getColor(
                            context,
                            R.color.twitter_color
                        )
                    ),
                    matcher.start(),
                    matcher.end(),
                    0
                )
            }
            this.text = spannable
        }


  String formatNum(num) {

  switch(num) {
  num > 99999999 -> "${num.toString().take(3)}.${num.toString().get(3)}M"
  num > 9999999 -> "${num.toString().take(2)}.${num.toString().get(2)}M"
  num > 999999 -> "${num.toString().take(1)}.${num.toString().get(1)}M"
  num > 99999 -> "${num.toString().take(3)}.${num.toString().get(3)}K"
  num > 9999 -> "${num.toString().take(2)}.${num.toString()[2]}K"
  num > 999 -> "${num.toString().take(1)}.${num.toString().get(1)}K"
  else -> "$num"
  }
  }

}*/

}

