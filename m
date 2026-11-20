Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795173857;
	b=CmsnM4hd8UD144gNJBZw2MN60dFcAm237mTxaN7Wwzjyj1uXS+1iizSymoAa57VELNw2
	 zHh8egw5Ba07D+qHddcNJmKmkqPEBLMaRMoSo5/M2uJFTlCIFEX12XLsEkzp7NFHcVeV8
	 BWBI5JLbQ5f8b2A3cSiBM4iY/I//dSQaX0xkibt3pi0TbzKdEiffEWqP9q8QoCufScNj0
	 xDI1OAbf5GP+DF3czBPzZ1VIOnhoMFheYJx4ykRNx/t8V8O9/YW1pLZDNUTV95Jfx7+sK
	 6FMnVMVDYhhTbaoUfsw4CWQTv+jvMrqxa/vAlVZe2Ts7jfz5HLVjhKcZyQA+arslydA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=a7JUc6FSH2k9zAtUwLBJoFh7SQyPXZY5+YDsTTwuAe8=;
	b=Jh5HImZzglP4fqIWzBNuuNJutIKaurV2FC9aQWATMudZ3aPwH9MhzFdkRikVc4XtZp4t
	 9FJV2FBGh/XcLQHjdKP+gWZcCONkT8GLb1N/+VdLWzT18Y0q0/LYmPO/+cDRzaZOzDskJ
	 u+jBmJD+vLaEgnAkxtDmuzb650/FvICglD0FE9Cwm0Ol3H2y4zsBy50zIA+AUS6lm7lt2
	 /wq1d8xuMrmM7eRR5c6DbvSzbDgZQgyGZ2o+nj/ntuEzFP3+fgwLnS84e5q9oWCATOeSx
	 S6s8ce0PMGW3XEqJqCTuSvarcs6ehTj5kchWqmXa1H86xWGLiOqAB///mvKeiC7EY3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=e5bRY6Lh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70347606A32A
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 11:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70347606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=e5bRY6Lh
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50abd5b4fcso111068966b.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 03:24:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795173856; cv=none;
        d=google.com; s=arc-20260327;
        b=WbWB6wsU2MicjcRDNF7f6eCLIMxKbE1ARpDQ+58B2kX+bkhAsxqYP1Tgshm0bpSM6I
         Wbvoq+B3qjxcKlPL0H498jvxvD+2T0B17RwmssKw2UytkDkttqS6Bv21WnWzEU/luWHK
         MrmnBzzapRIoOlKUv1ScF2u4kmLgepKR0mFJil5J/LAb7s9I9oLlABdODixds87bioFr
         ShmEqvDEnizcAD7lSWTaf4nPIM2VMUkP1OVdppNoOnOCTmfsSWnIMH599SD/EFKJn8+v
         kYnsA//ygjzWQRp3s+pkv+2Lvbomz59KsDBD8xox/3mX5BIxEBCBadvpN+Ut/pWpE8/l
         Q7zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a7JUc6FSH2k9zAtUwLBJoFh7SQyPXZY5+YDsTTwuAe8=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=SGYFGD519E88/KiZ4TN00le2lO5wov+zPRkXim9sEKweDzVzFdZt7V3m8SAm8kv1V3
         xLzRy2g+/tqk4/s/06uILqO3lkTwzuLFR2Qs72J6FrFq5N/hzc6c+oEJWfpKFVsTahf3
         otZyU3jWB5OyL0QZlzeIpPY1Y9wkMvdP2jyZyH4ALa11vBqFNpQBj3QWs1/WVovm/ync
         ZeFMFjd0SXbhW1cQ+fos6URSV9563AASyLU/MKuNXNzRNl8ZBh1ymbunBsv4rIjXfpuT
         ZDiYkpOnz6N2BHTlQpSK+qoRN7nXgN3JMna3Hw+bmtHSmWz0sYZJje3yJaMPA5DihwDI
         7fFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795173856; x=1795778656; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a7JUc6FSH2k9zAtUwLBJoFh7SQyPXZY5+YDsTTwuAe8=;
        b=e5bRY6Lh4ThWKGMNyf0LuH3Z2w1zr8mE1xSWFRsZDOK2JTxcObMGBdVC/p2Fc06ETY
         Mp145xzg6qhm2CSNwmhX9QX3Typ/J56gDy4sj80FaCDPwU2v+3PHQ5mqkng+xT5eO/k+
         yvLQSfKIpJlzMoSSYP/unuHHiFTBSaWpHenaApL63H9MX5vImYqV3LNBgeCaW5R7vGQv
         pnCTMquFbnLQUXK4p1tjfOhZ9IA+z+tz74//iqcsBIMBkJ34MWHKrN/lQQ4dLDwH6rp9
         lO9WeCrMTOlhrsPecCoujQ6LXV4gJs/JUoPxoxLWiXWuBJU767B7JQRlxGYvN/42VbGi
         s7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173856; x=1795778656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a7JUc6FSH2k9zAtUwLBJoFh7SQyPXZY5+YDsTTwuAe8=;
        b=J2+uPV6QYBijoeoUSGfpDFMW3hgot2nCHl3BFgbR7gdK7uyWQyTV/Q8nzd7y43g+g8
         JtvCOEXu07Zvw3J58me8nQSE9+LX8uuwp1bNKH7OHoHEuuGEWaSichboIxm54MSPZ+xZ
         ysjJo+TW2tFRMjV1AhNTS5c01MuYk0FKT38RLZZJ8DfSFvB/pBXwvnoheZyvLnplq0Wr
         4ug/6WgTsSCFRUSYOVoEc2FH5eGM6gN03bn+9YiYwwjXuQZkkIm+VQgOIM/BywYoG49R
         xy3G5oHUNE2dvB2Ix2Tmki5fcI7qVrx12IPNvuGow7Mj+j9Ufeipw1I1zgeHT88ongR2
         ICLw==
