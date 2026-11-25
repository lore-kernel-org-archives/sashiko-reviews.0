Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795588773;
	b=Ktx2dEPkkmNnMsnyMeG17s5fLdiPdsC2oPSyAyUpCbaAzFv2gwVM/S0djROzaxQAyYvE
	 UHeilXpI7dwWZ4LmmRtUZ6FAY/SmlkZkPyHjgRnJPtmYOORs0oZVXGRSQlaYMFxzWteLb
	 86W2Cv/bjflZxDpHfL02WNSIKu1vYycGs6cPo+F9SBOBgcL1TskVFUBgV/J2QTYN80gPG
	 xTLu9lQW/7pMQvli3YipWl3PS5g1d7AYmfdgXCSS7NWQ2QPU3vAJJFWqxPghhcQwrr29u
	 b+PewwtORE1+n4aqc+LtHueUaoa4I5GF/SdmCBW0yubapV4FgLcoAvJ7VVz3nsR1VOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2N0HpHcM8mF9ugP713fWJ2a14UxLxacvTfc17W7cvH4=;
	b=VZrrAhsvkxXvv+lttRKlh5lCHuHiTnmu5qJUodDk21QuZw3ljChsySXUfUMr2h2mjscl
	 eyJpffvveS6xLHCdjV8GwTH8MONy0ElQ47Tsk1kIoLsbwueWqE1lJlfNUHrtZhvkLaozn
	 uIhq4ndiAVcMMdt+y6gD0ZTzABdkfDOlPKDDyELtsSK5okbHQ2QabfPCKYWrErOm1ItKM
	 srkfS6jNs6CqWTT2IlaynvvNIuqZwBhfZA2KimSBQLxufneCGoH+mEbJfUL3aLrGbwY5P
	 5+Egc9fM9RiPfkCenPrJJOSsHct+1ZoJhHVpNU/NspoeU6PKMHXaTwcljke+WUrnLqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="EsgmQ+K/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2D0606A323
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 06:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C2D0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EsgmQ+K/
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c51a02ad3acso18397866b.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 22:39:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795588772; cv=none;
        d=google.com; s=arc-20260327;
        b=V7MyxRlItF6DJWvzQlrWfRNhJicZYbJyp4ZOc69OAS+/E3kC5VtdCMErI3os2O7spG
         V2LUJtSuE3HrpV30jckxMq2vtRvdRnaWykmluKAy1/BmiuulFUxvS0qLgO2Jhgv6PeqG
         aGfvaUzIqCHgMsQ5pn+6Qv3BjiS/+bZGoG3ES5RaPZau3O28RNyazurrpFCQT8HYUVed
         qBOYK+YTbd4QtzFmsfwky4nEGkBsOF4RcjU6T7y41viHcVxW8tPzKLJrpIDZQesb13yG
         fGb54JQhUmK09xFRiRriuNunfHeHMqhMC8r+KIANR+hhY+LLXqIG6qslIJrszx0wxQgS
         3BbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2N0HpHcM8mF9ugP713fWJ2a14UxLxacvTfc17W7cvH4=;
        fh=c7V8DuPoDlAJfEK0Lr109q+NnWd99uKgMhZkW5586zU=;
        b=R/tuBJIsUunPj0P0c6AN1RssmlwzIoImsMlFH0zW3C2IEeaatF7ZX6GswXruaP4JWo
         ZpN7VHpGLsRA5NOtnym7D1TCMoDgEKYg3eOsg60nVe5XebHqdGLI6MSVwTN2rH2MIVDj
         7B1QGMqjm4LDnXW60aveD7qKS2POsXEU1E6ppzjOfFdBYB37rVcpLvRHRVbNYtYK2jYv
         avaDRyy8ltaMFKHsrBwDZoAdUTheLPNuD9UPw3uyQAZL7bg8tlD/uKdVR+B0uf9ddqqV
         4UCPj4qo5shc1BtPbZcgrhTwgb18hght7lhE3+jWYCtHWGnBKHOsFzsUbVuqQvEIZsQY
         Znxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795588772; x=1796193572; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2N0HpHcM8mF9ugP713fWJ2a14UxLxacvTfc17W7cvH4=;
        b=EsgmQ+K/GQoS4BFytOvWtxJeCK6Uf6W+HgjsRUwpUXwFdgPA7oOZHm796dzrj/Ml0g
         7bYejUbY5HqEldxkJX2pNlAT9JdgTf1Xyikl/8hb5fY2Ow7s8BnDZwmkVivjjWWwQkQ1
         1HKRejNRmSmsw8GHnELiV8+eBmCJv2ItJp+MtapsdtSeYJzG0ST+lCTNYLyX3mdtrlf6
         MJzHT6bD3yUdSYuFJ3Q6RCGS/ZKsvjmcAboVDIDtD7ei/Tz2XrCfQba/xNONBE4RlbJI
         /1afIOBdFJfuWE+T+n+TQlJVMLm/QhKMEToLF0bHjZhQspRP5NZRFz89tTQRB0HwmHNL
         3L2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795588772; x=1796193572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2N0HpHcM8mF9ugP713fWJ2a14UxLxacvTfc17W7cvH4=;
        b=W/nF1/fPOFzw8SpvTZH5MmcCf9GxhfAAhNJzmw2CsBOCDfy1OUE3r4DMdzpSbM1dix
         C1jTdXA4mWcRGFdN2RBdNY6ChBqJYDK80ooAoinqJj5Vk1sON9IeqCg8UxnCnUGKSX8+
         vxV+ly36i+taoYNY80faLbE5wePSjLyAC4qG6fqkikiNCUjv9AOZ4IO+4IbmxNSNt1rj
         MTpp7j8AIGvqEPa5RBlPOWqxDRzyBwyo6BeriQnIn2qWKYuly9K6Q+mG1Yx8bGv9Rglk
         7fZp6bR3ep98QU2kxbHLiLtjktsJBV4EA6ij7CVoEjEAnG7oE1oAzVwQJlqUXx8TLM9X
         zzRQ==
