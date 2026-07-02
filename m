Received: from mail-ed2-f2.google.com (mail-ed2-f2.google.com [74.125.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DD63A7826
	for <sashiko-reviews@lists.linux.dev>; Thu,  2 Jul 2026 19:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783022211; cv=pass; b=jCsAndsXvyDMrup5+1jvyFIQUq5PLIv+iOFtPqXTRwwf5GmU3vIxTQAfEErNfKjTV99yIyvqeHR3BMEn3kJr11FYwXYWFHhBRMPBKgemX0zobJxzPjT5h+j99dnol1KPTlHSD99+s8T/QyhSJqncjR/vD4I2N/jIh37DIIfjLK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783022211; c=relaxed/simple;
	bh=78XKiTTX6No/T/hR8Omcb5xp2aN7XcpwRGVep5gRzTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2jB6DqkUBzRKIA9whbzjDu5U2jNImFwtu5QqpXA8/DGYcDrcvf4pFFKK26tYt6jEQlMWPcI+Ie9n9j60051J1oyjFHmoVAT2w3Iu6lZ5kQ6eF6ckXvKn5ej9n+3d3uFBxV8t6kZZ/24CErhFln3vBwtve97WItKNVz6e79EFwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZ30wqH2; arc=pass smtp.client-ip=74.125.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZ30wqH2"
Received: by mail-ed2-f2.google.com with SMTP id 4fb4d7f45d1cf-69867726cd3so534606a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 02 Jul 2026 12:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783022206; cv=none;
        d=google.com; s=arc-20260327;
        b=gj3Uh3nhrKzeQKtUHZTC5Q/INYB+cVsWGxoiwJLWrkfq/AoY/uG80EzwrVH9cZIAXH
         LmZA+4VsmDrk9AMpklcXadsxLalKtKqbySpw8YOR0u0fiFx8B0M75ugd7qU8Yq+s/AXN
         Bvd+Fio4oCWNtxzIVW0NNztYbEgGo59RefxZvTvX4ffDFMMZkdEpnm60upI3qCdq/Tly
         Nlp2dxJKCQryujpC3XnEAU52LuaF6Qlq5H+o9jvLYKdAOvczAtDUIfD+5Y6AOVgsa8me
         Q+IF2rJUFnmbpMc+RcxQUhmGbSAGFB01Ad2SYGMC0YDOldObHAOiNxPt92yNFwQVp9gp
         gJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+R43ySXquKh2cdUqDoV82BuWFAxJ2P/AxP58siYwe/c=;
        fh=xPpY1eJncIbZYzB1EwAwSnJKmF4AWv783JvkNJMI/QQ=;
        b=QWvvM8dqGIAyQMdQCbdWR2Peux48xbWTWZX0oGQnL9qDRCaMKvpRPf7xuKao7BjL4I
         QQksV61BlyNnooDSj1LJiq3534eXedGFMroPrMLhStqGnZ3O9xPLBmBPI4O1N8e4y1nP
         au6UgNztGQcCv9iEKWKTsWz75IBw3FzHxSRGqJhHMC4p2oWMXUWv3yt/ANA0sAjutLPl
         ESJqQTepvrviibJNfbPYtfFnEVJK3LYzTZ++HQ4aTcnjnPTOgAkg7OqzmHfSq7858X7o
         6/lQ93g4ejRbQIM4m1j+dfLxkFOmpLOaquloRvxzUuDRDdx4m+CyZRGWxgRYKuk6R4iV
         ZDZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783022206; x=1783627006; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+R43ySXquKh2cdUqDoV82BuWFAxJ2P/AxP58siYwe/c=;
        b=aZ30wqH2XuAzwoV4RF1xzFwHhtYF/dGLsSIvq5nKwCxMBkEo9sJ5+lbIQwRKvUiPbg
         D/TAS+ye3KU63tWnRb3VUzWY/5KjYCq4YmjORgzrBuWOYdASibsu0VM0/Ttb6EXEZwXr
         8usYqsARlFyZdWxLCMi3Gug9Ipk+SQcE5YiSkxVZdclJkCeiNyqIKcDwFwxf09wUEqDF
         QcJgZzGX3jMIdvEDssxL09e/0bPHiN6HXwsWl7yeZXAbEj/2PyLJMeBd5ALEwoRqunDv
         MIbSVQK2gnjJo11box6HHTrQW4vaoiuDx1Q+Y9eSNpQR64dwAsM7iXcDbrXyZwyDwqvo
         zc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783022206; x=1783627006;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+R43ySXquKh2cdUqDoV82BuWFAxJ2P/AxP58siYwe/c=;
        b=T7Cl38goiYHvA+CcUmgAAtzvM4TeJ8u5w4Cgc1aez1QjdraYGIzvrBXuvoVnvVtMKJ
         B+BoEP0Ht+mrgXymFpD1bgi/LHfbUcITqgJTHAGndyD4WoXUOICgi408w1ZZRBP11z4L
         8ZZCWy4ZjBOde/7BZJVW7BKSBqW4gkmdeGdF/9wy1Qh27qbbsHGWsPg1fro5e4njawEK
         4m49zk47ABW+lW92TXL3aNQvsrz8Qour9dLl9P9Tymdq3worQFBaVRXc4enwMvuMIosj
         JBRHz2q+GzEEGZyZzVcPCRi6qQ5KoP3IMsC8XNFHWkhl++e/dE9/iUuBUvOFdFAMFUzr
         4AeA==
X-Gm-Message-State: AOJu0YxqXoThqcW7JJ0bccItjUlPd328syWVyt8UGiMj8Mmu6e5QM/za
	4nvTHrfhGLgujcXcKrdXsLXonArT3Ry4ajJt32FNVsfizzqXHRCIOsF5E+RRcgbc6b9TmMV87he
	FvyhGPnaxRNabOcrmxgb3Oi0B2SSMY34/3jFTsfedpkXo
X-Gm-Gg: AfdE7cn0WqAE2+nrbReK0g/dqbU6HnB8bUEYko8texxTtA9HZZLP42Uueek9IBdGPqk
	Wve+4NZFcz42gITOaniiJ3v4RjUAaV80AGJSFLUnKFB/BW33OrzxfBMcDUde/NkNcS6iYdlQCNu
	RFo5IoTu56NORwL06uiF7/9r9R9uXdMOPX2rtzl5Fp9LU4XrApS0/eKT4uCGtUyd1gQFsqa3z2o
	LuD0JmwRolEXootx4aHC+aLyjpxs9Xm3r3wkscs29ZmkxsGjjBYQ/aLH1NuK5Ak5GAFooju
X-Received: by 2002:a17:906:7312:b0:c12:a425:cbca with SMTP id
 a640c23a62f3a-c12ae74dfb1mr317838366b.54.1783022206297; Thu, 02 Jul 2026
 12:56:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702193538.2195973-1-coiaprant@gmail.com> <20260702193538.2195973-4-coiaprant@gmail.com>
 <20260702194430.91DB81F000E9@smtp.kernel.org>
In-Reply-To: <20260702194430.91DB81F000E9@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Fri, 3 Jul 2026 03:56:35 +0800
X-Gm-Features: AVVi8CdiP4pJCcVRB6E2EMlXWI1JezCP9aABddnM42SkyjD3EjNWOO9ItXcLxbE
Message-ID: <CALj3r0jJm+VXBi22g9ebqA219=V1vUHvsfT6NgNmOhcLaJnt3w@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: rockchip: Add devicetree for the
 Graperain G3568 v2
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +     wifi-irq {
> > +             wifi_host_wake_irq: wifi-host-wake-irq {
> > +                     rockchip,pins = <3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_down>;
> > +             };
> > +     };
> > +};
>
> [ ... ]
>
> > +     wifi@1 {
> > +             compatible = "brcm,bcm4356-fmac", "brcm,bcm4329-fmac";
> > +             reg = <1>;
> > +             interrupt-parent = <&gpio3>;
> > +             interrupts = <RK_PD4 IRQ_TYPE_LEVEL_LOW>;
>
> [Severity: High]
> Will this combination of an active-low level-triggered interrupt and a
> pull-down resistor cause an interrupt storm?
>
> If the WiFi module enters a sleep state and leaves the pin floating, the
> pull-down configured in wifi_host_wake_irq will drive the pin low. Because
> the interrupt is configured as IRQ_TYPE_LEVEL_LOW, won't the kernel
> continuously fire the interrupt handler?
>
> > +             interrupt-names = "host-wake";
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&wifi_host_wake_irq>;
> > +     };
> > +};

It should be IRQ_TYPE_LEVEL_HIGH, wrong value in OEM SDK.
