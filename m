Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786FD425864
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 20:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146175; cv=pass; b=MOViVch6LAXF8p54gJ2Tvo3Ab1e3JT/PjHNdph0v+spB8FvdjvXGJN1hf1Daj7DIywUApE2ult5+xAXzRcKhSl5Rq+FkzyqEVWs69j65RZvX05VMj/v/TE3dlMbWbU0mGNwDFon05ygw1aIUiQquntzKv7zarxFo/r/LOgzQXpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146175; c=relaxed/simple;
	bh=6bKMUFoOov3nHfzSXonIoSh+sTcY9ShaYsuR754444E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4eysZUvI4sao5KNhmVipn4LUvM27QXrdwXL6Jg4graT7Ost6K0RHHp3Yn2sYZA6VluYWf2pNcuwrH71zFyOHr0kVu8QAa52RbFUcho+YX5RDDuPGVLiMiuTmLilSlwSAnIJWLv2pnVtEiIJh3mGiqxq7ZBfry6puIe3LISJf8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evlPtA6g; arc=pass smtp.client-ip=74.125.228.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evlPtA6g"
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c15ec8d6663so182431066b.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 13:09:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784146173; cv=none;
        d=google.com; s=arc-20260327;
        b=sTZVZtExrbi+MTMGYZ9nNN0YyE1J3lD1xm0rXSnpVlj//6UzE1gwgCP5KHaMVolQat
         ht+/osTiMxH2Uel059HqJTLB1VQPIvUIDNIPa6W5uMkNfF2R/CdvABqJ54z86Aw965Go
         bN75t09KBunhUg9OMKa2F/XMhB9djxL0SRJeXEIi4Daf9sTz/6X49OoyEhdvU+zRnubJ
         THJaeCjrWx6vRp1T5FqjYIFrbNp22+XboRSjlXuy4Hf3ROWSejWsJQBCeY6dHlr86PFO
         zhsYaBPpogDRu1DernkTJ9fRdGRCwVnXtuestjav52L4T0OL5xovbK1Ao+iTdnONvYE3
         Gl3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zukIYuuCALMdyDk2rEuWfswlsQCB9YpIGZVHtbRJrWk=;
        fh=PqRaIwEVPFbUO22ZPgv2p01verSWJsxBI9W+d19luX8=;
        b=JVChwQ1nvw1JAcABSNhIw/S59eb63EtDDOrHjiSaJpTbPQdBSOcDzzAUjyF3t9dwER
         GU58qSJNgUMdBa3NhozNPAB7C6kPNtZa9Vn/BeoREiVFagpOfyyk8CKYEO2QQnP9A2Pq
         FyIZKJG6UPp6nv3gFTfpnTQrI87BlTriKT2JXRnUSxsH53XRY8LVTcJ1mUHRZsBehvHK
         djzLRYqmZSudIjxO/+g6B28HtqGaCCKRMRgkADe77yBifxjzMR/ELZ0S9v+UCh3UCxnJ
         H/5cE7mF3bETawgw6QJXVtkc6wd43azzNPL+3Sdhuv+EHrxSnruCuH2M+xuTPCX2Grsw
         fQ8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784146173; x=1784750973; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zukIYuuCALMdyDk2rEuWfswlsQCB9YpIGZVHtbRJrWk=;
        b=evlPtA6gTp8PUUC7eY3YR6mJ97tYxORyMdKZw4l2nkxY2tlBddfWulDYd9nXiUQIix
         ezNCWCGQe7k5eOMoBAQX80zZWescamy4UxIKXy/JxtFoKvKgZeYLh+LJjs8hRratbPcJ
         /0IMJlKSFSsvjNx1W76/53lVvv/5AwBA4rGkFz8O7n2OfW84iD8Ogus+IGD658rka+0S
         xm2m2yG/BFTGQKrnMEW8BzTaqQw9H6BDB/LO9tM3URoWO3kl9JxO13S0HU5zy52BxDjc
         mEUM29VZQBMCcAOUKyAjn096aBGobuDhlpOFxEGJgPUgdTxCpQZt5YMZUCY8QHa3GZ2p
         hh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784146173; x=1784750973;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zukIYuuCALMdyDk2rEuWfswlsQCB9YpIGZVHtbRJrWk=;
        b=PlEqTc3S66ga4OmhwLMGsjoKz+ZtCzW5BO38WWoX0eiFTIP/MCVJXCnGO3iBqxB7Kn
         nHUD/KdRstYjGwqja0hJjgSHKqruWhP3weDDW6u7FrlPDiwXZSoWA7K/ldDWfWEt/aC8
         3a3l2/HRH9ss4QR7rx4bnxrvf07m3mUaQWRsaNIgaP3D1sUq13qIUd5FQiBhFkMprBM8
         7MZYimiY6o/MeQwX9F/S0rFPEpmB7yecQN7L3wQGz6LvwjAq6S8RAvab+3vFnIiZVLsy
         uKXQoNmhHXj+mXm4Hv2pvIYx3mO52254GZcl3No6K4Y9uWsFO9UBaU9uGCQ/okccJzq6
         3JxA==