X-Gm-Message-State: APuU4Z/ldiMKC8+rNcZZDSzOSHU+Q4dlcKLHbSAxTAKDqT7C88Iax+h2
	vmkM8Op8PDVlKeYBhT4kT8RQ/Ln/4F7PdBBTdUSWrFLp3IHYMGFY0faLVQ96EdnB0ifzvxhkxTJ
	2bkBUIFvzhbcmpD7BOouawQTkZB482HWGj22LlPYBefRHlJoHA2c683kkwQ==
X-Gm-Gg: AZFdTZcYhGY1ldg3Pjfe/huzKYwbIkIehpQbKnEJ8hW3yyE1lZVif2a4zPLhP36JRBf
	5xEk8CDKOtcucjn4/yWGUfHruxbzdTeb3k0cpaJ7ywMOIeo7aJV40Pjs7ZoiR+fEHSXtO5DebKa
	fRonqN90McMzPYkSVdLv15TDSg20Br71M9qbgr983chtnkcMIIh+xuZJtgYbs3llrXznMAgKjZs
	eiVGqjxqQ6g+T6P2y70t1vkqx7RqJff4GiiucIHXZjIxyqoTyGNNzm8WOpMMsLcdSPi9qCPVyeN
	6sK5N0+ArgAHXHq+HGtnAxcL7XwEExscV6PqDf677Ux05TZqKaTvgbx+KcSS1aG59JgxgqW18Uy
	IrqNEGogR8wxPy8Jih4hL2eZEAK9jXv/eFdmE5ij4CcOd9BaDFhFc/vkIg6ulDDUeDYSUnA==
X-Received: by 2002:a17:906:c104:b0:c35:3880:773b with SMTP id
 a640c23a62f3a-c513aadb667mr274279466b.45.1795173855766; Fri, 20 Nov 2026
 03:24:15 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
 <20261120-rk3576-phys-v1-2-6382cd14e3dc@flipper.net> <sashiko-outbox-224974@kernel.org>
In-Reply-To: <sashiko-outbox-224974@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 15:24:04 +0400
X-Gm-Features: AclHuK8rLoDMmJMGUWxK18rLN7mF-KAPwHPjLrX7VCGqTp-a6L8QOHGvGVNdrK8
Message-ID: <CAKTNdwGF7tFwiq4FK7EZ+mXXq353fRCDMhXKNzGjGDLhaZ34XA@mail.gmail.com>
Subject: Re: [PATCH 2/7] arm64: dts: rockchip: Describe Sige5 Ethernet PHYs by
 their ID
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:56=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] arm64: dts: rockchip: Fixes tag cites board addition instead of
>   63136c6fecf4
> --
>
> commit 5dc14b4c5e3f94d0bf427bf2ff5dad981d4f435e
> Author: Alexey Charkov <alchark@flipper.net>
>
> > arm64: dts: rockchip: Describe Sige5 Ethernet PHYs by their ID
> >
> > Both Sige5 GMACs connect to an RTL8211F PHY (ID 0x001cc916) with its
> > reset line in the PHY node. With only the generic C22 compatible, an OS
> > has to read the PHY ID registers before it can bind a driver, and only
> > that driver releases the reset line. Unless an earlier boot stage has
> > already released it, the PHY stays in reset, never answers on MDIO, and
> > neither Ethernet port comes up. Booting straight from U-Boot SPL in
> > Falcon mode hits exactly that.
> >
> > Name the PHY by its ID, so it binds without the ID read and comes out o=
f
> > reset as it does. Name the node ethernet-phy@1 as well, as the Realtek
> > PHY binding the ID compatible selects requires.
> >
> > Fixes: 40f742b07ab2 ("arm64: dts: rockchip: Add rk3576-armsom-sige5 boa=
rd")
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
>
> [Severity: Low]
> In 40f742b07ab2 ("arm64: dts: rockchip: Add rk3576-armsom-sige5 board"),
> the PHY reset lines were described via snps,reset-gpio on the gmac0 and
> gmac1 nodes, which stmmac_mdio_reset() deasserts before probing the MDIO
> bus for PHY IDs.  Commit 63136c6fecf4 ("arm64: dts: rockchip: Use standar=
d
> PHY reset properties for RK3576 ArmSoM Sige5") moved those reset lines in=
to
> reset-gpios on rgmii_phy0 and rgmii_phy1 while keeping the generic C22
> compatible.
>
> Should the Fixes tag instead be:
>
>   Fixes: 63136c6fecf4 ("arm64: dts: rockchip: Use standard PHY reset prop=
erties for RK3576 ArmSoM Sige5")

Yes and no. The fix is about the compatible, not about the reset
lines, and the prior behavior of the GMAC node carrying reset lines of
a completely different device was a separate issue altogether. And not
that it matters in practical terms: both commits are post-6.12 and
pre-6.18, so if it gets backported the set of affected stable trees
doesn't change.

Best regards,
Alexey
