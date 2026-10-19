Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427279;
	b=vT7NUaZdlkd3QKYtYzsm0esl+miVyVFXMEahABy0bOMRXbDdDhmCTIWH0/LfKUszYWdk
	 mdkKBbjQGEf3v4qsEyhK8QOUsrdGVL+NpIoGkYJZHp0P9BR6PBKRGQg6dRAgKnw7Dt5I1
	 Tia4Kkcq+RHlz6ZfVKs1Z2rynqrN7ZyUYQMrghB2hYMoej1GZDzq5OyyM8HjseN3ikhg5
	 nDSi04SSlgukntHzaY8LyQlMu1rpDC2JZtj0bzVOJc1duUh7XKKr+iQSFVtuGisDOXBrt
	 E7YL5NaAt24cKg11wAjIH3txvJ8qP4eVa3f92oq21CE9oChWqO4yOzXFucH/eJFfJrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427279;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=grtW76dvtFb1t9XrerLmKdj5qwyowpPAeH9vnpYNVM8=;
	b=2uixeTHw2rRQ9Eo3EAL1m4rD5bT8D3g2C3pBvSRIWfLmErXR5Fe+v2HoW1ENzuHfQ0nG
	 Msnjt/BU8jBZ53EA1XHjcUoGIyRqwVOtwgmANmbRNIBWY2CddzWdTCPxMg3WuwINd8Q4H
	 lkcuRjm+xewwsDYsY8zSpWZaGu87BJudyt084n9DH8vnvXALZWoNn1Mfz2dEr1paqFg7p
	 Iq/f1eMuGS8HYo75K6C/89hAVEP4fyblhmXMHybWvKJPTgTnkbTgGimSA73/+a148ydTL
	 lOQKgFvl6cjdMmZPSFex9fN5a2r99iCztouh9yLvblZfx089XIU3vdMZ/BNWYXLW1XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21587606AAD4
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 16:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21587606AAD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so3384873a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 09:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427277; x=1793032077;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=grtW76dvtFb1t9XrerLmKdj5qwyowpPAeH9vnpYNVM8=;
        b=DB8T1x6iwOAETG++Ro571yOV5a+mH6qjNmPCteOT4f7arEy1uO8X15kipCfzKOmz/M
         ybgcr2NzXETBdt4zConDJMzdisAxCJ6DZeV1K7bISbYO2Gr3SI910BmCtbxWYRpthu6Z
         gzrzIROXXIezimIHTeV/sz0GiZyDfppiRZ0+8raAda23uiBzSvrSGJiQ7IRCxMInRIp1
         8I3OpKkOFjAwzQGwAtVM3jmshw1U0zPBtjhxyu1vz7u/eweQdsi6c6EeunRFR+y2xzG4
         rZPA2BQmj5vnDzxBKoDum2/sQzqSpamKGX5ptBhzuOo6bd7dJtEVeupKVJiVOQrCX5kM
         3wng==
X-Gm-Message-State: AFq9FYIXl9VZbhg4xXJ0Z2bggRqQo664jUAuHpv7jWCdEfpSlINe6p/N
	LFULp6PR0vWQD4nLfXvf8ML0W0xE2ZtGz+1JEPiZhQOJfldsAw5+0A7nKY7nIN4VcfA=
X-Gm-Gg: AYBFou2jnphGWCO1+UrPiG400IFBFLgkuonz6aFUTfVe58MrcwpkN6SQHHXFhdohq4m
	Z9S+p8qx5VG84h3E8dTCrV+P99Ah9YR3vtMypHjNmfWTNOAi//akccKU1ezfpI0UA14kxykVylO
	/F5RcRYVCLRnM4cBPqATvHLByx+I20i8Ul/6sPPtvE8fl8/UFDEicleObKfDWOKARCNujJP4y0L
	dUJl3W1uJ5jun0jDJLNYLhZH9aEzzQBYcOw+a8+JQhbzzIhtr6bLn+5y3fw1W3yaS9r6dw6wnM8
	j8tPTXgm/XHsklsq5FSO1xMV/s1KLGNnu5qV5FxznyxSMs6c6zhhMCcdHO73jTF5shdbnnSV0gt
	yqUuWqr0aEhmo0pVZ7j8ZprvkgDaMMyoI2zZxwxq7rmc6TsDfzZayzUwFH7pcNuhl6DNkHLHrpC
	6zOCyyh7AVtUBsmnrV3zh75d0laCG7hGV34tpKqG/QC5FiyE19PAGliwJEXc9MWJ9fN/kWu0kEQ
	5XooSFCX4bgdWOZG8FVHJ4GLHJzhHBH+ZNE
