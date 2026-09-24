Received: from mail-ej2-f9.google.com (mail-ej2-f9.google.com [74.125.228.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E975365A03
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 05:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790227190; cv=pass; b=sE4keAMTloU3ykNpE4z2wfS5ETOlCybdLzpLB4hdYZRwqDt2idAZyKPiWriQ92koYV0vOZuKjgLZ/t7t/OCGHUnFowHi8ejFVztcNQYkWKmNGz8JYKwTt7fruD2oTRffwmiAjLi7azCr1nGibnFhllQg+51EyXdAlNzDUz8pXZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790227190; c=relaxed/simple;
	bh=aZi2NFi10YHBsp1z9jKGGzufOnJ7M9wxb7MCM4kAzcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F8HTJB52iPJc/ZadCi6Qt7EwOg378mMkq2aALg46QJbbdFkF37ppy9u65oQRV7hi5GA2x7bvgPzWQNBnyUu9AAX7AwWPNvKbUN9qG0Yml+doN95OHF7S6SR7g2MZ0iO3WOtUWGLKWLAuinlZABGD6VJ+Sqfne7WorzXbsQVK4NA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SocZl+rX; arc=pass smtp.client-ip=74.125.228.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SocZl+rX"
Received: by mail-ej2-f9.google.com with SMTP id a640c23a62f3a-c2630e38cffso86543866b.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 22:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790227187; cv=none;
        d=google.com; s=arc-20260327;
        b=dvsg3sA+2gWGOYK9YMT09nzhRsxc2MP9BlBFnf/zyJVTNPZ24a+HM/hpL2zTQF1SM3
         fruD5BZwrOxuekcg+5fn2LAMAFZMTv4Wm9kvVM4kaJJN+ij1txib008IWQ+rZmA7kprl
         1dHGdg4UKkMap72CSJExDaKpjtnjpfTzb+qJ6/nPceJfkyIGyXCu0q1ZNtuqZUYXNhj7
         mZf0gMLfVgsmD/5r9JezmAzR/vmzmcShUuMQpXNkYYXlSxDafOuU2YC2Gpmlkb9HaMV1
         u+hgGKvJa+fOad+OkcxF6/KyzWWKayMChTE/h8JhPqepGd9kJ1g/wVAhYN5bHW3V8Cod
         mo+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aZi2NFi10YHBsp1z9jKGGzufOnJ7M9wxb7MCM4kAzcQ=;
        fh=A2WGyBb4DXzToEdk99e4LETf1U+7kkNFr3avMQkdGe8=;
        b=kanlWVCC0QbOuOUBkYX1+s1KNlh582BvYmUD9L9EPSKhLgGEVg8ejQfdasFjqNZXFf
         CyDPR5/fcwsYsdG5zTc70Q/8SJ7CCyHOQ/EmaREK2bkMU5wgMLQ1E9TWR8g8aiMe3CLT
         r6xrBoG7MXdB6bGnUPbG8sBT7pI41YGXxp3aEe7E4GAnUrDwluo3ctl+sgOOzYExWpOI
         QVaLcriQY1lNVdCjBVMEeAcH7PnqcxLsuNdeeKG52FplBF6hHM0GxiCMsAQMjDTFL01k
         /+qh+8quVuUr1E/kJXSOf0DjjEewaTO/cYVrHg/kk+LpwJo1L2lBoh3rpA3QRqyJDbxE
         1I5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790227187; x=1790831987; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aZi2NFi10YHBsp1z9jKGGzufOnJ7M9wxb7MCM4kAzcQ=;
        b=SocZl+rX0u4KSSaS91D0VdGyVV/GIy2O86NaaNoC74RoFN6pTBvtfRfQGvWg9wRjuv
         cHzdK4NIi+L0jCDNcFudmmlzDEOInnV7Mg/w92dkw8j1yRZe8MygLwTU4JxXHvuApogk
         MBGIKzytzkTSG8tgaqIRHlTyWaNN/RhVH6Vha+SgrN2hhdMC7fO49YTpg9JOSr9h0DRY
         gH11Yh7PY9KbJ2DxlZdzsOALnR2DTdZkTfPrKPkXE9lxDrrDN/iDHwWlOMsaNX/v9JQY
         /JPo685HT8B/Vyu/kFJHh5r/eLAL2KkkjvTEe+YrykB1aW8ssO0EXAeXrKOHv6y6XMKQ
         YKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790227187; x=1790831987;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZi2NFi10YHBsp1z9jKGGzufOnJ7M9wxb7MCM4kAzcQ=;
        b=YqX9V4U+iXCvoDlMjwpfGCYJW481VF5FXxcFmmhH4FXbowyrU8WPQweMF9jNFb9N/t
         zw156HZQCZmJ3VXBdn3wbTuuO5hNZ1JnVfZ+sMMF1GdZ2Kd9vQFt/mkoOb1ZAgNedKua
         Ra/MzMDYJo+Y+kEAgHwklbTw2EIjd20E7nY8R6aDgTCy5gWIUlEvm5WjtEavSzLB2pLC
         93lyzwYI29ETHuUlmAu4egEcuToZSDNOjlDn30zu8/a9MKccHOE5yDFnHVwwQ9vB1I7Y
         Yad5w2CR+6cctq7a9Y9tgJAA9r7Y+tZhVnYRZnyq7VHKWkslW4tgn4NDnt/nu5AhRewD
         ygnA==
X-Gm-Message-State: AFuF++kedJGakII3RPbER0feCJZP0Fw951JF//YLYdSrHHF7lkNvgWLG
	ChYLiOG/jxvUo4ePolAkMSXZJ8HNpSfyn6e5kKZ5ZeCi1VoR9WeG5EaYtAm3rEBkRaTi04K9xhJ
	GU32jcnSH8WPWFiPmnVcVd1CnTL8+nOVq4aQLDukjMQ==
X-Gm-Gg: AYBFou1rJg+qbxFkzqojnEsPr8YhY2mlNobE65sqGCmHVKo5r4UvYiJ120hOCuas+CI
	1N/wYHyFdrk98YlSStLo7qbffaVZYi1Ugzow9UgOOsm4ct7L6kA3wj6K8Dmg3/k0mfSOspiL6F0
	QRUETEm0nhyNBDu2vkrEmKYICGFE6aolIO1UmccgI/bk6zmFSRW5CwMW2qgfOMqP5jPjZVq/4ek
	lH44I2SkQnALLc3MD8589hpaVmnED5M1Nq0xfYwOLK4I12WFPKQe/WaVHt5pgjgcBDZdwWmByxl
	W2Hu+77Lj9TDdtQrOHDZ4fLfOmEBPKLFMjFKRlJfBNRaxm1jjO6cUuPkqg==
X-Received: by 2002:a17:907:d0e:b0:c26:19de:9ad2 with SMTP id
 a640c23a62f3a-c2ac2350b4bmr97952466b.42.1790227187226; Wed, 23 Sep 2026
 22:19:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20260922200336.2201212-6-coiaprant@gmail.com>
 <20260923200523.283221F00893@smtp.kernel.org>
In-Reply-To: <20260923200523.283221F00893@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 24 Sep 2026 13:19:35 +0800
X-Gm-Features: AclHuK_aBAIYVt_FhqySgCnrHx4QX15E0Szwa3KdjFmkTLDcEfRg1C4TlGocFf8
Message-ID: <CALj3r0ienmi95CNDDxqyiRsJAEe2w6vOzV2Gs=r6kpGvqab2rA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 05/11] arm64: dts: rockchip: rk3568: add XPCS
 and fixed-clock nodes
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, olteanv@gmail.com, 
	linux-phy@lists.infradead.org, neil.armstrong@linaro.org, vkoul@kernel.org, 
	robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8824=E6=97=A5=E5=91=
=A8=E5=9B=9B 04:05=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Low] arm64: dts: missing required phys and phy-names in xpcs node
> - [Low] arm64: dts: invalid status property in ethernet-pcs-mii subnodes

For the first point: dtbs_check skips required property validation for
disabled nodes, as confirmed by Rob Herring here:

https://lore.kernel.org/all/CAL_JsqJnOa_9Poz86vOWBCQigvv-Ab4Tt1hrwTxSa5zNra=
VxXQ@mail.gmail.com/

The xpcs node is disabled in the SoC dtsi, so phys and phy-names are
not required there. No change needed.

For the second point: status is a standard property that dt-validate
allows on all nodes, regardless of additionalProperties. Listing it in
properties are not required and not customary.

No changes needed.

Coia
