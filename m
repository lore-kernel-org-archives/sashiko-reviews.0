Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794285735;
	b=R5DiNivNNXnkCRkPWN9Ng6Tkm+1UEycS5J7+mJ2bZVeV04bLejGKN83JNUlSQXSrC0Tm
	 eBKarj5M3aiTtM2SzmBQxRfFVv2Ail1Dmmw3e5wVcLalBgy1/TR/zkmnCi9RVE/yMrsc2
	 g830r6GWNk0ZVF3lhVGg8ii4Uapc3LZhh5uBgANlGKA9xCkt7Bdp0KMGHsjvrA8Y5Qfsx
	 wz11jJvg36xgshkUW63BelYEcKjfqhcjoYWxWHWKytd1J0qDqIY5FwJAa9oRLNYiH2/bO
	 zWR3CFbfBDu1b41AqRJJGCq1R2qdWrycrZNN65FN3pds33WMrZIl444UVJKW6OqtCxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ROinplkTxqEpdG8wQz+UQs4W74CbHVLhLR8dpDiNGwY=;
	b=eCFPDAispvOEFff7vqou03RJybZZaqFL2+9ePe/OoAfeCtWk/RY4DeCmb3ttlHKpPqcu
	 2CF1KLro5xYnRzoTQ0UXSPIZrtkKfvtC9lBrYCy3ptiB7RFl144g7cH2hMBDy/SLMwq3R
	 70jt5ZQ9aEe35oXLTOevzKnhWfOrTia8DkGPZINurAcIP3lqvHndFQKXiWTkwWlBvEaH0
	 eE6ES7TEGlpEc8t8rbqa+FM7R3JSMu9/pTWsQvRQ49pExZxLEsQeSo7MMXJG8PyeiXN6o
	 vL6w0sDoujUN9ffsMGyVG6p/R0Wt5zLN5xZFaHc6jw6wFNxfSM3g84dY0V+Bs1NVgUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b="Hm+3BMk/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F81606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 04:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73F81606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Hm+3BMk/
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6dd7070699eso957688eaf.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 20:42:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794285734; cv=none;
        d=google.com; s=arc-20260327;
        b=l+5APYPZ2Va6IUsqsyspB097BDFJm8+HzFccIDJ+M2XMhFvDOTodea6z7uqagDyCXf
         b51g2jb5XQLkxHKaohHrTaT/qLpwGJttVqf6nb737EA7mLp6DwfNV/VIWSZNScjyNYct
         DF4/TbvoY0Cb02OPGPoIT8iU1gNjYGjHG9YYQeFM/joABSzxyf8C/aAsbk+nI1b/9oQC
         LaQ2QED52OjRtTAUTATkSBSWXRwjn/IgBlt3Lf2U+HmBlLHaWwIRoEvWoURlk7yOVJLA
         rSsKTG5A30PULvZyBUjXfuU761zZ8bz5cTscaX9qCDdA9M9T8HmUjt2IVx98BTMUNdV1
         CjVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ROinplkTxqEpdG8wQz+UQs4W74CbHVLhLR8dpDiNGwY=;
        fh=PqfXm7a08WrvkxC4ErIq7QV7bol4Dqx8CeublptW7zA=;
        b=HSX35H6j2ka6OIzjVUGF6OUYR1eEIxqoSKb3ihcoLEw73hb8pDrED6ch3O/dWEfx5q
         KaKZ0Up4U73WhEaM4plx7LcRMdXdTFn1F6YCuhzIe3oZNjimh4CcBY45hdQVrOAodTS7
         V3YZ88qb8bLKZVK4WQrOqlzo2hsYADv0RR1RV2euruKpxrDJelsXywsfQuw922I4apKX
         GfoOBVNAT1dfMZ/bAWy1a50pe3QDLQCan4Y92sAJaxu8mBpIhrI14fGxbJeWdvGcGDpq
         cMwgm+LUJ4iDIIlYeY+4ITgfALvYNzYHK95XLfxnG9ayF3eij7APVemX9NNNoCyzRDKv
         Wx8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794285734; x=1794890534; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ROinplkTxqEpdG8wQz+UQs4W74CbHVLhLR8dpDiNGwY=;
        b=Hm+3BMk/YTedr5q3oEJWYfAQea05WE5FtVLse+Xj7ysYT2p61ktMIUXpnZRlAFWckH
         wwCwIwSsXAwT2vSFx/3MnrQmQCRZ1asIccT9M4NgI97QCumWm6OrXW0WHHk07f1wxJOS
         XR379gmpVhwrCoQoyY8odOXk1n/kNojiLCv2LZ+w75TZ+BIkQOM9jX2FkYhthOeWsXia
         PgyTv1MhulCy/QTJHklXXe2aMq+CDp5KqZb2SbpiVmFDhjoLJyGwM3PzAFSP26nzin2F
         PLR7H+2jFRmQoFjHiEb0c5WoQN0gvPdAgD4PaY+pCra6KTq6zRDzYpS+y4XXxH7SKcCg
         7Zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285734; x=1794890534;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROinplkTxqEpdG8wQz+UQs4W74CbHVLhLR8dpDiNGwY=;
        b=ur1XtgrGM+1H2bH9bzd7F9jd+pq3D9Hy8thpn2SDXpQwpqFBqXtaTZQ/EGu0SpPofb
         uz8CIfCdGVFJwjL8yGV/QqxSU/r5R3aaXItwtYQMo2s2rLkunBDhx1XKnOrMyBLYM5xP
         nwmXmZNKLnXpKnqTbeMmbNVtb32mjdZzQnMA+/P3L+DT2/D2UBKOwJdSZ/4XBNdNc1AQ
         +nH9W5vfOz1PO8CNdz0DfyaHjLhUY38JCeOLo6ku7mEUd7UEWaJ16MK8QloyRIIB7jSB
         gdEtRdKxvLS/C4Vs02//W0f66W4eLO/6PXqvUwCbBxk27LYq9cPTJAoi13fJl9KEDwV1
         hUKg==
