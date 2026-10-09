Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617A34CC63C
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 11:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545972; cv=pass; b=jF1GzwBsExwctVBK8BBmGGmyBUXwHRJ7ppIUOijGkUOT7Begva6LjmuJH8f6t22IXkSu7xCvqFSvMkG3kFiwT8A7DWLRI4MvrR3PLEfBS4Qe37R42O6W1Pgqq3AfSXIzl/EIv3mtge+r6MzBLT6sxnYzpJpUcIlVTSfeNGIoHOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545972; c=relaxed/simple;
	bh=C53y5eHVm02NRhVf3GQWkstdsW5FKQKH/LzQH4a4y1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qP3vFceExikYNcr0ciVsY6SNDvf8zoYe/1ltoKC3VX94RCdPQMkfWs0wFz1slhsk8ehGgvv0Vm23qH1J+aO7QA+KRbRVmG5EsW3NVJf4h6g8HF/GeMthYF3gpE6SNkoyaZsPgwUgxXBqkW8SsXB7bkas648MWF2BLKpzuCiBjWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAXC+XVE; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAXC+XVE"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso1180913f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 04:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791545960; cv=none;
        d=google.com; s=arc-20260327;
        b=pz52CFkcWdb6c1htoO/4qVs4F6cRe3uJ+enpWpwwzXGNqAYR5QSjxZL0d5Z53A4+b5
         FAa8tKhhg2GcooQ1sGcWV36dPdwnuu1rVLo0J8OwIsW7cBHjYwMroJgpPxFLrVXEBDaS
         PFnKgdpwIlDvGfyyT0cH/Ikj9K/oH6Ud9jmcKOqCFy7Fxnsev6AOQIYEznkq50Pjx2V3
         XCCdMC0GFRps/oUy9V0foPEX6CiSX0wDGG4GmiEDpaXXPubBnJ8hEQwOO+/x7GjRjH9r
         aaGT3iOElDNjQnzhUKFIL4jgfUnkFeqihXh4qi+cKPhNS0SpFGCTNKmZ9RScuPAhNSfo
         sIgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zimi7cKuxcUlgp7UpEfU2fGEv64UYy0GKgKjfilsD2U=;
        fh=RU8nSI2EijC2y8B6rypEW77WbkjZMPjN4LQs4UIPXKo=;
        b=DDShmHlQFWgwnLD6fwdRmL0RDbp1SaYeIKDhC944uRL7WUgPV146S5I2t38WrRp0Pw
         lvDdnG3DLizD34bcipjRd+rgPaf5qhktJVUDoMyyy3eekouRwtBRdglYzvc86NeexaLl
         sxH9kBI2FkqT2duSSe1VZRQ0h6FVt2w0mova9P5EU5mngReQl0PkkicA/YYiv76obqj0
         5wzmRPTH0jgzFKGJQPbxeXTtWLTjFIqCKa+tWwQFJXsBelO5DRkdRafu+BpO+w7g+e4N
         lmb+a93a4XrrJdzSML94L983VJRtb576tKKaRDB2DURUHBIGnRPTLBidQdACEce8KqLm
         rZvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791545960; x=1792150760; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zimi7cKuxcUlgp7UpEfU2fGEv64UYy0GKgKjfilsD2U=;
        b=nAXC+XVEoIhUEu/apjFoXc7v/5QgdL6SvEQMJP7dvnBk6O7NNKO8mbmPgP1Su5gUgo
         VTw72Bnb7mvD6kTArRCI4t6N2zGpW+55WKiFKS77E58ddTFCt9ASo1ozDPmyMC3b0ndC
         Gkr2xCV1yTDKwSfwCs7+0KpqAstwpvTPv+Ut2CbAY/A+y93TZC0v3NpezQuCrETZMfgY
         OIxcxq3440H/sIdwvGfcJWN7js1d4fLUIAU2Nu8MnEznBJt0aNN7b84wB4SLWV68mhjz
         75aQmFiDGxG1RXZTJaUc6q86u2vXiNA33F+Ug1YjRxvh2pTnOhnEg9wglDeedTTr9v+1
         JPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545960; x=1792150760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zimi7cKuxcUlgp7UpEfU2fGEv64UYy0GKgKjfilsD2U=;
        b=kel8k9XBNK1HgqttRqnFgbmcPjrMWSyz2DNlnOKnKTo1XAvpbcS/Y6LjXniV4QKbJr
         ED1HKsxNNOe2Q805exX4UxtONKE6kNoZn7Y7r/rpAqWq0+oDIrB69Ld5CXNtNv4b/CrV
         morrNDga/kalpLsKh+KManvKie3bhIJSDvDRhb1nCMugdN1SYKDSVJjAkVWPOizFSEdw
         OOD78LY2kIb11Ret1hfqR/HAHRlGiLAw2/877YMESp5E2h0MEdOjgCKuC57N/++aBbz7
         n/Cq/dKPMB+lVjqBO1ZAmJW7/pB1lTFC5KeVe0exbhQYNfSQBf7aC+mUJhnxfq1eM2Yq
         FF5w==
X-Gm-Message-State: AFuF++nm0IjRzq8UMpfan86eL4mpOI/GCJ2BDVPxNKVatqdIFcO/6ONY
	KqAn9p1X1nbzONqV1TPUyzCh5ex+SwtPVgHEIJDBDtzecgJTuj3/DBKpFQ5By664Xe4IjvN8eLm
	/GXiSqp3eG1EIrN9Oj3tT/QPBlagkSNtiIK81fok=
