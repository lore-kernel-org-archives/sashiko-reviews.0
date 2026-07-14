Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2F636F428
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 15:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784043197; cv=pass; b=poabF5ggefkbnypqJ+NQevnp3bgg8mtMF6sr3ALt+sCu01xK2bbXpAJ4wzru4U4wCwTtQ/jPsVjWKb+WwSaNwOqBrSFCXCGlNvyyehRQyzj4YvROmgZgHQ3PnQxayjGr2MlMWjeuJ94rWJhFbEMxa9XK3FgUsKTkO8xjYY1jq3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784043197; c=relaxed/simple;
	bh=DUDxctZujNARWIATLcjZzvBa5DYpwPhbf7vLFByLhYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dC8/kv6P915Qdd5oi/A3I8Vq5EsZZcuqHBOzBugOozIpZcX22Q9OLTvnsz/GjlLv/U2hBri2QUw54Y1cC4gzNoTSGhm1SIBOxAoI2B34PZu1pXajm/guy5q4cfYpQQqZB3B3zgksR+m5iUjcJ+5Yh+En2gxAKNZkHxZa3vVBGAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=saX+c+Wu; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="saX+c+Wu"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba320so2987282a12.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 08:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784043194; cv=none;
        d=google.com; s=arc-20260327;
        b=mPlU3Ly4FIj4mB2vCIKSuqvgiVqmpUgyGL+ukraFnKidh33IDx4DLP+GAhTc3zRixi
         4vuNAORPArYkaEXJyYQr8FXHI+9vljXB8fe05AVTcv0MDmEwobwPL6cVsWEDfmuYKrot
         NhC7PndrJ8RSj/rNsEW0C2WhMhAo5EuFtn5oAuI6zjSFWyGnYc4IJfEv06Z994TDXhqu
         ZYndE4/SBDSptK5UCd8pLEH6mRwFfy43hwk4uaRmOQyfgkxFpc7D83WynpC1u/JFs2y6
         she90ykkceznxOncaRWUH4u6LQ9mDt5Xi4DENtcUZrUB3MBNggWgNsODc8hISZdqRlMQ
         Igww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DUDxctZujNARWIATLcjZzvBa5DYpwPhbf7vLFByLhYM=;
        fh=xPpY1eJncIbZYzB1EwAwSnJKmF4AWv783JvkNJMI/QQ=;
        b=B5MpIjJZaBR5UXGUxw/v9BSj+IEkw+rrF5EeOCTvQ5E/Hb8p+ARegwRYauqmKXbNau
         g61g09+kXWY6iDtKrszMSGPzeTaYd/uYZpXRm6G3oRB26LY2EkMYO9MDCS+F3kz7rB6T
         +bDfNX5rcTO8PbdiMEaYXp35iXVn+MKEAYzWAYqWnnHIHa1M4K2J7vKRqtsz0aN7dRXr
         4c0ZAM2sG5E1UzAYUSQS2QLtpMENE0ICfUgVtXBk1eyBxT1PmKWC7yzBbBN7Cj+YTPV8
         fS1Vlr8s8wyva/xqG4JCUWl81svokmBCt3l/Mh+jEy3r/1pmFmrOxj+LSWMJNmAFMQBC
         Lq6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784043194; x=1784647994; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DUDxctZujNARWIATLcjZzvBa5DYpwPhbf7vLFByLhYM=;
        b=saX+c+WuHXhKeEtvjSvR4c6w0iKXl/7IfMDRq3QJoYQeRnOkkwcmJU37++kiriPUkR
         sN0DePF+He7VniCJcn6L78AC0yge1AaDI1eEYCmKLXGsFBSUO/Bbd0uCeish+Jt7FkPD
         7p0ircAwIH2PLIK3W8setDjitzE9P3XSX4nkKDDEZisIo1z8QdA07ViiUF9yYeO8zmiV
         SXsBN7UmO7U7GLdpPrMKVq57zFB2Rl6/9Ay6xMbNAvAXprDkNAR5x4RYxjql6Z9e0uHR
         D6hvPIzuVuGgNsV/8vYOkBCoQhazAGbVtwEtGGptP8ad68yvmbsI6Ty7Fc5j0Elmc44c
         yf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784043194; x=1784647994;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUDxctZujNARWIATLcjZzvBa5DYpwPhbf7vLFByLhYM=;
        b=kcxdyW3QrtcRyW2BAxgHB0brjMM376JAx0haqCHYWPMHAWg+TlUgU/GnOu3nvHDGkW
         YcMbQKYBIhNjlovnDJMNyUeR9vX1sIuhqb/6gUfA0HUEltrW5NP8wjoWpUOWVYqNXe1q
         9Tm8/zaeKGJMWXWwfIC8FBOO2+hAqYoDE7QhdtnlaXfAi18zm7Qu4GtzrIcXMq+F15rj
         MPcJ2YCyjNORCqItgzO5e/oAgGCNumpJ/j35DkIr3TbTsCBkHu0kSQAubYrISiQPMz6b
         Sm6Ii53UKIoYaPKzLENf+JpLcn5CgP1UPiB9FQ1Lg98xE7J5QXimP45V4WW+OvcFeJ48
         oMag==