X-Gm-Message-State: APuU4Z9AYfgaRlAQ0Puq1q0z8Lb2xkZwQQeSdYD+Lt/x8u+pz27Bsp0r
	wSxCVEAbqBSZIiqEqilUXggH8s5nAcO4UgUgpdw5Gervsn/5nFXVav3uIiXsQxXfGrSbfUhyWEA
	O1NbT1GnQYgvg02m85SrUrDyrluQRZapMla24hRGxjvTUAveI6LHBoLrlxw==
X-Gm-Gg: AYBFou1NvmLdiDeuyD8Iu2DqzkfPhQ3pSwsHvHQ5R0qHHdGEIqEGM1mh0jN5YKbj9/u
	Or3ItRHyhql6KBaQt/96YJQznjt66g+PQsWrC7CT0yEP5DQ8+/CzOjTaQBaMUSMaVsmI/Of28hd
	ZBf7vCP0mQIYm4Ui1Ntmsvrnh7tkFmNVCKJzP8heuhxOuHHLELBkYpbt/fYbW04geByAJmwDDvB
	DFdlA5yt4prejFUxXAQYGoBm30KC2x0+kLmNh8VsyNWWhTBFL3labS1U7KsMqMIVDQT659Ymbix
	fleDNSlzbN6mJj0yiU4Iq+qZZ213/b2zPi00YClHxIeGiK+Gs69jJGMUXLTNjlJ9kbkShZqH7lt
	T7Iq2ExdKCiiglG7N/qEXt3HbAyLiN12B740Hbqwoht/5L+Cilk7g0FFg2Xg79fJmk1kcYeyDsv
	PlCRi/ppZcVw==
X-Received: by 2002:a05:6820:824:b0:715:2424:b6c7 with SMTP id
 006d021491bc7-718a25631ebmr744221eaf.2.1794285734188; Mon, 09 Nov 2026
 20:42:14 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1794281983.git.tianyi@cloudflare.com> <115997f55d63b507ce54fbe9e22900b59016f3c3.1794281983.git.tianyi@cloudflare.com>
 <sashiko-outbox-206183@kernel.org>
In-Reply-To: <sashiko-outbox-206183@kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Tue, 10 Nov 2026 04:42:03 +0000
X-Gm-Features: AclHuK8b0bXERRMbxB4h1nf7ja09xd60YTNUFZCGO3eGicEqv2ygIU4ZDyBl9Fw
Message-ID: <CAG4wq-f7LgXVUu_DpH_Nk1ab1ghistFijw1m2mTxHxN_0hBWxQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 01/15] xdp: reserve an skb core extension area
 after the xdp_frame
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, intel-wired-lan@lists.osuosl.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Both comments follow the style around them in include/net/xdp.h.
Most block comments in this file start the text on the /* line.
I will keep them as they are.

Cheers,
Tianyi Gao

On Tue, Nov 10, 2026 at 4:18=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] xdp: multi-line comment style violation in include/net/xdp.h
> --
>
> commit c815cea2f0a60c677b6335d7bc98d4ff8c9346df
> Author: Tianyi Gao <tianyi@cloudflare.com>
>
> xdp: reserve an skb core extension area after the xdp_frame
>
> This commit reserves an skb core extension area in the XDP headroom after
> struct xdp_frame and updates XDP head, metadata, and pull-data helpers to
> preserve it.
>
> Link: https://lore.kernel.org/all/1d5521eb-84fc-4417-a3f5-6366694d160a@ke=
rnel.org/
>
> > diff --git a/include/net/xdp.h b/include/net/xdp.h
> > index 07231adfb5f82..c888353425d42 100644
> > --- a/include/net/xdp.h
> > +++ b/include/net/xdp.h
> > @@ -81,6 +81,9 @@ enum xdp_buff_flags {
> >        * XDP program is not attached.
> >        */
> >       XDP_FLAGS_FRAGS_UNREADABLE      =3D BIT(2),
> > +     XDP_FLAGS_HAS_SKB_EXT           =3D BIT(3), /* skb core extension=
 header
> > +                                                * is valid
> > +                                                */
> >  };
>
> [ ... ]
>
> > @@ -450,6 +464,37 @@ struct xdp_frame *xdp_convert_buff_to_frame(struct=
 xdp_buff *xdp)
> >       return xdp_frame;
> >  }
> >
> > +/* skb core extensions: RX metadata that an XDP program stores in the
> > + * headroom right after the xdp_frame, for the skb that is built later=
.
> > + */
>
> [Severity: Low]
> This isn't a bug, but BPF coding style puts the opening /* of multi-line
> comments on its own line, with the comment text starting on the next line=
,
> for both XDP_FLAGS_HAS_SKB_EXT and the comment above enum xdp_skb_ext_id.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794281983.=
git.tianyi@cloudflare.com?part=3D1
