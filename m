Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D1930F95F
	for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 01:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778983132; cv=pass; b=dYSbm5ihp5zHLHEUsOSH3ChS/JFUhOR/pkOX3oS+YfUTKG8Zc+XC7aOE+FJGvHQLGickFP7tZPnYYgy4lPLb7r0qhlxnMEa4e+vZTb6dhSt6QFND+q6/5IbZAINwpDFYZeVFodhizUYmHKdNLDe5u+KuThQPEvL/+le5PNygOnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778983132; c=relaxed/simple;
	bh=niUzT6v/78AAGMPCyd6s2Gdm6YbdmHLQG49GN1uZygw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JnTvbnJcV9bri+iFPPJX9zx5gVfceCpRcyWIGYjDiL1oNdtGoRc/zaCaInxdl3LiS7W7I++HIDMJFh/EmpQ9+3ksYIaTZ8u2rHA7IOaJkKh+EA91gDg5ErNkaLEMM6Fpc0QT48Db7II1hTEwOxQKeuU6PvRupxI9PRBELo8HOP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pm2siuWC; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pm2siuWC"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-393d6025f99so21851831fa.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 18:58:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778983129; cv=none;
        d=google.com; s=arc-20240605;
        b=jDpJoS9Rb7DsG4Cgmxt2w/hwHGzdTsMvw1xJIBG7khvwlMKxanX+rAHzeMVGvEZAIA
         LrvqQIHezzIrJw5eM1dK4d/54LyEbIkC1o2ATWgmmU3hkTA5lvE0JkpqkSQEmoA9W2ac
         z0uamFuV9rBmuriTrcFXkAbiDsoTF38ZGaTNuNiJ0NfK/kCh+VyD92CVCiMMihj2f7xJ
         PVV0l+ln3zJnz99x9qneFiPQ56KADrySNYga51i4hkLz8op9s4rWBPSgsjUEjLz3lYc2
         cJAvpxedSW2UXn3CcIIB13e3E6+6qjlvCwtlZYFxTLAGvh2BrjJYfAZl0xZic8uRnLYr
         R0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ew6sB79joxGr9EPxo3QOB6MynY8a/vc5bdoQGNee/4Y=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=OnlLjNJ+ikI/yQFe8sRWZd3fhh3XoaWJp/9Y58DQlfwIBkwMfJrtmqtqpRdEAbPncR
         Ivgxxax5059ZrCMwIFzCkN/jCEMJwovuI5lMNGU1D43I7rtbNOKgUJJ1PDOyfel/VPC7
         hyWRDodS9R8h7fsxOb88Igbp/MpftphmTA3ToSKhf4BRBlUe/BdGOom32iZ24aVDG9k6
         s0GttHfbgOLXAyOcLK7yecxhExtLrwyqvcGBvYNBeEwqHBhtbJXHzmiFzPogltyRGlwx
         uZkQocIZTqBr8UBpogXc4JpgR6fp0PB64rVaLLxL0Tc5IJx93K5i5/+wnmQ5Oup6ym/m
         eZKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778983129; x=1779587929; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ew6sB79joxGr9EPxo3QOB6MynY8a/vc5bdoQGNee/4Y=;
        b=pm2siuWCXNE9tmwXH4aLMj+iGs8YfKlBn4H0YWkFRBPcVuyOQSjJ608ccNB+zTUNRQ
         ZXLuaVrDTLuQVNfcLyajzkVUVaslSs0fG8akUKKiz+bUvU+PZtViT0aMdektR8YnZgt2
         pBC54+HeiEst/U+TBFE8Y2WvTYsni6IB/jbEDwgm+h7pUa+3+HAyTsS0NShiSB/TT9bG
         c3On/aHTmmHDE78xcbEeSIPfdTo/xukdUEp3N/VMS/YtgM9hRjZyxfQLdfdjA/RPGfXi
         UUlUXxkplfjsFn25RXQeifeAfWgMCBh3XysNesOA1iCWAWLVfoHP4CvUjLFuL+6dJtaU
         vqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778983129; x=1779587929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ew6sB79joxGr9EPxo3QOB6MynY8a/vc5bdoQGNee/4Y=;
        b=lNDnK7HaMFUaq0QuRnjU9nNSDNwUZw2S/vcA+7UUDf+Pmj8dN5st1NfBUxTwxv37QZ
         QAO8iGTFORrY8jFn+0tcSxlghNxvpww/BgDEozqWRf4/iLtnYSV202Qer2NEptMGmp5+
         kiR1LYecwOEcEn+QH1fGvhv293pz7GC1Gm7qb93GctsN0HHhlbCncMGgh3uXw+119B8J
         rtmXMQMa3hhYctPmKd/oEr22y9xcRW8rHWrrH28cO+wVV+LG7MCT7YobsKn07/2JlnXq
         iyU0rw0Vx3dZAtQ9rEAqFm6yBTBDkGs6sGtCQFa0bBz9PRrqzA34enwDaXscvgQozY3M
         CY2Q==
