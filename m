Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8770A418A28
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 19:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784056349; cv=none; b=SnCI1fXQdA8tfII2FJsM074HmiKpH49dmIZphouiENyOjkLa5kwBSQpcUPFDBvD5h8JfIJn1M4BefkNsxy7D4HwvcGWsUmBBVtAgmE/myiOA4OGn3oSeo6gf4jd54E+aD2KU4kEXnt63hBST3YBuKDy4A1xrzVCNbcwR6l4co5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784056349; c=relaxed/simple;
	bh=NKQz55hxpy4V2/xw8iMhAaHilmGFcZmdA4Bdw1G6rTo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=iWw58uFQs4mGNz+JbGHK8vkm0hMw8mPq9ZU62W24VF9YRJZYdmtUmoDCwp1LJhDiKt/X5XPguuqDpb+hWbmmqV609bmzR0EljIYI8SHtri6xr9bPVucH6L9eRGCCa1ups7AT0XgVxSXBjn98b8G8ux3s2pvxPBPSAd4dlhHDsN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=D7T3B79e; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GDTRFcTs; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="D7T3B79e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GDTRFcTs"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id DA75BEC00BB;
	Tue, 14 Jul 2026 15:12:25 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 14 Jul 2026 15:12:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784056345;
	 x=1784142745; bh=tLip3RoufnJPJeBbpcoojxrxLCk+6g2vq1XFlcI4NnY=; b=
	D7T3B79eqgvNNcgXs5wOLs6jcjNzHZ5iIolHLBxW1Oeb62FFt7Fz8IM1Eqypq1IQ
	D4lBNgJBD37YDROUrqB5O3sqXbfFQ7x1nnhSXwTRpg9Va/jO4P3+3NRImMJgFQk/
	lqHHyP3OdpN73ZQzhRtqxJCfNw3Q0xfFTLsxCKeNGCBXqgyAjoCtDpn+sfeLR4TF
	5FuwIUQNbPjSoNvLqKoN21kmYpDwSyi/ESlS4alBQltxnvIir4Kied2hGdpnlQRb
	7e45H8/79sgbRhgt85DHWa0BWXmd8AYO4dFYQhQ2jYIdyczN7KRXWPrQAxxvyHLT
	3fVlzDq5IZL4RfFxYJiY5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784056345; x=
	1784142745; bh=tLip3RoufnJPJeBbpcoojxrxLCk+6g2vq1XFlcI4NnY=; b=G
	DTRFcTspGQzHX0No0owi7/3QsH42KVB+/8qNjzHm0Z+HibJYkkGvhVDyNRpcS9Sw
	PTGfU8P09TMN/zCJXiLzYy8fAWFw/CjcuIookfLYVit/6+guvJAgTolKnbK/IrKT
	HY4IAk42D4bZzB8TL0hw7E6prNgU/WxQuxhVWMRlxQY6Xz26MLFETPloEQptAzqk
	9bgo6xnLgtONB2z2+gMtfL/XQg7bDJ1ZcghPeJxjEnDiFICB/oBKW0DwZRFlG743
	jM6q+x0/UfNMJkmYVV1B4KenRl5BLtymc1BOqqIxL2N72bqYZXxMj28yxMXD+l+I
	t3ThIvWHSoXltr4h45Xyg==
X-ME-Sender: <xms:GYpWah9aHwjwzulsOuw6GR9p1l7nl5KKtBu4u618Q-w8PDreV8KY9A>
    <xme:GYpWaggNdHK0omDBpm_5-PLHndRj2n4cdSwq6wV6jWmrRRdaCl8tH3asgxKjRQCYy
    rd5EgEj2DHF5sGpsHivx7wm-Rg4pKonGje1r4OvpyoRWfIZvKF4bVo>
X-ME-Proxy-Cause: dmFkZTEszan4uBCfC6CBBOwC+6icxd081lKQSn1MZskwHoItpuHEdz+qLM04ltCMWvLQWg
    vNwQsZuo/EHr2DPm3c8KV3BRW/3o+gZY1Rqdc9BjC+QrKvKbsZCrI2BVIshm3izHuH3Ya0
    wci/QX0Fe4fIv+FTVP7FGvPA7Tl/KaXtF6RmQVsE+IwA3iiX/2tLmH1GkfnnVYw8F9WNAj
    4rv9aefvuVnwZvnnYd2AtG7aYXeGk2I1+AxMuGhYpRhFTXbnYZr2jmWtYa1sk8kMLM9F8m
    V2jP5ap/hZCEAfp5iWde3GVq7PENYGhuzlbnlPuNsGr4ntRC1u0zrMnBoiC5DJ4PoSTNnU
    KHksBsUZ5SqWaTsENjVOnyKvl9hGzMLNOrNLT6kcXWGLTqKpZmcZVkL3mutxo2VAmW2L9z
    EDyihBJllIC159RI2O3886S16ZYeRO8X9SzeWEMys7K1UhefeCGwS2FSCxEAwY4ejrovXd
    tkc3eRV7paXBZy2m7w4RUFLS8puKeSVKx28fnDwnB3r6yqXecP6LI5p+St7GyPUPJ92Ecx
    Yd4uosHPaCThHye2UNyxU5qafJTlPyUl4AkZSBYKvi/IS5EV5sem0I1xBnFFvYdL352eBj
    fSj9mk92mD632xpOmI0Od7uptE8xJJcLgkui76COG459r7c0X+1UTteeZCPA
