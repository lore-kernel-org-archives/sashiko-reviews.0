Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794311320;
	b=NuWkCxKEfopeP2dVC72MESXiWLC3BoHiYZHUWU/km03JfY1Sc1VyKfo5e0ZWyZqxOine
	 A/J75kVofauWFIVb4eV0oodGzWAr3kSQ0NtsIMKJe1rO9yFVB7PNeSmW0FlDaic9k9u+Z
	 BxIICZDMZDIaMvJBV160x4CRPW6LuW9m+27wQRkL/Y8jtH0bRcPD5C2j5dkv84Ebydsai
	 gu7X9+TtibeVdSvc6IPrdoKEdtYzZ+VZBkMR39vjNUtCRoeahaH5qyhQii6Q51xSggTzJ
	 QrJqUAQgDqKTF2DTeqt4GHrnNb1izYy0CSUKqh6Qo66hAYLBWVnA77Yj3AgPL9jxelw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=TCGSXQkkp9CYRjtPCbFI0n0SwhiyqiBh4xY4kDY/tRc=;
	b=skT3Lhk+BMTNf3TqusZRT5gPIaqhVwLcNtBXrAlRKcrwVgpTIKZryYNWEK5ZLAsTcK8O
	 TKpVcNH4vbchNcUOrgi6xdft+ajg6EXQy9RqlYboUPOyVHJuV+4CywJPetThUjkrKvDG4
	 /vFA+EScaKPdXvNhByfnG5PHF6D6WbfaSEvTaNDur8m85ubpovvAOTlC5tTbYTM3hVhpP
	 fUbr1kaIoQQ15K6VL3Z/HLDwC12nhF6dV55AAD/OW/3/HIgKmeu7SwL9c2WyxpZupleoB
	 qyvO3xsEWN1aS/tfztuwj2hGmVUwaxmzXMZE0uxscTELfZRSB938yEAU6XJFqMYZVNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZIFEw0FN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E53606A325
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 11:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E53606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZIFEw0FN
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91eb5559b34so14554316d6.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 03:48:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794311318; cv=none;
        d=google.com; s=arc-20260327;
        b=PfNLpNM2EmJzXDHKMv/dBGpl/yHmDWfwIMdxig7zW1P8JDUPbjGGWhakkwMX0moXJF
         Y2BnHLlvlMhaA6qRJQBin88CGUMQocnvf40bOZfv5MJzV/C3hilKcYnfvlQq2YQC4UqO
         s0zvAZd+pnmECzGXPg00bg5/nPPsnKa1xuFs/tFXLe8boA5EAP19plnh0GqnRRfucjQk
         LV2LFuokiQYDOjBUdur6Mb/9WGAyl7JsJ+rGQ6zcMglmocWE+zO4bHJuXHATYshvuLPy
         7tQWudFP4CXBVIwHlVOTGxllKGUPm6XhwcQjJu3dMpnTpwKgRuLUl9x0KPSKPr2QqlQM
         zg/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TCGSXQkkp9CYRjtPCbFI0n0SwhiyqiBh4xY4kDY/tRc=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=ONmFeFOhta6gcsE1uG8IomTzMKBD4/0NTzDnV+nv0S6fRY1nz0rLkrKMfRveaFkLba
         9VIphJeRkt0WKVLncmdDWOE1GoqyfJIyqnFiZxZhDyYYCekYu5HXWlBUMw/EeyCM3KmS
         1RRkAg7zCohxa9sBmP/Ko/3qEbEQYQIQ/9n8m2TPPe37PaGttF35ETiRrBHa/02BpnH+
         e8yl9Hc1XhOMBCX3pqj53Qp+ws5OQPEd0F+zRHjypB14GsgBPnceqSgWwcwSfQoCwJha
         2+rkO0eOwf6zioHeeVTrgGLefw7HorumKOdBgVrkCgPvtvkoNAmtNZCiT60DVpP5N0fT
         6UmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794311318; x=1794916118; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TCGSXQkkp9CYRjtPCbFI0n0SwhiyqiBh4xY4kDY/tRc=;
        b=ZIFEw0FNSsAZ9pn3rL6FbrOtRrS/N48RQGiKgY5a9u6pMvKOHm/ICc4dNB7xDNiteK
         pyR35vbAmqBIkxHslaADuwB5nA4DsNI/j5qtnYJU03OlyhXi9q5M+WMMs+ze7MQyeVSH
         im66YUlC9dgoiA9LmYMpNXrS8v4Yhj7AzTHhAS44uvxah6s+fOHcU8AsewXrYvARtM2V
         /bi0NLnTD28Qur8MxJxefMUSXV3jtX7kBdhTQ7MkF8A7zUa7OOW5zyBSjGMNJEmmfaq/
         Ih2iOFMxvUQ5zHNZzYJxgZWkVI5QYD87zcbMNaMFdZ47Nkd0vzNVbU4nu4iivnz1MyHB
         GdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311318; x=1794916118;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCGSXQkkp9CYRjtPCbFI0n0SwhiyqiBh4xY4kDY/tRc=;
        b=HRJZghdX/uCsq9gGd6C8SW/EQ6Q7feflImQFZ7aUsd2I5MXQdsmJedsPFXKgkALW0b
         BcrurN2h3WJFDMgiv/fvUeK0O6z71H9waVKgxNy2x+HQcT2oJXvg2Ts8impOPhorUqLK
         zlaccGxDPi8W9P3AU0fC8cKeySGQm8bBh9IE3FAy2tIx7mrDapcCFbPfuoxAHTiu0mvF
         6yR404lXG0b0DVWM8D3qJ5sLoLFmIfVzp5iGGgVktobxUmunb7JogxA8Kdipom3RH5Pw
         tTbq+yO6doqlVNbeAlFKX9r60LkRW9h/a/DyVBtLmwpdU7yOG5gUW6GoKewcene/ns2X
         NPhA==
