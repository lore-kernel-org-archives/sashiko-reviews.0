Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393263B635F
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 17:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782840448; cv=none; b=YNKzBAlLkmLYNjO2utnR4LSGZ8yMOTVyyccvz7WY+0BqUQoKB5Xk/AWV+Z0agprQ1WE+lhw/lkP7UvcCyQdwC3NMrOdgGQheykto1EAHZWQth5Nq7q3TYitemo95MCHulrzGlJGJaYO4N2c7dk5E66ySklZ3Qg5HJEz4/n8oxAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782840448; c=relaxed/simple;
	bh=Ui7xph1FakYsq3HDXzXn3A0D+CxEKkWQu8ruYkXWl9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4CGAjCexDmvZC0afe0Zn8JlljWCsEsJbScnYwqQ9IDahVOC97a8bm2S4bSoGg6vyJ2Lq0dVFJVLr8g/vhDU1xA5YBVUj0hJ4aGMsxqPMqFYDymv38HuQugkJkXT+ft6YFSR2g5NQ0r1ftyq1c5jb71hOXCChB2lu6KTBm8ZEuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dGDgQW3j; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dGDgQW3j"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e65e18969so100074185a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 10:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782840446; x=1783445246; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjlDrMRoPYYkrW6DmAw6cn1cINOF/LZ70UTrDBTu1Oc=;
        b=dGDgQW3jY/8ixxBimQ3lUXYJB00dR2QoW+3MS4oHOZPZKuFcWEFrFFiHb/Abw25/DX
         lTSTdcDdYKGfReFrIr6kDKRzBbvWuNlTO3Ys+suN4yi2exEspPULPKMgA6uBdi2nM7YK
         rAeWA2zpYAkAZftYnSu+G6fx1pxhh/mCol1qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782840446; x=1783445246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xjlDrMRoPYYkrW6DmAw6cn1cINOF/LZ70UTrDBTu1Oc=;
        b=Pf6MgLyAUM1miTziStF8/c48IQJLAxc6RRTnyLkJKg+/xnazg1PwRvlqoUR3SR4Bqg
         0WPbuMubEdMEpt83ZKcay2BUqnBKyVbmajugh2DbxM8XIB4LXg7KwjFQdI1k/6u31sfN
         MnRYCIyovUU68qwrL80jTivz20qjM1XLWsyS8I1O9Qf23vUA1LJd35uESvKV1hD6BA6H
         6reEGb8ugu3HN2UBWGskGjcQp7DCKLhWWWwBkYJxR302LAzUNPptXuIbfVxBduzeKKrs
         MRVS2v4ONtcGaLGuuRR93obQs9LN3JycMHqEdS8SyVao2IqCQKVQUHApL5N8F0XL62tg
         xAmg==
X-Forwarded-Encrypted: i=1; AFNElJ+sq4fwdBjS0AI6Ao+sa/EQnP0d/9wX1AyfiIjoE3csw6SW9u7r9LdQtndUNiaqNXOYDK5m1GOT/5xN2hbZR3A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtuvAokWBbIplsBWIPEnI4Opcd+SspISITbKagmpEqzy3nJdSb
	4SKDElbqQui6uHYDxFW8sKKmbQ/ovpxKXg93aqltDgsV+5Xxj5K5F7iOA91+Dd7yeRSWwrY/5K6
	X7h8=