X-Gm-Message-State: AOJu0YxTlMZayQF1C+eXsg1hL3WQkbu5ow9YVIE/ha9j0bNad9J4uYTw
	UwYYCYPJma/AStsfubrtHzuNpmAMaQfSsdp4i9lQQ0fdCvaw6YdmtKume5i7WBbJgEoBpCgWyh2
	yU2SAHTyjFJ1epHy8rrdFKpUG2ks24BCP19YDBDkGAA==
X-Gm-Gg: Acq92OGjA8u/FRpVOmh38hvdsJly4I8jF0F2Wo99RHjbmkivDox/udFHOjoUuYocS2h
	xvxgeBc8bZH2FW+MVs9eHQvDjVptLgJsUANhqaqqVpbpEnTa/IZL8ImlK6hH9/I+hr2JOaDpHSy
	5SZ06Kvg6/BasKXYFrLKU6WOO1P5KAJ6VWxcWPAyLQt0fdAywAnrBVhxwTpTMtrTGzKx/1UoAO6
	S/KQTb7bcjnxye63yTiNRxSv63sWbuKkbYKDlUOkbGa71aX8FL1dE9weEnEb1UeaGGTdmWioBHS
	93i6ggeZaJZr87C49Kib/Z0HUxEMqduEACtjR60E5lsTO47K1Q==
X-Received: by 2002:ac2:55a2:0:b0:5aa:e35:2270 with SMTP id
 2adb3069b0e04-5aa0e35232fmr1815281e87.0.1778983128646; Sat, 16 May 2026
 18:58:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515123018.80147-5-kerneljasonxing@gmail.com> <20260516123127.C4D41C19425@smtp.kernel.org>
In-Reply-To: <20260516123127.C4D41C19425@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sun, 17 May 2026 09:58:11 +0800
X-Gm-Features: AVHnY4JoqwHWhpB4ebfeYxk1Uub3xyBo8iu99DllyE5LJL7pdjqufcGCBLrFwjo
Message-ID: <CAL+tcoBTEiL0t2zeh4CyKvfMTVXgPgh7-OS62GexPdV+aivmQg@mail.gmail.com>
Subject: Re: [PATCH net v2 4/5] xsk: drain continuation descs on invalid
 descriptor in __xsk_generic_xmit()
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 8:31=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] State machine logic flaw causing valid packet drop due to un-cle=
ared drain_cont flag.
> --
>
> commit 8841b899f0208ddaf58f3df5eb5feff9db62147f
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: drain continuation descs on invalid descriptor in __xsk_generic_xmit=
()
>
> This commit addresses an issue in the TX loop where an invalid descriptor
> mid-packet leaves remaining continuation fragments in the ring, which
> corrupts the packet stream. It introduces a drain_cont flag to drain the
> remaining fragments on the next iteration.
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 9c51eed6ee99c..ac4884a87a0fb 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
>
> [ ... ]
>
> > @@ -1125,6 +1125,8 @@ static int __xsk_generic_xmit(struct sock *sk)
> >               if (xs->skb)
> >                       xsk_drop_skb(xs->skb);
> >               xskq_cons_release(xs->tx);
> > +             if (xp_mb_desc(&desc))
> > +                     xs->drain_cont =3D true;
>
> Does this logic inadvertently leave the socket stuck in the drain state?
>
> If xs->drain_cont is already true and the current invalid descriptor is t=
he
> final fragment of the packet (meaning XDP_PKT_CONTD is not set), the flag
> is not explicitly cleared since there is no else branch.
>
> If xs->drain_cont remains true, could the next invocation of
> __xsk_generic_xmit() intercept the first fragment of a completely valid,
> unrelated packet in the if (unlikely(xs->drain_cont)) drain loop?
>
> It appears the valid packet would then be drained to the completion queue
> and silently dropped with -EOVERFLOW.
>
> Would it be safer to unconditionally update the state based on the
> descriptor boundary, such as:
>
> xs->drain_cont =3D xp_mb_desc(&desc);

Yes, I noticed this yesterday and changed it to:
if (xp_mb_desc(&desc))
xs->drain_cont =3D true;
else
xs->drain_cont =3D false;

Sure, one-liner code is much better. I'll apply your suggestion. Thanks.

>
> >       }
> >
> >  out:
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515123018.80=
147-1-kerneljasonxing@gmail.com?part=3D4