X-ME-Proxy: <xmx:GYpWagKSOWVMNvAMYhfrC-NcyMhG82ofgzJFojGaStk0lbTjFUxWng>
    <xmx:GYpWapFQhSxnCFLL3F1lsGil8uVeU5oN5iqfoOW3B-Op-_v-SporEw>
    <xmx:GYpWasTbChXVxj3WAG0AoiON8ZBWW5om7PKHvahnK36Ed26wOXbJkA>
    <xmx:GYpWatfrMj_nmH5VUDku3Z28re-BUBwMLd9EoLDHyiqDzAKwLSaIMQ>
    <xmx:GYpWaqHVoZvLhtvMZPoudpm-LqU3-sjiolVlwvIDTiRr1o830SpLIPrO>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 934D31820082; Tue, 14 Jul 2026 15:12:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AP3t97ZhQAc3
Date: Tue, 14 Jul 2026 21:12:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linusw@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: "Conor Dooley" <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 "Rob Herring" <robh@kernel.org>
Message-Id: <68d6b870-593c-47f1-aaff-373a448e518d@app.fastmail.com>
In-Reply-To: 
 <CAD++jLmUwxEdEw23H0sk6YsBCVDPLtY_SA=SeBRcxf+jTO=4tQ@mail.gmail.com>
References: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
 <20260709-ixp4xx-little-endian-v1-1-e9622d0ba9e4@kernel.org>
 <20260708224834.138FC1F00A3D@smtp.kernel.org>
 <CAD++jLmUwxEdEw23H0sk6YsBCVDPLtY_SA=SeBRcxf+jTO=4tQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: decompressor: always set endianess on xscale
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026, at 21:32, Linus Walleij wrote:
> On Thu, Jul 9, 2026 at 12:48=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
>> [Severity: High]
>> This isn't a bug introduced by this patch, but does this XScale-speci=
fic
>> cache flush sequence execute unconditionally on all CPUs in a multipl=
atform
>> build?
>>
>> arch/arm/boot/compressed/head-xscale.S:__XScale_start()
>>     ...
>>     mcr p15, 0, r0, c7, c10, 4  @ drain WB
>>     mcr p15, 0, r0, c7, c7, 0   @ flush I & D caches
>>     ...
>>
>> When booting a multiplatform kernel configured with both CONFIG_CPU_X=
SCALE and
>> CONFIG_CPU_ARM720T on an ARM720T CPU (such as CLPS711x), could this c=
ause a
>> fatal undefined instruction exception during early boot?
>>
>> Since these CP15 cache flush instructions are undefined on the ARM720T
>> architecture and execute before the exception vectors are set up, doe=
s this
>> lead to an unconditional system crash?
>
> Hm.
>
> I did originally patch it like this:
>
> +               mrc p15, 0, r0, c1, c0, 0
> +#ifdef CONFIG_CPU_BIG_ENDIAN
> +               orr     r0, r0, #(1 << 7)       @ enable big endian mo=
de
> +#else
> +               bic     r0, r0, #0x80
> +#endif
> +               mcr     p15, 0, r0, c1, c0, 0
> + 0:           mrc     p15, 0, r0, c1, c0, 0
> +               tst       r0, #0x80
> +               bne     0b
> +               sub     pc, pc, #4              @ flush instruction pi=
peline
>
> which works fine as well.
>
> Shall we go for this version instead if it will be nicer on other CPUs?
> It has the upside of just fiddling with a single bit.

I think the version you posted makes more sense as this is the
officially documented sequence from the manual.

The potential bug I mentioned is with the instructions that are
already there, not the ones you add, so nothing changes there.

The only ARM720 board we support is limited to 16MiB of RAM, so
even if that is a real bug, nobody would ever want to run an IXP4xx
enabled kernel on clps711x.

If we wanted to fix this properly, I think the head-xscale.S
file should start with a CPU ID check and skip the rest when
running on anything else. That would be a seperate patch though.

       Arnd
