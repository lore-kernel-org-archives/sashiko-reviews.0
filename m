Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C72389452
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 09:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095434; cv=pass; b=D6pSUC9EKCGArOobDxjjOmNuagA9BI773Hj1beYtNB5INXDKY40CmpcN/I8Q4EES/ksKmALlqpEstwO8iSlQ0dOsGCV7dXz7OhuHRQTg6BTQCmikWqT1bg+DdkRe08jgyHFk3kqTMKu/43yDyhzGQGnpoy953eEymtjE0/hgboA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095434; c=relaxed/simple;
	bh=uHTN8NfGJnT96dgsJXFP3/yIeb0sw4lgywvjuy6wQtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EWXbk7TTiFNrlObpqBbcCR2lu91f2Ex7VtlynN5R5MWsmzKqMpHHZIwvv5SKd66weY69EEvGOW2As4qlmrHJYUHqZ8NlF/fMTMr+Tq36aeGLth5BZ/o8LZTwUZ9UJONL0PJjpUwzRFK/GDxF6CCTmyLFWKmdh3QqDLjBMdblu5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZHe5aSb; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZHe5aSb"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a8ee4b703fso1867300e87.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 02:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779095431; cv=none;
        d=google.com; s=arc-20240605;
        b=dCWQhJ/m0l0aTfeNwB08pFHrZ//bNZopkLkSLlottpQT5tgw7ZDXfZdWaGAiMrLYIO
         EPOV9T/zJdFV5qGw+120VyMeG02+ciCDQDSVyyRo0JrcUGFQIPBdeCMEgvOQocLom713
         77MXVHUTQPZ2ob4S2ImObLoFeACJiCf2YJDO+Awyic3PXRaGNZH+iThtG50PODYZgUOR
         nm8t06gElTN9s5A0oduZvRYamFcuYuSDNilrEEdYZN7IjLaLtcoXzLpUIHYeV9EwWXIW
         L27jE6eimoxkl9z6zZ4OR88OgGrM3dmxouBOavQYYncXVoEUAKIhYSNPD6Mb96bThXqh
         Uatg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/r1K8bP8+PsseAKaC+qZbXn1qbLOc7jjZj2aJft2jRY=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=CSKvS28vFjBS+rkVMtBcuN2k2du5e+5AuIIuRU6+4Po0cw3Y4cq/j+wvzX0wvE5ZJr
         R7jYJlNM6WzNxV8Fapu/5rES8IHFBA9eu64gqmi4WSVLukmcA2pESgB1VS8GlA7M50u/
         2NMSyNwc+2X+FZ/tMLhYLLH9k6q/Eqh77v8G4ddxgM/Ry9xtSAwDDRu7I+pvLX8O7ZMb
         zrArxJNis+PMWAyJmp15huI2RkBqUmMgHM5/hv12+nGeIdAIFCoZdf9s+wey3JUbeej2
         rz4C1c3Fqb1Wz953Bff8ko9lSff2Ek8swLq50E+RVfCOlqff0aNQndlwyK36GxsztRrT
         qPLA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779095431; x=1779700231; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/r1K8bP8+PsseAKaC+qZbXn1qbLOc7jjZj2aJft2jRY=;
        b=qZHe5aSbEfULn1AEm4QCh+a6i7ea6X9KIO5OvKpTqCgirfkTWbKn7jIWRy8q3DDh0N
         0OfGYNCOl4mdj+rbR0axe428JuV2GH0+5gywXSQgFQnrxk2Pyzt956Q5HrntQmFp/NrZ
         lIMuvU2KJ0ofiazysbXm1834cYUEkHBCfRijH3eKHcaW3KiOT52jPwKe0D+NpzhOJx8E
         hwY4u4CHDOEDCMvrsbuUH8sluEvF1jjdn634AXwrwIvHRIWSSjBt1jMs9rtFlukqCHcT
         LsFZEXsW9MaM60NHvatdol+YIBwQ6n2tQOYpkQMxWvXe+bM3xSmlbIZsqjQhHFSQa6s4
         UhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095431; x=1779700231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/r1K8bP8+PsseAKaC+qZbXn1qbLOc7jjZj2aJft2jRY=;
        b=l8g6/ry/NmEiE49LDCE7BYUbsbZ6olYLnFThInbIh/XLZwMzWeD5n/T1Or/ibteIbi
         HF4+bN+2YwI/x0e3WVj9blLYewWD8aQl8UMl1Lul5/JcC70Oi2ecm2FqGBAwhjnhFxlx
         W3Cr28paVH2agGVY/foVEzrxzLWndgzkXIB+oALZ4CHqE1zM3ULrcMY+56b3tKNrIwe/
         Go3lnJGfxm2rx6UynAQp68YAEwO+t60s/w3bN3iumKgUyGtw6zha0/r+wTsZ76nJJ46+
         LlIi53zXu6RiyeLJWXfGYXO2PRGDM+JWjHwBbksFBDcgurmQg+TB4/gtyeRDrcx8KwZX
         vixA==