X-Gm-Gg: AYBFou0NXdmVWoe4yFtGzvJg9+K0rML7NdCXrtAoOsb0GNYzyHhtewEAdpQpeFo6BL6
	oayd+9OV3otB/G3i8dnBIPfOr4rHzjDtXTPqHBtEz0GKugRMDLWM6tkkvv4gSUGfvume8vQQ2cl
	i3N/T5TLu73rsFgKzeAk/L/uD9q7GCHOqHJNHh4K3hPkXHTdezggi0+N7TLkyImm3S3T8C7z+mt
	rBfWk+b32cyqa8TloDEyTjBZU2t9/CCOtnS4aDOHGnmVblvy0BrF+7p5MeQWVKlPUUyepwwng72
	FlypZU8KT+aDFGXgsSeI3sWq6bb3fGFDR7e2anAUfyF1bBSdpoWzxOquzG8Mkm/lUUap8zkhdgw
	98CEHMjhFGsheAbNGXbEcr6/TC0y75TsJH7yvp3MZucRMV9QsCiH9eFq5ZZo1ej2OQENloe/8BQ
	==
X-Received: by 2002:a05:600c:a219:b0:49d:2589:d8e9 with SMTP id
 5b1f17b1804b1-4a18dcc9696mr23982235e9.11.1791545960167; Fri, 09 Oct 2026
 04:39:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929124248.237032-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260929125807.35C131F000FF@smtp.kernel.org>
In-Reply-To: <20260929125807.35C131F000FF@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 9 Oct 2026 12:38:52 +0100
X-Gm-Features: AclHuK8-9CW2XbXbQxya7GHaAMIQisQ-m3E94Ic3jTqTyMe54MVLfxYt1EYvEIQ
Message-ID: <CA+V-a8v-s_zQLfG-Vm7z465ZEEH=XFdnjhGCsMF_Z-eRw4gHBA@mail.gmail.com>
Subject: Re: [PATCH 4/8] iio: adc: rzt2h: Add optional reset support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 29, 2026 at 1:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] iio: pm: shared reset_control deassert_count leak on driver unbi=
nd
> --
>
> commit 2c9879cdb042266b9cb867be82cd949d29dd6f14
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> iio: adc: rzt2h: Add optional reset support
>
> Prepare the driver for RZ/V2H(P), where the ADC has a module reset line
> that is not present on RZ/T2H. Asserts the optional reset when the ADC is
> runtime-suspended and deasserts it on runtime resume before calibration.
> Uses a shared reset control to support SoCs where the reset line is share=
d.
>
> > diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
> > index f1a830da6f9b7..4726f892da232 100644
> > --- a/drivers/iio/adc/rzt2h_adc.c
> > +++ b/drivers/iio/adc/rzt2h_adc.c
> [ ... ]
> > @@ -706,6 +708,10 @@ static int rzt2h_adc_probe(struct platform_device =
*pdev)
> >
> >       platform_set_drvdata(pdev, adc);
> >
> > +     adc->rstc =3D devm_reset_control_get_optional_shared(dev, NULL);
> > +     if (IS_ERR(adc->rstc))
> > +             return PTR_ERR(adc->rstc);
> > +
> >       ret =3D rzt2h_adc_parse_properties(adc);
> >       if (ret)
> >               return ret;
> [ ... ]
> > @@ -767,10 +773,22 @@ static const struct of_device_id rzt2h_adc_match[=
] =3D {
> >  };
> >  MODULE_DEVICE_TABLE(of, rzt2h_adc_match);
> >
> > +static int rzt2h_adc_pm_runtime_suspend(struct device *dev)
> > +{
> > +     struct rzt2h_adc *adc =3D dev_get_drvdata(dev);
> > +
> > +     return reset_control_assert(adc->rstc);
> > +}
>
> [Severity: High]
> Does this driver leak the shared reset control's deassert count when unbo=
und?
>
> If the driver is unbound (e.g., via sysfs or module unload) while the dev=
ice
> is in the RPM_ACTIVE state, devm_pm_runtime_enable() merely calls
> pm_runtime_disable() which forcibly cancels pending autosuspends without
> invoking the runtime suspend callback.
>
That's not true; see the code below:

static void pm_runtime_disable_action(void *data)
{
        pm_runtime_dont_use_autosuspend(data);
        pm_runtime_disable(data);
}

The action disables autosuspend and calls runtime disable which will
asserts the reset back.

Cheers,
Prabhakar

> This RPM_ACTIVE state is reliably reached if unbind happens while the IIO
> buffer is active (where IIO core triggers an asynchronous
> pm_runtime_put_autosuspend), or within 300ms (the autosuspend delay) afte=
r a
> single-channel read_raw operation.
>
> Since the driver lacks a .remove callback or custom devm action to
> synchronously suspend the device on teardown, this
> rzt2h_adc_pm_runtime_suspend() is completely bypassed and
> reset_control_assert() is missed.
>
> Will this cause a permanent denial of service for shared hardware resourc=
es,
> preventing the physical reset line from being asserted for other ADC inst=
ances
> until a reboot?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929124248.23=
7032-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D4
