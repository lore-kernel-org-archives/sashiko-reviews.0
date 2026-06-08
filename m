Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905803DDDB2
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 18:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780943988; cv=none; b=IX2rqpEtfnEu5NeOv8XpOY5Bzc5d/HYe/OPVLloVvwkETUJ3WFgyMmNyocZ466w8tcbFqSVB0obp6XVMGYn5fcidvjb5z1wvVkIHaw7KWUDzre1V/lUTj8CsPquOanRh1MmAuwPt6M62B1J3d+rMqoDa+7drqoNZ8NfqWjoRDU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780943988; c=relaxed/simple;
	bh=BgqaAOdMbdNfmZwY2lEKuSPdbP8uuMDcXr371tSfw6s=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=XXmQ2/+KoQ5kf4BJWcTuVr6de080kzk7Wj1r+GdXqjggCt0Fa+hF7na9pakQBxJhUV+lHUThMMeAjXD4Si67zl/LtBfHOWbPp+fi/UYUTWJ5f36uSGibo4x8RKglZb1k1fyKiv42L8VSHXAI5evzb5d4h1NQWLzx8qejlNIAu80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=kAfpW42r; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="kAfpW42r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780943984; x=1781548784;
	i=markus.stockhausen@gmx.de;
	bh=YzV4M9eiBRxlfZeEY5tJ3IhHlr30Kfj8k1+0Rw1qCvg=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kAfpW42r8UdsWxh338mjen3XXT0GqOOWa68BOjK5AHF1T4X98RQkvw9m7GcmeY5L
	 9Fjzk/2aJOZ0hiPE357vEQBfq3g3PaaS1xzl10+di1kOzzxckcQcIB0OLZeM7K4jr
	 5y7AQj+IZ8CqyM49SIga/oFInZmzmfPzzLr1uR7XV5S2twiCc+wbn3fhHC4SzRoCr
	 6SkDkwkTOkKIGoqH4LQKbdEfimna1b5crw68UM6qLMytSRW88nqOfOO5RSKBwCzbx
	 +wRHi2AMAbIZngOf/X5aGgk2ICL7pVgOAqsm/y37/KlnHbafxMwDgizL1GI6fx5Lk
	 hPHniMjp03JmiS/KGA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MybGX-1xStLB1KyD-011TQz; Mon, 08
 Jun 2026 20:39:44 +0200
From: "Markus Stockhausen" <markus.stockhausen@gmx.de>
To: <robh@kernel.org>,
	<conor+dt@kernel.org>
Cc: <devicetree@vger.kernel.org>,
	<sashiko-reviews@lists.linux.dev>,
	"'Thomas Gleixner'" <tglx@kernel.org>
References: <20260605211646.2101652-2-markus.stockhausen@gmx.de> <20260605212533.75D231F00893@smtp.kernel.org>
In-Reply-To: <20260605212533.75D231F00893@smtp.kernel.org>
Subject: AW: [PATCH 1/7] dt-bindings: interrupt-controller: realtek,rtl-intc: Allow 2 interrupt cells
Date: Mon, 8 Jun 2026 20:39:43 +0200
Message-ID: <064801dcf776$2cbb8280$86328780$@gmx.de>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHqUs1KcdCpshtoVUC2zC+3ejsSbAKy5F5HtgSuk0A=
Content-Language: de
X-Provags-ID: V03:K1:K94lXi2zKZCN0ayzDlBaRmgyUusyc8zchz6avg25VAeCtnHjJVS
 QlkgaGmTQCFFoQcWriGvgPs4rx5l6aWrjPuNwZrnUB6IGJD331SsR7I4bEmOEWyWgud+pbI
 0RMswGdN5Hd+bY353p13tlOPtvk6XGSyb2WYHgaVj9eDe/UYwJdsimCa3Uy0tLSohnfFaDB
 Mnulln1ynTM6xknIyAPOA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wEs0jzWmk5Q=;rTvg4GO3AfJPKjvP/2ToRRr6VjC
 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

Hi,

> Von: sashiko-bot@kernel.org <sashiko-bot@kernel.org>=20
> Gesendet: Freitag, 5. Juni 2026 23:26
> An: Markus Stockhausen <markus.stockhausen@gmx.de>
> Cc: devicetree@vger.kernel.org; robh@kernel.org; conor+dt@kernel.org
> Betreff: Re: [PATCH 1/7] dt-bindings: interrupt-controller: =
realtek,rtl-intc: Allow 2 interrupt cells
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> - [Medium] The cell-count property `#interrupt-cells` uses an `enum` =
constraint instead of a `const` constraint, violating dt-bindings =
subsystem rules.
> --
>
> commit 11a7c1b034a74e6212dca3ea81cd1ec7e513c49c
> Author: Markus Stockhausen <markus.stockhausen@gmx.de>
>
> dt-bindings: interrupt-controller: realtek,rtl-intc: Allow 2 interrupt =
cells
>
> This commit updates the #interrupt-cells property to accept either 1 =
or 2
> cells to support explicit hardware interrupt routing to multiple =
parent CPU
> interrupt lines.
>
> > diff --git =
a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc=
.yaml =
b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc=
.yaml
> > --- =
a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc=
.yaml
> > +++ =
b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc=
.yaml
> > @@ -32,8 +32,9 @@ properties:
> > =20
> >    "#interrupt-cells":
> >      description:
> > -      SoC interrupt line index.
> > -    const: 1
> > +      First cell is the SoC interrupt line index. Optional second =
cell
> > +      specifies the parent interrupt index to route to.
> > +    enum: [1, 2]
>
> [Severity: Medium]
> Does this change violate the subsystem requirements for cell-count =
properties?

Is switching form const:1 to const: 2 the right way here?
Even if the driver changes handle the old 1 cell syntax=20
gracefully?

Markus