X-Gm-Gg: AfdE7ckltn9X9W8as/b0/jbWG29Tgfslcrl293XF336q8B09fOR4Hsa62AArWOGOHR2
	dkRBOGLWuhxNiKst5rNyDJQpGg2AZkP/D0Wa+cBAOkeN/oFYlzOF1uBSpNRSYr2ptXu1zl2ufAH
	zyKsJqddITkg4yk2TiANrAMsC2OQVFfWkxQe3dyNvG+a/VOSmeZq/XqcnhcUERDFgL7tGKlzoMr
	7SUCL0Lls1j9DDW5ovsoX1ScNpcR5nlCk0jrNGBqT1D8B5TFIdETPATxeRoyu06RuBack07OkKV
	Sq1ywYE0WPh3vvfABWuqU9IHO66RWQHgCj+rv1qsjiCyDCwBxYzmKu5mBbL1AJ/JFe5hPHEC4e9
	6BVeDR2+7dDI2wDpnqwaHtt0T3sp5DqEfUUpQJyZHGxms160qpZsnxakanejK9EXgXNpp6jCnIf
	4QbBABlcPwqrr6KbmwuYegVeGuWirUQKbx7iIAqbT8VaXFOTQOo+A=
X-Received: by 2002:a05:620a:4587:b0:929:7356:2e51 with SMTP id af79cd13be357-92e696e6c05mr363998285a.11.1782840445681;
        Tue, 30 Jun 2026 10:27:25 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com. [209.85.219.53])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e622e7fe3sm292026585a.27.2026.06.30.10.27.24
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 10:27:24 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ef1dc934d1so11377576d6.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 10:27:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrD7oTQPy9yv7HJGIuTxWFZ2lU0xiU8RlXvcNqMAwXVA6tZGvkbxkcKKKB4stIH96sKXcJd0uShchrUFY9vQyg=@lists.linux.dev
X-Received: by 2002:a05:6214:2a4a:b0:8f1:5e32:9b06 with SMTP id
 6a1803df08f44-8f2526fae93mr34640366d6.13.1782840443561; Tue, 30 Jun 2026
 10:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629012200.248066-1-zhouhaikun5@huaqin.corp-partner.google.com>
 <20260629012755.613EC1F000E9@smtp.kernel.org>
In-Reply-To: <20260629012755.613EC1F000E9@smtp.kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 Jun 2026 10:27:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHxvW6+wWGz7zRHwxusfaMonDQT+gD2v7HHY_K7yGD+A@mail.gmail.com>
X-Gm-Features: AVVi8CdfztTOVwUr0FcV6Z32wSoWmheiYIh35uOdZjrqLBaiLQ-1koiT0DGa2Cc
Message-ID: <CAD=FV=XHxvW6+wWGz7zRHwxusfaMonDQT+gD2v7HHY_K7yGD+A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Support MB116AS01-3 edp panel
To: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jun 28, 2026 at 6:28=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The panel name string in `EDP_PANEL_ENTRY` does not match the =
actual hardware EDID, breaking the primary identity match.
> --
>
> commit 0f4c5c953c19a29919cb343c3bc25a2803059da7
> Author: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
> drm/panel-edp: Support MB116AS01-3 edp panel
>
> This commit adds support for the HKC MB116AS01-3 eDP panel to the generic
> panel-edp driver. It introduces the necessary delay configuration and EDI=
D
> identifiers for this display.
>
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/=
panel-edp.c
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -2099,6 +2099,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
> >
> >       EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200_d200_po=
2e335, "LP079QX1-SP0V"),
> >
> > +     EDP_PANEL_ENTRY('H', 'K', 'C', 0x1203, &delay_200_500_e80, "MB116=
AS01-3"),
>
> [Severity: Medium]
> Does the panel name string in this entry match the actual hardware EDID?
>
> Looking at the raw EDID payload provided in the commit message:
> 00 4d 42 31 31 36 41 53 30 31 27 33 20 20 01 cb
>
> The byte 0x27 translates to an apostrophe ('), which makes the hardware n=
ame
> "MB116AS01'3" rather than "MB116AS01-3" (which would use a hyphen, 0x2d).
>
> Because drm_edid_match() strictly compares this string against the EDID
> payload using strncmp(), this character mismatch will cause the primary
> identity match to fail during panel probe. While the code will currently =
fall
> back to a secondary panel ID match, this completely bypasses the primary =
name
> matching mechanism designed to distinguish panels when vendors incorrectl=
y
> reuse panel IDs.

Please fix the AI's review feedback and send a v2.

-Doug