X-Gm-Message-State: AOJu0YxL5HlmGj9mkuxBmpnn/yn25PBYSe276S5Ia5b0wh2BxbXH8OdC
	hRkA9VjP75qBJOJR9OGc6uSPTqgnwuyXW9pwZm3WAKqC50io9CTQK82eNCOma7W6X0n6yn4oGt1
	7S1687J43Hh4tHZ4bBnaRwPu5gyIR+vpFST8YAoyRpU78
X-Gm-Gg: Acq92OG16qTBelrb7nG9NM1fw4oaDBa9bDWvN+a5KnbvGgepfFmOIMxeJZhyt6AudwE
	N8hSLwL2mrm5bNmwhd8U1T/2qY6kG+UgCnnnv/oKgGDIVjZMZew0jHEDXTj2GDqATCQGNZVI+xw
	mWih2LYCDFyyl/yo4ex/iYIYTzJL5kQhCz8GaPYuQ91X8J0hkAQxOrfbThYZIHuaq7dMMkUGDxN
	wDIYtYzW5AdJhpm15OBjeTYtcGeMN3rqBdOyGFB0G+Nxgu6ldYAcFTIO1x1hG+u2obGFFQ4t7i8
	Z/9Os3tuE87o3M5BbSmbfPApCjCTzHYN8QVeJqFS
X-Received: by 2002:a05:6512:2384:b0:5a2:c4f1:2635 with SMTP id
 2adb3069b0e04-5aa0e74e119mr3652064e87.41.1779095430563; Mon, 18 May 2026
 02:10:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260517063311.28921-4-kerneljasonxing@gmail.com> <20260518063408.5F995C2BCC6@smtp.kernel.org>
In-Reply-To: <20260518063408.5F995C2BCC6@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 18 May 2026 17:09:52 +0800
X-Gm-Features: AVHnY4J_yeFtAi1KRLa-mCcAxqRBNxA_wAMywBg2D4_zBLETSSfz2IEZgdQ_oGU
Message-ID: <CAL+tcoBK5DD8Hn9_6XGwm+9U2_zPxVUAtnoHr+wk-gKjcJ_etw@mail.gmail.com>
Subject: Re: [PATCH net v3 3/5] xsk: drain continuation descs after overflow
 in xsk_build_skb()
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 2:34=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The commit message claims the function returns `-EOVERFLOW` af=
ter draining is complete, but the code merely uses `continue;`.
> --
>
> commit 5c0ce4e27ce234e8586a243e61aed44e90c34548
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: drain continuation descs after overflow in xsk_build_skb()
>
> This patch adds a drain_cont flag to xdp_sock to properly drain leftover
> continuation descriptors when a multi-buffer packet exceeds MAX_SKB_FRAGS=
.
> The main TX loop handles these leftover descriptors individually by retur=
ning
> them to the completion queue with standard backpressure mechanisms.
>
> Closes: https://lore.kernel.org/all/20260425041726.85FB3C2BCB2@smtp.kerne=
l.org/
>
> > When the last fragment
> > (without XDP_PKT_CONTD) is processed, the flag is cleared and the
> > function returns -EOVERFLOW so the next call starts with a fresh
> > budget for normal packets.
>
> Is this description accurate?
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 0a6203c425766..298194b7335e1 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
>
> [ ... ]
>
> > @@ -1062,6 +1064,23 @@ static int __xsk_generic_xmit(struct sock *sk)
> >                       goto out;
> >               }
> >
> > +             if (unlikely(xs->drain_cont)) {
> > +                     unsigned long flags;
> > +                     u32 idx;
> > +
> > +                     spin_lock_irqsave(&xs->pool->cq_prod_lock, flags)=
;
> > +                     idx =3D xskq_get_prod(xs->pool->cq);
> > +                     xskq_prod_write_addr(xs->pool->cq, idx, desc.addr=
);
> > +                     xskq_prod_submit_n(xs->pool->cq, 1);
> > +                     spin_unlock_irqrestore(&xs->pool->cq_prod_lock, f=
lags);
> > +
> > +                     xs->tx->invalid_descs++;
> > +                     xskq_cons_release(xs->tx);
> > +                     if (!xp_mb_desc(&desc))
> > +                             xs->drain_cont =3D false;
> > +                     continue;
>
> Looking at the implementation here, the code clears the flag and executes
> a continue statement, which proceeds to the next descriptor using the
> remaining budget instead of returning -EOVERFLOW.
>
> Could the code and the commit message be out of sync?

Right, will reword the commit log:
"When the last fragment (without XDP_PKT_CONTD) is processed, the flag
is cleared and the loop continues to process subsequent descriptors
with the remaining budget."

Thanks,
Jason

>
> > +             }
> > +
> >               skb =3D xsk_build_skb(xs, &desc);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517063311.28=
921-1-kerneljasonxing@gmail.com?part=3D3