X-Forwarded-Encrypted: i=1; AL+hErHc5qw5wxwKHu+7QjJCNgoCc9GOrBof9DJhCFOtYHpSsqM2xTPO6te2jIykd7Q+qbbBlTTF9x43+/EJEpBXp3o=@lists.linux.dev
X-Gm-Message-State: APuU4Z/56KAq/WLbCPyCtfbgxU2aIP6jcnCE4upJiUvqkYOk0hxDWv87
	fjWJ3rW6GNoTDm/UwtBd06bdijn1Xj3s1W0O+fH0cvwEChOfmIAQit6x8C7lGpdNnTpRxr68WhJ
	LcH9S7zqpIZHpTQkduYU9Ya9p3/bVzTI=
X-Gm-Gg: AZFdTZemnEtjcHFm9TgE5skwrFQ9/C2arIA8lVVLGYnk4+YvyZwQRVb5eGlcXO79nmn
	uDRH6V9pMD4PRUkT/o2KyQZPFmLUrvBju+KVscbdBzJ6/PDbHqPTlDJweGvsZLVRSGgTHs3CGVJ
	X4HbNuXeDK5CBhGdPsug1KGitB0XFfZAM6uANQQ3fsupfcYOjSK7JSD6DT6VeBqmuorqPxyuJHW
	mAagplnqz5TwTzue/Mslk/tJaS5CoweGl+t4Tr2yUVXDqzmEBj8X+b1okeKa2sTQmLaKv/Xv1Y1
	uqgnIMl9pbcwO71tFLBIhytKoGXXTF6t7huTDiDAD+ALZ6x01lq/3hqG/wGAIWzLjFyOX6TzmSx
	36B32DlMy/XvJceW/F1rRLEbtEDU9ByT1MBGC
X-Received: by 2002:a17:907:a890:b0:c4d:31c5:e30 with SMTP id
 a640c23a62f3a-c513ab12652mr1505328766b.49.1795588771543; Tue, 24 Nov 2026
 22:39:31 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1793776192.git.zhoubinbin@loongson.cn> <c194b5248184779da500476281fd411fc80a98d6.1793776192.git.zhoubinbin@loongson.cn>
 <sashiko-outbox-196836@kernel.org> <20261119214532.GA757146-robh@kernel.org>
 <0009e3c5-dfff-4254-a06f-13c8664a1543@loongson.cn> <20261124134407.GC3404231-robh@kernel.org>
In-Reply-To: <20261124134407.GC3404231-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 25 Nov 2026 14:39:19 +0800
X-Gm-Features: Aa3M54rdaSaGyr7l6GQ5KvPJFYaTr3GJRENcNxHkmOtej3JVVHPOUUammhE2TCc
Message-ID: <CAMpQs4KRnVuZBZGtormXFK3X8n4KP_3bEr=OhwA-mHN72JRsgg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: serial: 8250: Add dedicated
 Loongson-2K3000 UART compatible
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, sashiko-reviews@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob:

