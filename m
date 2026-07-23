Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FCA471253
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 14:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784815801; cv=none; b=NrO7+VPpfGzfgOayT7zGJNgHvusTp77fwgiO67OR1oiFXd/GoXipwgH3LfwIDPQFvIT8HI2F20Wo9jeVrbgGvrntsNZhzp6ANNY82+lULuOvgkiYrVOLOLgP5Z6hauYzhCAeJ8hfGakusLbI5LF+mypKiRMEKfJuXwvBcDwx5mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784815801; c=relaxed/simple;
	bh=h1tfkYJePklFPO2yWd0gXmA3Th77rnyf/bWRyjwytTo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UuSyWuRaSJ0dnTqBh0vbOP+S6Ju6u7k8H0dG6eonzATwDmoQ/QxbFuN18xt89PPnqktlj8lDy3tqzoPgI/fmUk3DfIvnNoC82CvsIQssLi3YeVElCUanWRqBslaiXuGiZ5DR5Ba25bvf3WnBhTSPOiIFbrRy7H8K6uZeRBNLtc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.114])
	by APP-03 (Coremail) with SMTP id rQCowABXYkCsIGJqsOrtAA--.4045S2;
	Thu, 23 Jul 2026 22:09:49 +0800 (CST)
Message-ID: <8c2d675115b25107bf463cbbb6a377f80c46e592.camel@iscas.ac.cn>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: add binding for T-Head TH1520
 USB PHY
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, robh@kernel.org, olteanv@gmail.com, 
	neil.armstrong@linaro.org
Date: Thu, 23 Jul 2026 22:09:48 +0800
In-Reply-To: <20260723084759.3BBF81F000E9@smtp.kernel.org>
References: <20260723084316.3573714-1-zhengxingda@iscas.ac.cn>
	 <20260723084316.3573714-2-zhengxingda@iscas.ac.cn>
	 <20260723084759.3BBF81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-CM-TRANSID:rQCowABXYkCsIGJqsOrtAA--.4045S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFyDAry5Xr43JFyDKryxAFb_yoW8tw4kpa
	93CFy7tF1vqF9avanrJw18CF12vF4DuF15Gr1rXr1kXws8Wa4Sq3sIkr98uF48Xr4kWFWa
	yFZru3Z3Xr1ku3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k2
	0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
	8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
	IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIx
	AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bnL0OUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-07-23=E5=9B=9B=E7=9A=84 08:47 +0000=EF=BC=8Csashiko-bot@kern=
el.org=E5=86=99=E9=81=93=EF=BC=9A
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> - [Medium] The 'reg' property is omitted from the 'required' list for
> a memory-mapped PHY.
> - [Medium] The 'avdd33-usb3-supply' is omitted from the 'required'
> list based on software limitations rather than hardware description.

BTW the power rail is expected to be always on at least according to
the schematics of multiple boards, as mentioned in the next patch.

Thanks,
Icenowy

> --
>=20
> --- Patch [1]: [PATCH v2 1/2] dt-bindings: phy: add binding for T-
> Head TH1520 USB PHY ---
> commit 91b4840ee15364137facb1905580d4df2ba57663
> Author: Icenowy Zheng <zhengxingda@iscas.ac.cn>
>=20
> dt-bindings: phy: add binding for T-Head TH1520 USB PHY
>=20
> This commit adds a device tree binding for the T-Head TH1520 USB PHY,
> which is a Synopsys USB 3.0 FemtoPHY with custom glue logic.
>=20
> > Changes in v2:
> > - Lifted avdd33-usb3-supply from required properties list. Because
> > of
> > =C2=A0 this the R-b from Conor isn't added yet for reconfirmation. (The
> > =C2=A0 related regulator isn't yet controllable because no driver is
> > =C2=A0 available.)
>=20
> [Severity: Medium]
> Since device tree bindings must describe hardware independently of
> software
> state, shouldn't this physical supply be required if the hardware
> mandates it?
>=20
> Software limitations are typically handled in the board DTS (e.g.,
> using a
> fixed-regulator), rather than compromising the generic hardware
> schema.
>=20
> > diff --git a/Documentation/devicetree/bindings/phy/thead,th1520-
> > usb-phy.yaml b/Documentation/devicetree/bindings/phy/thead,th1520-
> > usb-phy.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/thead,th1520-usb-
> > phy.yaml
> [ ... ]
> > +required:
> > +=C2=A0 - compatible
> > +=C2=A0 - "#phy-cells"
> > +=C2=A0 - clocks
> > +=C2=A0 - clock-names
> > +=C2=A0 - resets
> > +=C2=A0 - reset-names
>=20
> [Severity: Medium]
> Since this is a memory-mapped PHY, shouldn't the reg property be
> included in
> the required list?
>=20
> Without it, device tree nodes missing the reg property will silently
> pass
> schema validation, leading to incomplete hardware descriptions that
> fail at
> runtime.

