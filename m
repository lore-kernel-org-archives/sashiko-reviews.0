Received: from mail-ej2-f2.google.com (mail-ej2-f2.google.com [74.125.228.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DF0377ABD
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 20:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784147598; cv=pass; b=XUyI3BhA6tjkV+pJriIJjGE5QLy1kbV3OIoxtpfs4c3kb0+nZNG8zZC1rD6CFZFBEPVHzr5Ti+wFg+P8q98TzUOMw0J3xPVbka2vFgWGMgFmIEBSonLLcz8wwgIp9owxhLnzl6HyPiKJZL69IbYZM+g/b8wGFNnJkAH8rszeUc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784147598; c=relaxed/simple;
	bh=HSzxeZhp2T25IO3LQKbxthYfzo4pgx22m+KFKX8aCQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+oZxykkicmOZZY6bE9kISHwBOSPydOqzK2lkCU7wdpZtnZR+P5htXK+V+rbWDE7zaJyC8FD6TJ1aJ9yLVQczajQ8er5zet3NSRgWBJQspxMz7vRKbeyMnEOYH1cWhpGj6o2k60rUD9+zyKEnmtP7Pq3tWABjYCd8vJkhcUbKEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCwR3Q6S; arc=pass smtp.client-ip=74.125.228.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCwR3Q6S"
Received: by mail-ej2-f2.google.com with SMTP id a640c23a62f3a-c159467cca6so137917366b.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 13:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784147596; cv=none;
        d=google.com; s=arc-20260327;
        b=ATMtUi7PPsA4C1RgJB+YW5IRr+eZZTjVQMeoUohVa5bgetCBr26nTz07nk+5cKhWQC
         f+sPMzl+zgfZqB3l/merP/U6Ofjf8kNbjdAS7/EayUFFiiIYLFWacp/dYdd84l10JJ8I
         eF+3jwigIC4IVBA5eIr1phRY1xSI5k58naoa4hykL01uSRKv+n5mQrSRk3LGeF3223Af
         Y84G5lXUBwNceXKiReWa5CZW4GyqB20gilyyvK8qAyL/qTdo4w1405ktCPAAac3OuFuO
         /TD7TOlxIzQ3aj+/Wmbj/nHjAjp6YJCympVVUG3Rv/8h3gsK4mN3mg5jbkuvnpyX3J12
         /d/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ChZRrIPY+q69QoNpgGM5mCWAZDJasoa0uEar2XXIlDE=;
        fh=8hBtreYcl/Xwp0K8+F6CFb5NwwH7ju745orhrb/nIRI=;
        b=Iba6ghZ7Qv7H151YssbwC724xhNBqoW3HXkFhbfW5VN3HXmGnixxcxcyPQD7T3rDqi
         JF2H8Q17Gpm2AXW1KEz7x4FLLlJuaGRdxYLsI6wrA8rHAphUXVq/3pPWM2kjZebnaW06
         kZdI/iBetflWYpiiFWV8ubsLaXoY1sV5MmfnFhOpxz1NrL/fhZXtX9HCIlEq4w8mKOlc
         OHdwPtk3+kPLyE8tQhNSbaWHTSA33Hkra8wOZDeY0QQwhqvYl3zBaUkrRPkFFYNZuXz9
         l7NVjJYM5T5nnI5h3e0NphsqR7QL8NcBRYrGc2kqZnHhhIdbCTxQTdnf38Iz99qFauFi
         54/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784147596; x=1784752396; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ChZRrIPY+q69QoNpgGM5mCWAZDJasoa0uEar2XXIlDE=;
        b=LCwR3Q6SpqmXCbubQTFac9yUkBo06MM9vBXRmijR/d30KkEhsfnh36uK0eWnkljD6V
         3FIz3Q6drz16gnDggVdL1IwStA/9zV5R8c/DJwZnD14hcKRd+iNZjT//SMXOnM1RJoTg
         /ARVg0nnSV6k0Kkd7s/P3tNdjfzFM0NDcjHa1EqgkXQYnxOY175yK4K1Jexx6ezdUrWA
         gPBTocKICsGk0qodjpPQJ04OMtrfsB6T6czu8cdjsiFuvsisf0ivfPHepovc7juZeiap
         AtYtaVfycosBsIBBgKwHoGB4siRW8LGyc0QuxrKA46BebuvqMkEd8wZ9hKa14f4AgngV
         +fKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784147596; x=1784752396;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ChZRrIPY+q69QoNpgGM5mCWAZDJasoa0uEar2XXIlDE=;
        b=RSdp02RazUUgWORC87oZCOSX3/m+nt4pSGDX9HNDP9pvW+6tDaMzdcueGosla4cAOw
         jpyzsX2jce3AeKb/01HP8/Fhjg31djkWerQFmFdlLapTNAI2V7+zrXrF+dhnRbxFyS79
         n+gu5wCO75xJJUvmg6GEMdLe5hGvIKpkVbgSmjSdsASklWzx5S/50/5zYbCOn8C9nJ29
         H+fR/s0jy52zaNQDA//a5pnErFCTJPIzgMdAhT47OtboB+PuGY2T7amCBskP9rl8Y81e
         dSCReOTmARyKRDpZ3TReSxWbt1AnFxbQ6ewzb7yzcWQaNy5EvRd8VRn+T0Glw/ui7HE2
         0/Iw==
X-Gm-Message-State: AOJu0YyGmYI6a2OlMmMATvxtLEp1KNj92dJ5aW5ZVmqy2HcWOcwm7EcX
	ya6XQh5qSpVQBc5SjM35hT0POvOs7xdwsulwK9kWVcdKXFbMCVFSudFiGgoA197PdBIgpluLFs4
	9R5eJp5jReLDlRTHj09N3x14z99yKQaIQ+BTszNe8CYMzlAk=
X-Gm-Gg: AfdE7cmiR0xR2Bq0Q7gXqb8+f3P8TsO4MyV1kwaIsz4haoDOtKsN4HBopY6cvLfXqsc
	CKXSLqfJDh/HPL6c81vaap0N3uFAxM8qtxUv+37ysXF8LpH5IrWykmEm5aH3LsiEPsd6dLVaxc6
	VfJ89IScJEREi+1D7KFDwgp8xScTbz65qhW3kxu+XUJRJWcK9ydQpwedEXq+pX4yIUjYYNUSNmo
	tDc2XrE7qYEE2tznf5QnuZPhFyHKHaGIlhOqkv0ZGLHhJ/AAs5gJiVqvbqKHlhro33qidN1wcY=
X-Received: by 2002:a17:907:d649:b0:c16:5cdb:9f89 with SMTP id
 a640c23a62f3a-c165cdba195mr563594166b.64.1784147595530; Wed, 15 Jul 2026
 13:33:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-9-coiaprant@gmail.com>
 <20260715191455.D033A1F00ACA@smtp.kernel.org>
In-Reply-To: <20260715191455.D033A1F00ACA@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 16 Jul 2026 04:33:04 +0800
X-Gm-Features: AUfX_mywQaSTkJvyJzv8XehCE-odr5e5YLAuGpoxeXM7OtZo7VSAqzu94NbaTns
Message-ID: <CALj3r0hjOBgRL21R9tRPDP+yrN0QbAXw=NcOvp4jiu_0PxFeWw@mail.gmail.com>
Subject: Re: [RFC PATCH 08/10] net: stmmac: dwmac-rk: add SGMII support for RK3568
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, 
	olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

> [ ... ]
> > @@ -1379,6 +1441,9 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
> >       if (ret)
> >               return ret;
> >
> > +     if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_SGMII)
> > +             goto set_mode;
> > +
>
> [Severity: High]
> Does this goto skip enabling the MAC clocks? By jumping directly to set_mode,
> we bypass the call to gmac_clk_enable() further down in this function.
>
> Can this cause a synchronous external abort when the MAC registers are accessed
> subsequently while their clock domain remains disabled?

You are correct. The original RFC patch had this issue: the SGMII path
bypassed `gmac_clk_enable()` via the `goto set_mode`, which could lead
to hardware faults when accessing MAC registers with the clock disabled.

This has been fixed in the updated version of the patch. The clock enable
is now moved before the SGMII check:

    ret = gmac_clk_enable(bsp_priv, true);
    if (ret)
        return ret;

    if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_SGMII)
        goto set_mode;

So the clocks are always enabled before any register access, regardless of
the interface mode.

The error handling has also been cleaned up with a unified `clk_disable`
label, and the default (unhandled interface) case now properly returns an
error and disables the clocks.

Regarding stable backport: this issue does not exist in the 6.18
kernel that I am using for backport testing, as the code structure in
`rk_gmac_powerup()` is significantly different there. The fix only
affects the mainline version of the patch.

Thanks,
Coia