On Tue, Nov 24, 2026 at 9:44=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Nov 24, 2026 at 02:58:40PM +0800, Binbin Zhou wrote:
> > Hi Rob:
> >
> > Sorry for the late reply.
> >
> > On 2026/11/20 05:45, Rob Herring wrote:
> > > On Wed, Nov 04, 2026 at 07:52:04AM +0000, sashiko-bot@kernel.org wrot=
e:
> > > > Thank you for your contribution! Sashiko AI review found 1 potentia=
l issue(s) to consider:
> > > > - [Low] dt-bindings: serial: 8250: duplicate ns16550a fallback bloc=
k for ls2k3000
> > > > --
> > > >
> > > > commit 71974153fe22bc00d365059be9198364c9cfaa86
> > > > Author: Binbin Zhou <zhoubinbin@loongson.cn>
> > > >
> > > > dt-bindings: serial: 8250: Add dedicated Loongson-2K3000 UART compa=
tible
> > > >
> > > > This commit documents the loongson,ls2k3000-uart compatible string =
with
> > > > ns16550a as a fallback so the driver can distinguish the Loongson-2=
K3000 UART
> > > > from earlier Loongson UARTs that require MCR/MSR signal inversion.
> > > >
> > > > > diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b=
/Documentation/devicetree/bindings/serial/8250.yaml
> > > > > index 01abd39509a7a..33c13c48ed56e 100644
> > > > > --- a/Documentation/devicetree/bindings/serial/8250.yaml
> > > > > +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> > > > > @@ -196,6 +196,9 @@ properties:
> > > > >                 - loongson,ls2k2000-uart
> > > > >             - const: loongson,ls2k1500-uart
> > > > >             - const: ns16550a
> > > > > +      - items:
> > > > > +          - const: loongson,ls2k3000-uart
> > > > > +          - const: ns16550a
> > > >
> > > > [Severity: Low]
> > > > This isn't a bug, but properties:compatible in
> > > > Documentation/devicetree/bindings/serial/8250.yaml already has a tw=
o-item
> > > > block with const: ns16550a as the fallback that includes the other =
base
> > > > Loongson UART compatibles:
> > > >
> > > >        - items:
> > > >            - enum:
> > > >                ...
> > > >                - loongson,ls2k0500-uart
> > > >                - loongson,ls2k1500-uart
> > > >            - const: ns16550a
> > > >
> > > > Could loongson,ls2k3000-uart be added to that existing enum instead=
 of adding
> > > > a separate two-item block?
> >
> > Let me briefly explain why Loongson UART `compatible` is necessary at t=
his
> > time.
> > First, as described in the driver, each `compatible` type defines diffe=
rent
> > driver data:
> > struct loongson_uart_ddata {
> >         bool has_frac;
> >         u8 mcr_invert;
> >         u8 msr_invert;
> > };
> > Since the Loongson-2k3000 has already fixed the hardware issues with
> > mcr/msr, we need a new `compatible` to correspond to the updated
> > `driver_data`.
> >
> > static const struct loongson_uart_ddata ls2k3000_uart_data =3D {
> >         .has_frac =3D true,
> >         .mcr_invert =3D 0,
> >         .msr_invert =3D 0,
> > };
> >
> > As for why a fallback to `ns16550a` is required in all cases, the DTS f=
iles
> > for the Loongson-2K1000 and similar devices were merged into the reposi=
tory
> > before `8250_loongson.c`, and this approach was used at the time to mai=
ntain
> > compatibility[1].
>
> No one is questioning what the compatibles are, just where you add the
> new schema entry. Use the existing one with the ns16550a fallback
> instead of a new oneOf entry:
>
>       - items:
>           - enum:
>               - altr,16550-FIFO32
>               - altr,16550-FIFO64
>               - altr,16550-FIFO128
>               - fsl,16550-FIFO64
>               - andestech,uart16550
>               - nxp,lpc1850-uart
>               - opencores,uart16550-rtlsvn105
>               - ti,da830-uart
>               - loongson,ls2k0500-uart
>               - loongson,ls2k1500-uart
>           - const: ns16550a

I=E2=80=99m very sorry; I misunderstood earlier. Also, after further
discussion with the hardware engineers, I discovered that the
Loongson-2K0300 should fallback to the Loongson-2K3000.

I will revise the patch.


>
> Rob



--=20
Thanks.
Binbin
