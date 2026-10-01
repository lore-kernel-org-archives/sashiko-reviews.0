Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B42A3CB56A
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 22:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790892450; cv=pass; b=CZXOkOwJ44ywglrhRavIWkOTfqxhvfY+T0hsBQPH9WS1kGefvYeZG5rFZLnubc55lh/ghSYfK2Ly2ZppvvURwA0PKc4ffb5SjsuhLxTsiBQ9MSExOjgNh5nulrEJKUM9/Kwd1hLvx0Korj6bnA7xSM75ErDScLqfiGOEqfDEUpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790892450; c=relaxed/simple;
	bh=zULUM4vXtsJXc9bEkL4iYDnVXVGXKvg3SjDao3r51pI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KPRY0zKz6ktvxEmQUBvnKw31GE1aiNFy61yRJ+UZA6kM45XXwNpPPfKU4KY/HXO3fzDPkcnKJegexBVeA3Zv+92Spd6xtP8X2I7DKfVr6BmHdLLje8zvXpMrcPXmMJLV/pT5Z9yYnYlkZ4+ZfFc40kW8H83GwT8Ae4K3R2oKZMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OeLgFcQr; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeLgFcQr"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-671563fb8beso7236480d50.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 15:07:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790892447; cv=none;
        d=google.com; s=arc-20260327;
        b=nEtz8oVy3X/mN+h4ohUFeCYjV4qOX4WehD0Psq6d4E0foUGy65HSD/xp7VWwPu4pHK
         hTiOrr8ChThsNoy33u9P8ItS27JWnbs6Q5pRnQOp3SVwr1/crMK+xf9u5MkOgmTTPn21
         jeeOfdvbyTsv3a0IxSwvD0RCGvfoHPRhKDB91xk0vRKW813TTrygADVErXhdEMYE0UoG
         0F5719+wr7vwfrV17Er5SpQ5xarLlxvVlad/bZD3HKS0Age0755ftnNaRii5eV9Rz4/c
         p6/BQZHBvXkEPBbG2MdVKv4lV6l8GkrSIGcD22LVFkMLqH2dzowkICfZ2TJgdMbwd0FZ
         WJuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qRnvWx4hvW9UfrQiuhK4me8Zst5xcEf8OHS5EhrlTSg=;
        fh=kAGRFKDN7aRGd6VO33HQbsOy3CoTfL4nr4GTMsDqfhg=;
        b=g2qdIdTo1MZu0+9hoO8/dopHT4Lexcp/+uR1vOEB9EP+hYVnUeolD3kf9k0N+lc5Qu
         /V9+jjizsBCU93RihV0tAW2sdYP71mKhFJSRo93S8SPGJAGVZRQyfnU439jKwHJyIMX4
         C+c4+ykrCe06XptTPZJCqtnNYlgmY7TO4kWpp24VRaXpZ22rYTsqRJys/gTeWEhGgK7X
         3D40YxAXQyiL0J8J8/9D0F9z10cICq9EM8TtRFQ8v9+vUhd+1/msajFzXpoT1PkbndRU
         JK/0yaatfY6FOT3JeG+KEVfN6dtY1p5t8mvd7DGEA5S+F95SHDzuvY9hMX1dYmEKF1/C
         +uJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790892447; x=1791497247; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qRnvWx4hvW9UfrQiuhK4me8Zst5xcEf8OHS5EhrlTSg=;
        b=OeLgFcQr3zPNb/Thb7j7vDUsISa1g58hFSoCKgycKIC21Y303gRN6X4K+ySB2gPPlx
         Ruv7zvEUvouAhBaEH6Sgx7wSgLGqwk7gc4NZUToD4eHY24wktMNFhgnFbiDNJPbdDcQS
         5GPgJUdhnfuM92lxzDxh3EHqQIoXg/F3hmWUJTODa1GDuzIP63OJFC85XGoGql9IxP7E
         z1fqxh4yR0hZxeUHvJo3wCoL3SrhBhAZh3F1jE6Gk7fiZPoLgEsG+f0VwfGLhU3Zksdn
         seQTKbxtxiNDOmvnV5dsVodlJkR1m/H23K3g3NhSrg0ULR7q+Yj7JJ04UlAKYqTF6LKB
         fLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790892447; x=1791497247;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRnvWx4hvW9UfrQiuhK4me8Zst5xcEf8OHS5EhrlTSg=;
        b=fgNoU5sQ6cijYxMGkf33BmD4/9JLGVlyP6RXb/DA0syQ1YUHvzGGpwnZLXkhrf2mWn
         2v6+0o6HyvRqQkrPnKvn6s3u+Hz8G9Szs1+nhLN2yCN9u9co/fABHFniHeXgD7X37cTe
         zUNluhCoZQdkgiRhdPHzcL20n5m7H+270RzN6L76c4XecZnHykrCBVs7mRpgXJf3JSRB
         OT7zE3ebwI8+q9AwKKIwE7xtarrtttkyTCsxYGpK/DcSN25dwZgdkuLWHV+K177Z6jrC
         aIGxemQZ6z4g954b1OGZA/hpjkpMeEzZs6hS9XmwSqTXn69NCAxJmI9dsdxu0IA/NOcY
         0GQQ==