X-Received: by 2002:a17:907:86a7:b0:c2d:c6e7:9e9f with SMTP id a640c23a62f3a-c419e93972amr587576466b.27.1792427277334;
        Mon, 19 Oct 2026 09:27:57 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32897fsm384962566b.2.2026.10.19.09.27.56
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:27:56 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso3331365a12.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 09:27:56 -0700 (PDT)
X-Received: by 2002:a17:907:9486:b0:c40:f9ea:7387 with SMTP id
 a640c23a62f3a-c4199c63fd2mr604034966b.6.1792427276005; Mon, 19 Oct 2026
 09:27:56 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>
 <sashiko-outbox-174605@kernel.org>
In-Reply-To: <sashiko-outbox-174605@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 18:27:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWT=9-GCt6pr3HT6C_=kxe2ud1y2jjXPZBH9MjcDYjB+g@mail.gmail.com>
X-Gm-Features: AclHuK-zFCPihodw8HUR_tYnDf84w30NySJpayeqxb6wS60EuVgB6NNWocEAZa4
Message-ID: <CAMuHMdWT=9-GCt6pr3HT6C_=kxe2ud1y2jjXPZBH9MjcDYjB+g@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

On Fri, 16 Oct 2026 at 18:09, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] pmdomain: unnecessary probe deferral on invalid domain index
> --
>
> commit c105920d803c0cf9396fb90d8428fdc4d83e8655
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
>
> Unlike provider-based look-up functions in other subsystems[1],
> genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> the provider is not found, thus not supporting probe deferral.
> Currently this is worked around in of_genpd_add_subdomain() by remapping
> -ENOENT[2].
>
> Fix this for all current and future callers by returning -EPROBE_DEFER
> instead, and drop the no longer needed remapping code.
>
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 964e44c2f78f1..88c886814a5b9 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -3021,7 +3021,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
> >  static struct generic_pm_domain *genpd_get_from_provider(
> >                                       const struct of_phandle_args *genpdspec)
> >  {
> > -     struct generic_pm_domain *genpd = ERR_PTR(-ENOENT);
> > +     struct generic_pm_domain *genpd = ERR_PTR(-EPROBE_DEFER);
> >       struct of_genpd_provider *provider;
> >
> >       if (!genpdspec)
>
> [ ... ]
>
> > @@ -3276,7 +3276,7 @@ int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
> >  out:
> >       mutex_unlock(&gpd_list_lock);
> >
> > -     return ret == -ENOENT ? -EPROBE_DEFER : ret;
> > +     return ret;
> >  }
>
> [Severity: Low]
> Does this change leave an unnecessary probe deferral in __genpd_dev_pm_attach()?
>
> If a device specifies a valid PM domain provider but an invalid domain index,
> genpd_get_from_provider() returns the specific error code from the provider's
> xlate callback, such as -ENOENT.
>
> However, __genpd_dev_pm_attach() still unconditionally routes all errors
> through driver_deferred_probe_check_state():
>
> drivers/pmdomain/core.c:__genpd_dev_pm_attach() {
>         ...
>         pd = genpd_get_from_provider(&pd_args);
>         of_node_put(pd_args.np);
>         if (IS_ERR(pd)) {
>                 mutex_unlock(&gpd_list_lock);
>                 dev_dbg(dev, "%s() failed to find PM domain: %ld\n",
>                         __func__, PTR_ERR(pd));
>                 return driver_deferred_probe_check_state(base_dev);
>         }
>         ...
> }
>
> Could this unnecessarily delay boot and error reporting for devices with
> permanently invalid PM domain IDs by forcing a wait until late_initcall?
>
> Should __genpd_dev_pm_attach() be updated to only call
> driver_deferred_probe_check_state() when PTR_ERR(pd) is -EPROBE_DEFER?

__genpd_dev_pm_attach() doesn't care about the actual error code,
it only cares about error or success.  Hence a change in error code
has no impact.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