X-Gm-Message-State: AOJu0YxCOUSXFTyxBCNs0ue0vUniDzG1XbJfvheu92QEPzXvb4XAmxEw
	am0qd7gtWNfX3Qe27t61OojVWvZBcmQ3V0qVyflvt/bJmOR/9j14A87wKqzEEvprqLa/2BL0NIz
	KHM2ZCH+fauPUipQyr+kKe2gtgxbsMsADZsaY
X-Gm-Gg: AfdE7cljgxCgU/0rfJZxTyFiclMNnDNI5/1I7Mza9veYZ91OxdwVLlwu1mpnLgZBmRQ
	EX2YNH8ssN6odhEjS6FzLcnxmbwIpHhGMEKQDsZg1Z7DvNxcJoQmPHRbasXyDkFu8TWB8+v86PE
	1X6N/7n4fxQTVz17Q8bJ7xLABfVHoaA34bzYDKiiRvNTZK85agFzkpLDsdQoKIWBdYmn8bMSc5E
	Uc1oCVHCdTGVytBsfNTaIiW9vmMpvjDS9gUwOJMKrtXCTxyBXJc9Nl4dEvZhhBk7JKMOFItEQ==
X-Received: by 2002:a17:907:7211:b0:c16:242a:4733 with SMTP id
 a640c23a62f3a-c16242a5993mr650163866b.18.1784043194326; Tue, 14 Jul 2026
 08:33:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713131223.279555-1-a.shimko.dev@gmail.com>
 <20260713131223.279555-3-a.shimko.dev@gmail.com> <20260714131729.48CD81F00A3A@smtp.kernel.org>
In-Reply-To: <20260714131729.48CD81F00A3A@smtp.kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 14 Jul 2026 18:33:03 +0300
X-Gm-Features: AUfX_mwi-FnQhvC2JtVlr51haSy7xBYWK3yOmmbUT8m24rZgRfmOoOKYkm8x-Hs
Message-ID: <CAOPX744Q2pyAv2ixFgrwGrW++-BVWs-0Hx7tW7XzJ9KbpwZC5w@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: phy: add DAPU Telecom DAP8210R(I)
 Gigabit Ethernet PHY driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 4:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: Low]
> The commit message documents the property as tx-inverted-clk, but the
> code implementation looks for tx-use-inverted-clk.
>
> Which one is the intended property name?
"dapu,tx-inverted-clk", it will be fixed in v2.

> [Severity: Low]
> Does this cause a compilation error?
No

> The abs() macro in the kernel strictly checks for signed types, but the
> result of the subtraction here is unsigned.
I inserted abs_diff instead of abs for u32 variables. It is safer.

#define abs_diff(a, b) ({ \
typeof(a) __a =3D (a); \
typeof(b) __b =3D (b); \
(void)(&__a =3D=3D &__b); \
__a > __b ? (__a - __b) : (__b - __a); \
})

> [Severity: High]
> If the bootloader configured RGMII delays, are they left intact here?
>
> By not setting the mask to clear the delays for pure RGMII mode, this
> leaves the PHY with whatever delays were previously configured, violating
> the RGMII interface contract.
It will be fixed.

> [Severity: High]
> Does this write actually trigger the software reset?
>
> This clears the reset bit by passing 0 for the set argument, instead of
> asserting it by writing DAP8211R_PHY_SW_RST.
In dap8211r's datasheet the low is active for this reset. I will
comment it in the driver.

> [Severity: Low]
> Would it be safer to poll the self-clearing reset bit instead of using a
> fixed sleep?
>
> A fixed sleep might fail if the hardware reset takes longer than expected=
,
> and contradicts the comment about waiting for a self-clear.
Agree, it will be fixed.

> [Severity: Medium]
> Is it safe to modify MII_BMCR here without acquiring phydev->lock?
>
> Concurrent execution of the phylib state machine might race with this
> debugfs write, leading to corrupted link state.
As I see, the phy_modify acquires the lock internally.

/**
 * phy_modify - Convenience function for modifying a given PHY register
 * @phydev: the phy_device struct
 * @regnum: register number to write
 * @mask: bit mask of bits to clear
 * @set: new value of bits set in mask to write to @regnum
 *
 * NOTE: MUST NOT be called from interrupt context,
 * because the bus read/write functions may wait for an interrupt
 * to conclude the operation.
 */
int phy_modify(struct phy_device *phydev, u32 regnum, u16 mask, u16 set)
{
int ret;

phy_lock_mdio_bus(phydev);
ret =3D __phy_modify(phydev, regnum, mask, set);
phy_unlock_mdio_bus(phydev);

return ret;
}
EXPORT_SYMBOL_GPL(phy_modify);

> [Severity: Medium]
> Does the else branch intentionally destroy the previous BMCR state?
>
> By unconditionally writing BMCR_ANENABLE to 1 when disabling the packet
> generator, any manual speed or duplex settings previously configured by t=
he
> user via ethtool will be overwritten.
No at all, it changes only loopback and AN fields.

--
Best regards,
Artem
