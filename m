Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1392514743
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904090; cv=pass; b=CuDqv9RZB1ItVcEpHm0i5D+GU5EEN5DrteW0YHfF3r45DVTby9CWbNEj/Vxbpo0IiHBmNchCGD/v2hE1J0Jeg461ji/x1h6PceLCwE1VLMIeJ/2PWjcBj8lLVLliIz8tLNJFhBj9MQBFljLkrqsEyi8lkSlzd+RwQ8OzKdYFug8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904090; c=relaxed/simple;
	bh=kSeEty/pyx+v4Qu7BrqL5A6bwA+hTSmxB+Kegwde04I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8Kwu5WslM66t8oH0uRvnsTnbLb4st94/pqsE8v+2ii3MCZyivyfy/bQBo6CCYgm3t1F4GMFGE/uxyPBuziOwHhomPhJ0pzTlVA3KgmgAFviJGKECz4ADNXZiqoEztRlskkqy3b6dDKu6jdOTQS0+zLpEWIoehiO/cv9Zo1cI9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9qnzBoO; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9qnzBoO"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e5d0ee1951so19506305ad.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 08:08:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791904087; cv=none;
        d=google.com; s=arc-20260327;
        b=DyEJNvVJZQx7+iowf5/EM4M9yXaMXl2CUOWSLmyKKA92o5Z85iGG/xEHrm5HZWagcE
         2i3P16IdklEP2XsthmAnMyZv4tragdMGjbjXrNHzmBXDtnqtQOhTUQimSGvmuwtIzPYI
         1rVt9uSlp1TeKmqH7lVx920zq7FEAgWSv5ZLHSJNt8TubGIt1WNYFkEZEpRzIyxXgoir
         i6d9qHF4S3YTAqlHm+kgHsgbO640QHcSfKjdXkX1m1bikaL/HdYjh2VAMotpPAJt9hsf
         BU43pIuB9+Jjy745uQI453g8VtYTNXubSpRLyZyJY5/xLlwz6RXovyt1s+MlAqVnOwr8
         3ytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LQ5BAPQzf5De6H7G8HN1TYce8oTd+xAhm08KbGTjuS4=;
        fh=2hfhS/TDdw+vB47+SyuDzTOw4Y7UogjPq+LMZLKB1/M=;
        b=kieKmmam2o436fEi+RpSXrxu3dQUW7B3H3Z5/PXPwhdHENAQSEXuY9846oBGySSeF+
         6hZt9CigKGxtGX5erUifdbrBq5yAEBFaUu9B6T4skO/QbpMenCVYcf6SmClSQSV/lwGo
         FvrK7NjU7z/Ug+48MfdO8vHYFi2ZohioIW3SGpFI/VBC02eaNBbqfGqKPgarHquamSEi
         S5FL8Xdrmojn4eD+o5h98nIHR6Rn0aMIpWZ05Bpi0zCBERDyGcm4ErEOWO5qjiJgdxAh
         KmtLAmpsww06/qsBA8n8B1BpMdabwGaNeOOR1FF2xsSpnfH4+eDlEMwZXUFOxwNl5gED
         YOJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904087; x=1792508887; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LQ5BAPQzf5De6H7G8HN1TYce8oTd+xAhm08KbGTjuS4=;
        b=L9qnzBoOufpzJpKxDacrDDZd5wUKpnsz8VLGc8uOa1jshSY2pFo6tks6p13HB7GMhj
         7Mlrx6qcvEl0I9t4s3YLF3UzhmXNfMboD2qmWDNhcuwXlb6ww5+VHgIuanU24ThGNpMG
         iiNmhAZ4eaf3RDnWqpgqNuTtpSeOrPw1CNZF5RfDeSnlrpyklYlbtgHTRVq9ds8IaZ+w
         TGMaT0PdkhzMn2Q7lFlZtmvzls/53lSP+0SDWYlomFevPb44ONc/yJ0bQN5UiWGqqjlg
         AceeHLh01cu/QXaHEv522VWR2ySB+UNEf2TVoPl4Dwc6a4OygOqeu+7EJd2KiQDLWw6M
         qPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904087; x=1792508887;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQ5BAPQzf5De6H7G8HN1TYce8oTd+xAhm08KbGTjuS4=;
        b=Bpo607/qt3pUDDT+TyQttLKZL84rCJnRpOz3dWm8SovmmJUGXEiKDZtQe1JMd8YVG/
         fzfWp864qFtpjHTlC2iTO1x3lBgYLfBykWAtXozi03ot1umfQT0r3EKFo2fbda+ZFUKp
         iZbwPe4cQQ3qiqKG9rX1R7lJxrVZsAJaIdoALceCs5BSM6nswXzwhys2QHST/FvEPpl+
         yB3qolkFQ5sWuBWd8fUF8vUqADQTdSOJMcugsdgL3TI91dn6cXsjUZPBsm8PmuOT9das
         HcuiPPzaqP3x6C4JfGOmg0H0fQYzfanigEbJHw30dSxHewm0Vg3TQERCi0MomHsI5V2C
         JXCQ==
X-Gm-Message-State: AFq9FYIxhYcmBmYJ3IJIiqb5oGXlx0r10KJ463qaLgOW6MKOoG9GFwMj
	sMoYDQFF4go2Fl0y0rWvSEvXeXZrUY6w5kXyE00lAyR0joiQqYFaxWlfsktMQ5Y/hK6wFCzbAL4
	9zHgy/R68KDMpL8RBHXgIIjdLBDHZ1LdntSsVBFExEw==