X-Gm-Message-State: APuU4Z92N/YQiPtgWLjHSf8sK3syeIfgL7HanuH9f/B9RbAJyb7zDBtm
	lEb3JVGP93KmpShwSak/IX5w0VeW8Fs2HSfPkrSuV3UTs18S7Bpiu9/ZQ68wkxZqSsEM5G8+MOM
	LLufHd1wN71kZRV55LWWqxBxNlPmNxAE4bX9PcRs=
X-Gm-Gg: AYBFou0Gk1BAoJqv9FXGIXxln2GnhFE8RH69ukC5RrHMmuhhtH8Yj9GYfxHws+C76ml
	jDS7h/n2qAtKwRAJJNoTsBkHWoOHsbMSTVJpT/rLtgGjnvaEu8FqmUrj8MvMHLM45SUFYj7HCrL
	4olCEin2wsnb/uxIpWOeTGBHChnrn5o16kZR8/NpM9QEAxoYQG35wAuwZJTgtIeUwIp9YkyguvG
	Aarf+Jrdj2KyHVw/6BP4yVat+c/SWlLrpK+5VCV94ueEmi2jORLnNK6bTfXHi21qdQcBdkaq3RZ
	fLwWYyilEfAE+A+93QE2Np8tAH2I3XjayF+nIJENo4ulJR3scrSHBqORCaDjmXXbd5mT4XzOp03
	eT8LfkxhOzVMWOxXcE8/ub4Ei/mCMQDbERVcX/RBJ6HTWkygJC+kaisTpMTEJ9CHNy7cD
X-Received: by 2002:a05:6214:411d:b0:917:a278:ce0c with SMTP id
 6a1803df08f44-91eef953c89mr38462386d6.43.1794311318387; Tue, 10 Nov 2026
 03:48:38 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110113523.2517891-1-hj351016@gmail.com> <sashiko-outbox-206950@kernel.org>
