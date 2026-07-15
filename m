Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07192F1FDE
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 06:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096807; cv=pass; b=lt7jbfEYi4txca7o/G/yg2SQ46zCGVkLa1EQ9mslm7l97hKIYUs7lvLWvnqHA7WAtpqT7rCqWx1mWBtO3ISwlzhtls0mEht6/3MvH1yu+2UktBsvF2Mb/k4YZlKfmJQbZYpMHR7M/cm88YOyzOfZbfC59KEEEPdRP7dWjNN30pQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096807; c=relaxed/simple;
	bh=J5yflZ12W07m1WJ0c1r553NE35yxYBcPpPqsM2tClZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kzGWb+Tv+Eoyqr3EZe4xZjVzk948qz8QHgc8XS8s8Y3DT0t5SmGErAG4m7eEp02MtNq9v253gBG3MVKHYVo6S5/gVv94M4vGPkAwULGclkpJOxHvNZTQc04fd5YI8piiuaNqAbofaDXHOTMhtTBv/75xCqV9MQmrodNOd0b48kE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cc1fDDsq; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cc1fDDsq"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-662d984bedeso780066d50.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 23:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784096805; cv=none;
        d=google.com; s=arc-20260327;
        b=C1RgWw55qunbYJTMGxdRCYkO/IzH0tNoEXGHVWQA0d3F6hT/0rl2J7us9XOya73uXp
         PoPTp1la30D+iRckPrdFAra1KaVKyqx/ZaNSJVrCpgGiKqxy6eE0AJTXQz7kjQU9Yn6j
         hAYAZCtdG/fJ5MTpDo0sn+h2/Ve9qOe2ErpmaNJziDRLIab2AVNHHr3Sv1aOjQEKlmWQ
         c5h0oFEf1czi8vvNzOY/1e0h098nnnh3AYkCsIfJRnBHByc2g2P+b1kMhczamH/dP1nb
         O/yWjjcSPCWBwH30qsxvzQlYqm4662tcnmWzUxvUfotGGFOg58kyrTWXEQnn9cSGThtH
         mh5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gWSeKvpcppphKo4JuhaQYfS686HzGPt1n2IjvkPZLEQ=;
        fh=GBmacVDeFEJjMoVFDdJ4RApqi7WOhPuR6bgG07yIMU8=;
        b=O/t1mUThutdcwFFA4vWmbFf0YGBg3lxOx9P1LVryoIYNoqUsPXrX7hnl1ObPT1/UAC
         362cF3nGMfdefd7DaABM+o4XLmWY4lmYyZP3vJJzFJ5L2R+lamfhOG/6Ct5yoZcUme9K
         SZN//CCy63KSp442k0jWD/kE3JPA96UD7FY7Y/FWGoowGNfwkzqnBEwm8YFkcvRpcmiB
         PyNmDHIwom0+BuuEdRjNHaeVlmDkgOawW3ZrCYW8EibdzSp/fxbY7kTpwNrLosDqhxMl
         sfDHV5ULDKmV6hdLTw73bxIUKczHtxmKmZ4e/ZUV+8Mc+92aNCWZOZs2M9+o5Y5nFLA8
         7tHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784096805; x=1784701605; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gWSeKvpcppphKo4JuhaQYfS686HzGPt1n2IjvkPZLEQ=;
        b=cc1fDDsqutNelRUgF2GqIC0XnQMEANh/vJt6pDtrhSdpZlKrjpArzjH13fO6LaQfrW
         UiykHmbzPaAkGoa9dDOw2KQR1Gl0lNW1cUuiGLVVfVqylNrTQYhxRFTFOu1EDw6uJrQX
         1ChszTs0T9kHVKhejQ4d3Fr0HWyHZb/nd8Bbw0z0P81ZNqaWqnkCtMkvA12bE1Q7pBe0
         P1YxbbeN/4/uDR9lJ+1EotrBQYjWQh2NPWNUfzbhA2zLouz3dzDt9a2OggA5gvxQTiK1
         Ssr2LzasXYxRyn9Uz69OewMGJDelvYrZ8Z+CLQNS5ODRuNBsZ6E6uIyfvY+Z8W/lh8o/
         SkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096805; x=1784701605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWSeKvpcppphKo4JuhaQYfS686HzGPt1n2IjvkPZLEQ=;
        b=NTsaEsnyosZ+62D37uiA8bF5R4CcjmfiSG7JbDfjKRniILA10f3FVdEPonMH+osC9Z
         8jeMGyAsB6/t6p+u5vUJrkgvlkZBGvuwR90njT7ncAUcxkCJspoRJ9ZInHFBl/o0/e+m
         I9Thp8m0PGKLu38Xxwm1mK1NT4CP5Rcu8LMTJfLs4J7IL+bWFWVyCzJrQTg3Gpc/M52E
         5SdArYPrVXrpZLF/rzLXSuvDGDRoX+4d7jxBeiajfsn7hzJov1sZelAb0zU0qEIVlkMb
         /+HQju+Ytb/G/Y1Q/q65Msalzy+HM6pjeYXNv2jG2zQunoir6+diJ97yyxApxI2+Soqd
         e9GQ==
X-Gm-Message-State: AOJu0YwlS0i//7Xw35K1Ek9yCcUEgInAsRo/vJzHfQDDyPzRh1r+cUSk
	Ny9AIheZ8xiRy+ckbibswqdYim2P4GVQYHprTOvujM5GIJAfIiDa3z64x2a/uz9JkNrw1mBEJv6
	Ig1+vNKzJ8n6JUUtBMRv7IMPwejsdS7u3ctbNMKw=