X-Gm-Gg: AYBFou0hyU8Ec26ulezLM20hik1xn3jrzJx3GCFNzQsIS940n7WNrj6fn7J/nveNEDq
	o9MKliroud52cOyuJ6ItQLfTtJCz3A5c+KzfXrJBuegH2SmaHbyKboN5MaEsYjxilYILNtDSLnV
	FARxmCL5am9biHMPAje24h6FpN+slPzgbq1OIIcq1bGYLw9GQ0rBvbEB3azgwle89y2HHcmjiB7
	em9u44anfTLwoYLTDaJSWrRSxQWhn+61GkFdVzUi1ZFwqX979hoy2mosJ4lBjD14yMXQWqI8kez
	kzY6AC/+d13VkrLmuc6sLqjTgT2YuY1LHMZ2wpLssdi+H8zbogUQF0t3Nc/dpnwOqSJnMkg=
X-Received: by 2002:a17:902:fc4e:b0:2dd:c170:2d4d with SMTP id
 d9443c01a7336-2e842abcb40mr130264665ad.24.1791904086913; Tue, 13 Oct 2026
 08:08:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012100816.331033-1-pmazzini@gmail.com> <20261012100816.331033-3-pmazzini@gmail.com>
 <sashiko-outbox-167950@kernel.org>
In-Reply-To: <sashiko-outbox-167950@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Tue, 13 Oct 2026 16:07:39 +0100
X-Gm-Features: AclHuK_pl3pWqTJLvh0wYDQbXNbwPmw0G3N4wD6Ym2FvqFNGBQBI95gOlewMvjs
Message-ID: <CAAxh=jvSRyW3XwnyV2RVHH9FZvq9A7A7ruXNSpAgXzdcCNjGeA@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] clk: sunxi-ng: add Allwinner B288 CCU driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The B288 has pll-video0 and pll-video1 at TCON0 mux values 0 and 1, so
the plain mapping is right.

BSP: https://github.com/pocketbook/kernel-b288/blob/e30bb2ed149410ef2d3245e=
a01192833d44c4e46/drivers/clk/sunxi/clk-sun8iw10.c#L468
Wiki: https://linux-sunxi.org/B288/Clocks

On Mon, Oct 12, 2026 at 11:21=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] clk: sunxi-ng: missing parent index table for tcon0_clk
> --
>
> commit 3f9c552550550b015864167770907fa314ac3239
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> clk: sunxi-ng: add Allwinner B288 CCU driver
>
> This commit introduces the Allwinner B288 CCU driver, covering the PLLs,
> the CPU/AHB/APB tree, module clocks, bus gates, and resets. The driver
> is noted to be closely related to the A64 CCU.
>
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-b288.c b/drivers/clk/sunxi-=
ng/ccu-sun8i-b288.c
> > new file mode 100644
> > index 0000000000000..c53afd6f9af98
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu-sun8i-b288.c
>
> [ ... ]
>
> > +/* DE_CFG @ 0x104, EE_CFG @ 0x108, EDMA_CFG @ 0x10c -- M[3:0] mux[26:2=
4] gate 31 */
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(de_clk, "de", de_parents, 0x104,
> > +                                   0, 4, 24, 3, BIT(31), CLK_SET_RATE_=
PARENT);
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ee_clk, "ee", de_parents, 0x108,
> > +                                   0, 4, 24, 3, BIT(31), CLK_SET_RATE_=
PARENT);
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(edma_clk, "edma", de_parents, 0x=
10c,
> > +                                   0, 4, 24, 3, BIT(31), CLK_SET_RATE_=
PARENT);
> > +
> > +/* TCON_CFG @ 0x118 -- mux[26:24] gate 31, no divider */
> > +static SUNXI_CCU_MUX_DATA_WITH_GATE(tcon0_clk, "tcon0", tcon0_parents,=
 0x118,
> > +                                 24, 3,              /* mux */
> > +                                 BIT(31),            /* gate */
> > +                                 CLK_SET_RATE_PARENT);
>
> [Severity: Medium]
> Does the B288 hardware actually use a 1:1 index mapping (0 and 1) for thi=
s
> TCON mux?
>
> The closely related A64 SoC uses a {0, 2} index mapping for its TCON PLLs=
.
> Because SUNXI_CCU_MUX_DATA_WITH_GATE defaults to a 1:1 mapping, if a disp=
lay
> driver requests to use pll_video1 for the TCON, the CCU driver will write
> index 1 to the mux register. If the hardware maps the second parent to in=
dex
> 2 instead of 1, this will result in incorrect clock parent selection and =
could
> break video output.
>
> If a custom mapping is needed, it might be slightly tricky to define sinc=
e the
> ccu_mux.h framework currently lacks a SUNXI_CCU_MUX_DATA_TABLE_WITH_GATE
> macro to combine a table with clk_parent_data.
>
> > +
> > +/* MBUS_CFG @ 0x15c -- M[2:0] mux[25:24] gate 31 */
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(mbus_clk, "mbus", mbus_parents, =
0x15c,
> > +                                   0, 3, 24, 2, BIT(31), CLK_IS_CRITIC=
AL);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012100816.33=
1033-1-pmazzini@gmail.com?part=3D2