In-Reply-To: <sashiko-outbox-206950@kernel.org>
From: khj <hj351016@gmail.com>
Date: Tue, 10 Nov 2026 20:48:26 +0900
X-Gm-Features: AclHuK-hlRCBmE0NXc2HkIod5l2gSiVzm8_S6uudo7AfNbetvFYsjZ296z-4DPI
Message-ID: <CAGr5VtP3FAJLYDRfMumwJR4ALceYA9i-N11Ff_GkUik3SqBjYw@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: cancel wake work on device removal
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks -- you're right, please disregard this patch.

udc->wakeup_en is never set to true in aspeed_udc: there is no
.set_remote_wakeup op, and ast_udc_ep0_handle_setup() forwards
SET/CLEAR_FEATURE to the gadget driver without handling
USB_DEVICE_REMOTE_WAKEUP. So ast_udc_wakeup() always returns -EINVAL before
ast_udc_wakeup_all(), wake_work is never scheduled, and the use-after-free =
I
described cannot occur. The cancel is harmless but unnecessary; drop it.

(The dead wake_work plumbing could be removed instead, but that's a separat=
e
cleanup, not a fix.)

Thanks,
Hyunjung

2026=EB=85=84 11=EC=9B=94 10=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 8:43, =
<sashiko-bot@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] usb: gadget: aspeed_udc: wake_work is unreachable in
>   ast_udc_wakeup()
> --
>
> commit 59e63d484d3cece4c9053b24c7e169339b0f2919
> Author: Hyunjung Ko <hj351016@gmail.com>
>
> usb: gadget: aspeed_udc: cancel wake work on device removal
>
> This commit cancels udc->wake_work in ast_udc_remove() after unregisterin=
g
> the gadget.
>
> > diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/u=
dc/aspeed_udc.c
> > index 10214232c08fa..2acf84c489909 100644
> > --- a/drivers/usb/gadget/udc/aspeed_udc.c
> > +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> > @@ -1460,6 +1460,14 @@ static void ast_udc_remove(struct platform_devic=
e *pdev)
> >       struct ast_udc_dev *udc =3D platform_get_drvdata(pdev);
> >
> >       usb_del_gadget_udc(&udc->gadget);
> > +
> > +     /*
> > +      * ast_udc_wakeup() schedules wake_work, whose handler dereferenc=
es udc.
> > +      * The gadget is unregistered above, so no new work is queued; dr=
ain a
> > +      * pending one before the devm-allocated udc is freed.
> > +      */
> > +     cancel_work_sync(&udc->wake_work);
>
> [Severity: Medium]
> Can udc->wake_work ever be scheduled in this driver?
>
> ast_udc_wakeup_all() is only called from ast_udc_wakeup() after checking
> udc->wakeup_en:
>
> drivers/usb/gadget/udc/aspeed_udc.c:ast_udc_wakeup() {
>         ...
>         if (!udc->wakeup_en) {
>                 UDC_DBG(udc, "Remote Wakeup is disabled\n");
>                 rc =3D -EINVAL;
>                 goto err;
>         }
>
>         UDC_DBG(udc, "Device initiated wakeup\n");
>         ast_udc_wakeup_all(udc);
>         ...
> }
>
> Nothing in drivers/usb/gadget/udc/aspeed_udc.c ever sets udc->wakeup_en t=
o
> true: ast_udc_ep0_handle_setup() forwards USB_REQ_SET_FEATURE and
> USB_REQ_CLEAR_FEATURE directly to req_driver without handling
> USB_DEVICE_REMOTE_WAKEUP, and ast_udc_ops does not implement
> .set_remote_wakeup.  As a result, ast_udc_wakeup() always returns -EINVAL=
,
> udc->wake_work is unreachable dead code, and the use-after-free described
> in the commit message cannot happen.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110113523.25=
17891-1-hj351016@gmail.com?part=3D1