X-Gm-Message-State: AOJu0Yyrk/PrqyReCQm0CXDyEkBV7BZzjLhDwRpV3abcKBHJbLoudSq4
	netnYTcueora46Uo6JFxaC0P6u5wUEYao9OZHseKdB8RbR3olEyUK9kBCHWkzMTijEkduTe6nyz
	gzQ2sWwgeE0zOOPCe9FNIVEnPLjSSrQjOxg34jXKy28E9dXE=
X-Gm-Gg: AfdE7clmAECYEmmm+ff3alkBvTtumkGRRz8Ibt4Q+1p8THHWHbMfwfIc3J56ywRDUuH
	AhRWpPl82waSuNnZRaixGDLhc6P0RzgRQ6eNKEsipyEIhNmV2Xj4wTRNEy3Zrb6ZnSeL+mMWBXb
	ACiWZtPmjr3+cgqrETT5IDl9ZMWphAiD6dKb0RthHOlVYCg6v/JuG2i6KreScllNLHqKRu74xJV
	2tgD4l0jUsYSqOBsQxDhOlMpFDQyyfMNxZME9y0gIMcc1qaVMvAaTfhHh0/66ZarM5beqfI1UA=
X-Received: by 2002:a17:907:a785:b0:c12:9285:8f0f with SMTP id
 a640c23a62f3a-c161e93cebamr1058312866b.15.1784146172643; Wed, 15 Jul 2026
 13:09:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-6-coiaprant@gmail.com>
 <20260715191452.4A4821F00A3F@smtp.kernel.org>
In-Reply-To: <20260715191452.4A4821F00A3F@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 16 Jul 2026 04:09:21 +0800
X-Gm-Features: AUfX_mwA1bFOnihfrZJfgB4Or9T0LdiVICJLS_d3L7PnHRbxyoxVmIpr7vZMqGg
Message-ID: <CALj3r0gZcEWONH_TkLGagyG7JqR9CkqMT5ucxsEYD3kw4xErBQ@mail.gmail.com>
Subject: Re: [RFC PATCH 05/10] arm64: dts: rockchip: rk3568: add XPCS and
 fixed-clock nodes
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, 
	linux-phy@lists.infradead.org, vkoul@kernel.org, olteanv@gmail.com, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

> [Severity: Low]
> The commit message states these clocks are used as assigned-clock-parents
> for the respective GMAC nodes, but the patch doesn't appear to add the
> assigned-clock-parents properties to the gmac0 or gmac1 nodes. Are these
> assignments missing?

The `assigned-clock-parents` assignments are not added in the SoC-level
`rk3568.dtsi` because doing so would break existing boards that use
RGMII mode. The clock parent for GMAC0/1 is currently hardcoded to the
RGMII clock path in the mainline device tree.

Instead, the `assigned-clock-parents` are applied at the board level.
This is already done in Patch 9 of this series for the Photonicat board:

    &gmac0 {
        assigned-clocks =3D <&cru SCLK_GMAC0_RX_TX>;
        assigned-clock-parents =3D <&xpcs_gmac0_clk>;
        ...
    };

So the assignments exist, but in the board DTS rather than the SoC DTSI.

> [Severity: Low]
> Should this internal SoC clock be modeled as a clock provider from the
> generating XPCS IP node using #clock-cells, rather than using a dummy
> fixed-clock?

The XPCS block does not have a clock controller interface. It simply
outputs a fixed 125MHz clock for the GMAC when operating in SGMII mode.
There is no register interface to control or configure this clock =E2=80=94=
 it
is a fixed-rate output from the PCS hardware.

Using `fixed-clock` is therefore the correct and accurate representation
of the hardware. The XPCS is not a clock controller, so it should not
be modeled as one.

> Additionally, the commit message states "All nodes are left disabled by
> default", but this node is missing the status =3D "disabled" property. Wi=
ll
> this leave the clock unconditionally enabled?
> [Severity: Low]
>
> Similarly, does this node also need a status =3D "disabled" property to a=
lign
> with the behavior described in the commit message?

The fixed-clock nodes are always present and do not have a `status`
property. This is intentional: they are part of the SoC's fixed clock
infrastructure, similar to other fixed-clock nodes in the SoC DTSI.
They are not "devices" that need to be enabled/disabled, but rather
static clock providers.

The "all nodes are left disabled by default" statement in the commit
message refers to the XPCS node and its pcs-mii sub-nodes, not the
fixed-clock nodes. I will revise the commit message to clarify this.

Thanks,
Coia