X-Gm-Message-State: AFq9FYJxB8JBUMFAem1CfroB/XxZ7C4XHb0a7O0CJ5kksEMDZ/a5Pki/
	XINkC2BRtlrve2vazSsB29BqNV+QTAQPZASVcYbrdP4kyUr5a0WN06Hwcd2HirbOSvv3BCc9hlX
	kWApIGHj38dzPkFod6ObWEhGgTocyOoI8SbXp
X-Gm-Gg: AYBFou2KzeBgjiPoyqfN8gNnBjkRi52t+rWOk2Cc5eO/Kqog5cF6UX/nEbnvYLRAnHX
	+EeIROaeuT9T0NZbolCkImLst3ny6WT3ZdjlZFs+TtDQ/UKAb4WI+umuJ3iGzZm8h5vFIhjlMbu
	SKY0oXnmmVCPz1MVsPXdFgWKxw0zwq1mKtSP8AZul4hD74KXc+WNZrkTOz1acn1H91GUpmE9b42
	AZipgH2rVh9BujsEMNuQeS+ENg6TY2a8FoDJ36dnZFfb9g91+vb3N2UfbUxEjqAGyexJWGC0oKe
	XkQipoj+7ZYYu+I4jboMS75J5H4fJXO9O4z9rdMXRAWKgDTE3ngxI3B6SC3xy2pcq5a2JYMf81R
	DRnFfYCXuwPWqI9UU/8+aAzJ6EuTGwY+l1FxhAXKoKJoz
X-Received: by 2002:a05:690e:24a:b0:671:506a:9fb5 with SMTP id
 956f58d0204a3-677abfbae92mr332349d50.35.1790892447614; Thu, 01 Oct 2026
 15:07:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
 <20260923-dd-cmap-part2-clean-v11-31-9b6c217fdf2f@gmail.com> <20260923224722.F199F1F000FF@smtp.kernel.org>
In-Reply-To: <20260923224722.F199F1F000FF@smtp.kernel.org>
From: jim.cromie@gmail.com
Date: Thu, 1 Oct 2026 16:07:00 -0600
X-Gm-Features: AclHuK-0SkBh2JCEKbGxlnSItQq61tpkSYiR0faSf0oEXk0XEt53T5FhJ13xWCE
Message-ID: <CAJfuBxxDFgqVQt7CvKU5-G_i67a6zBr_Xi_h+jkjbrYVVYq-Aw@mail.gmail.com>
Subject: Re: [PATCH v11 31/38] dyndbg: split multi-query strings with @
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 4:47=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dyndbg: UAPI break for boot parameters containing unquoted @
> --
>
> commit a948e5ac96c252adcbc1059b7607e6fa7aab2b9d
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> dyndbg: split multi-query strings with @
>
> This commit adds '@' to the existing ';' and '\n' separators for dynamic =
debug
> queries. This provides a more shell-friendly delimiter, reducing the need=
 for
> quoting and escaping.
>
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index 6482fd28def46..636a88994a774 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
>
> [ ... ]
>
> > @@ -622,6 +622,30 @@ static int ddebug_exec_query(char *query_string, c=
onst char *modname)
> >       return nfound;
> >  }
> >
> > +/*
> > + * Split multi-query string on delimiters (@, ;, \n), ignoring delimit=
ers
> > + * that appear inside single or double quoted strings.
> > + */
> > +static char *ddebug_find_delimiter(char *str, const char *delims)
> > +{
> > +     bool in_quote =3D false;
> > +     char quote_char =3D 0;
> > +
> > +     for (; *str; str++) {
> > +             if (*str =3D=3D '"' || *str =3D=3D '\'') {
> > +                     if (!in_quote) {
> > +                             in_quote =3D true;
> > +                             quote_char =3D *str;
> > +                     } else if (*str =3D=3D quote_char) {
> > +                             in_quote =3D false;
> > +                     }
> > +             } else if (!in_quote && strchr(delims, *str)) {
>
> [Severity: Medium]
> Does this cause a regression for boot parameters with an unquoted '@' sym=
bol?
>
> When a user provides a kernel parameter like dyndbg=3D"format i2c@1000 +p=
",
> parse_args() strips the outer double-quotes before passing the unquoted
> string down.
>
> Once ddebug_exec_queries() passes the string to ddebug_find_delimiter(), =
it
> will prematurely split the string at the '@' because in_quote is false,
> producing invalid queries like 'format i2c' and '1000 +p', both of which
> fail to parse.
>
> Could this break existing boot parameters or modprobe configurations that
> rely on the '@' symbol in format strings (e.g., matching device tree node=
s)?
>

0. next_arg() in kernel/params.c strips only the outermost pair of
   quotes enclosing the parameter value. It leaves inner single quotes
   or escaped quotes completely intact.

1. ddebug_find_delimiter() was written specifically to track both single
   and double quotes (' and "). A boot argument containing '@' in a
   format string protects it by passing inner single quotes:
     dyndbg=3D"format 'i2c@1000' +p"

2. Previously, dynamic debug split multi-queries on ";\n" using
   strpbrk(), which had zero quote awareness and split on ';' even when
   enclosed in quotes. ddebug_find_delimiter() is strictly more robust
   than the baseline parser by preserving quoted delimiters while giving
   users an unescaped '@' alternative to shell-sensitive ';'.



> > +                     return str;
> > +             }
> > +     }
> > +     return NULL;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-dd-cmap-=
part2-clean-v11-0-9b6c217fdf2f@gmail.com?part=3D31