X-Gm-Gg: AfdE7cmRaHMlTjDIfGtMdOq+1MbWx3EWq5McbBrBRlztS4h0KtMKuD7+TQVdJmeeIBd
	mZies0TrI1G21IbbV+A2V95TGxouChx5rgd3dMxRA1PNwC41YGKtJX655LA4UbwbYRtiHhrdfBa
	B/bHYJXF9pdzIDKpfIgy5S9JFS+SZu9KytFujT7RJAEonTXsWNb5DO4HgQiPfbv8byxgHSDSTKg
	u4oAie7HbZjOE6Kos3UWXwG3F+mVbAKn1Wc8dJ3JGpqnJ8enUIEOB0xxI0r8s3rhkC/0Q9e+Dsi
	zTtB/3xVi14gvF9bkq9XqC0CeC+63ZU=
X-Received: by 2002:a05:690e:4883:20b0:668:7e4:b078 with SMTP id
 956f58d0204a3-66807e4be6dmr2370313d50.5.1784096804761; Tue, 14 Jul 2026
 23:26:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714202850.40999-1-royalnet026@gmail.com> <20260714204026.84B601F000E9@smtp.kernel.org>
In-Reply-To: <20260714204026.84B601F000E9@smtp.kernel.org>
From: Royal Net <royalnet026@gmail.com>
Date: Wed, 15 Jul 2026 08:26:32 +0200
X-Gm-Features: AUfX_mx_GykK3yZd7csrMrPNJbBaiwMkpZUk534rlKvfi9UnpbROgKKA1H36E9M
Message-ID: <CAEWPSH5KVBDE6s+7EYsyGEJ5BNv2Y6dtXXcKOfS=9xxjw6MtPA@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: dw_hdmi_qp: attach the HDMI Colorspace
 connector property
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> [Severity: High] This is a pre-existing issue, but by adding this
> error path, the patch exposes it further. Does returning an error
> here without cancelling hdmi->hpd_work risk a use-after-free?

Thanks for taking a look.

The window you describe does exist, but it is not introduced or
widened by this patch: hdmi->hpd_work is initialized and the HPD
interrupt requested early in dw_hdmi_qp_rockchip_bind(), and the
function already has several error returns after the interrupt is
live -- encoder init, dw_hdmi_qp_bind() and drm_bridge_connector_init()
-- none of which cancel the delayed work. This patch adds one more
return immediately after the last of those, following the function's
existing error-handling pattern.
Since the cancellation gap is common to all of bind()'s error paths,
I think the right fix is a separate patch addressing all of them at
once (e.g. switching to devm_delayed_work_autocancel() or a devres
action) rather than special-casing the new return. I'm happy to send
that as a follow-up.

Igor


On Tue, Jul 14, 2026 at 10:40=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Returning an error from `dw_hdmi_qp_rockchip_bind()` without can=
celling `hdmi->hpd_work` leads to a Use-After-Free when the delayed work or=
 HPD interrupt fires.
> --
>
> --- Patch [1]: [PATCH] drm/rockchip: dw_hdmi_qp: attach the HDMI Colorspa=
ce connector property ---
> commit 77d2f0e8bc60d50755aec22dee119ad08bb92b3c
> Author: Igor Paunovic <royalnet026@gmail.com>
>
> drm/rockchip: dw_hdmi_qp: attach the HDMI Colorspace connector property
>
> This commit creates and attaches the standard HDMI colorspace property
> after the bridge connector is initialised. This allows userspace to reque=
st
> BT.2020 colorimetry and enables wide-gamut/HDR output on RK3588.
>
> > diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/g=
pu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> [ ... ]
> > @@ -695,6 +695,20 @@ static int dw_hdmi_qp_rockchip_bind(struct device =
*dev, struct device *master,
> >               return dev_err_probe(hdmi->dev, PTR_ERR(connector),
> >                                    "Failed to init bridge connector\n")=
;
> >
> > +     /*
> > +      * Attach the HDMI Colorspace property. The HDMI connector framew=
ork
> > +      * already consumes conn_state->colorspace for the AVI infoframe
> > +      * (drm_hdmi_avi_infoframe_colorimetry()), and HDR_OUTPUT_METADAT=
A and
> > +      * max bpc are attached by drmm_connector_hdmi_init(), but withou=
t the
> > +      * Colorspace property userspace cannot request BT.2020 signallin=
g,
> > +      * which keeps wide-gamut/HDR output unavailable. Passing 0 selec=
ts
> > +      * the full HDMI colorspace set defined by the core.
> > +      */
> > +     ret =3D drm_mode_create_hdmi_colorspace_property(connector, 0);
> > +     if (ret)
> > +             return ret;
>
> [Severity: High]
> This is a pre-existing issue, but by adding this error path, the patch
> exposes it further. Does returning an error here without cancelling
> hdmi->hpd_work risk a use-after-free?
>
> If a hardware HPD interrupt fires right before the devres cleanup
> unregisters the IRQ, hdmi->hpd_work can get queued. The DRM master
> teardown then frees hdmi (which was allocated via drmm_kzalloc),
> leaving the delayed work to execute later with a dangling pointer:
>
> drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c:dw_hdmi_qp_rk3588_hpd_work=
() {
>         struct rockchip_hdmi_qp *hdmi =3D container_of(work,
>                                                      struct rockchip_hdmi=
_qp,
>                                                      hpd_work.work);
>         struct drm_device *drm =3D hdmi->encoder.encoder.dev;
>         ...
> }
>
> Could we ensure that the delayed work is properly cancelled before
> returning errors from dw_hdmi_qp_rockchip_bind()?
>
> > +     drm_connector_attach_colorspace_property(connector);
> >
> >       return 0;
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714202850.40=
999-1-royalnet026@gmail.com?part=3D1
