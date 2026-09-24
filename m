Received: from mail-wr2-f38.google.com (mail-wr2-f38.google.com [74.125.225.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4545B496D5B
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257482; cv=pass; b=rXe6pJ1vrzoFek4LSyO7ckHv2cxuqkzlFjBe/7dfay+fjZVKEczF+1DXZOKnNWH1VDCrerxDxyAVXEnKsBvhlkKm3ExAnJkufXoGM75imbRQoA8FqueyTVwIewgR+/amEjPrMNgSyemsr4YGdtk6c3sw2bjJT3lPdRO3ZGbRjBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257482; c=relaxed/simple;
	bh=srpUlNZOrzAYgQzUQn9udJrV5U4zpQZLaeztMl04WB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IvT9Jq7T7yLWof4H1RjuckPktsGxV/HqKRbaKm5iWdXKcSvm2yBasiDz0SlDXCSumLWtPKDa1iGzVTptm3x1Lsqb/0fmgUmUImNi9SH+oA7BiCo97xs30CNg8jEki3tO1rF0NRLmMYiniGY90KFCf82IkcJ/wuRuA/UggIRDrZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i//WU+D/; arc=pass smtp.client-ip=74.125.225.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i//WU+D/"
Received: by mail-wr2-f38.google.com with SMTP id ffacd0b85a97d-482f6350f89so1465351f8f.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 06:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790257474; cv=none;
        d=google.com; s=arc-20260327;
        b=IJWliLKHOMaNo+1UA0ykHjyRL/+wswpXEDSsiO44VquGpXRb29sIW31FuhCJLh91Hu
         /IK5QI72DPghKrpEmhOI+n1WtHM03H/8DWFLY5rxXpC+BqyToxnVR1p3QLjQUV9HgIe+
         KUAUQlFvadlmf/x09eYDSxNlnw7Muplgk/Q03UcBbRdYeaW+KV+UzUXMj27GRD9xABl9
         Y7QiirAnhF+ZXwE+u5gMqgrCbcrYE2UOpSp0uj7/Aw5kQUO/3cMQoE1ysbjvLfm6JWhX
         9ebtNJFyWOilWp2jSLkAYtPZOM9v4NJZ1tChk9F1N3mCSGlTI+8R+nmx/b/xuHc35s2z
         4zqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1vA/7F7T4hKWXEqYJVanQp0Khdd6KmZi7BaKquhMJvs=;
        fh=0mxpjGD6X/fmff7Usi2r8vU+RCRygamFiGm0Ghp0iIM=;
        b=LOxMrWleu2/a3Px68mD0qUTExYZh76Ci8gmVz/P7A5tWO0Lgl/be6lo10j+RQdGfLp
         M7FMnrQvO+SK4yp7EEP9/+YdVg9Hj/LYv7Q/dAs+FmpmpMlHKHzDPAB3XWKhwpS87DAa
         G0HZ9QHTLVDRV2UfH9lwGjWx0KKrg4Xniauh9Th7uT2Wiagin8nHkD0yF90uFaIGfi2w
         v83y2Z59P18U9FzR3LremuXF/Pg64VuJnsJkwIOoZimLOTeK0PbrSHLE36nKDigQ3zWZ
         Buf+QLjwbSBNnH1Oq/i0oxQNp8Jww52i07UOWseQR9eKLgjm9X6u6BcTpp/+LxqdEg2V
         S0XQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257473; x=1790862273; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1vA/7F7T4hKWXEqYJVanQp0Khdd6KmZi7BaKquhMJvs=;
        b=i//WU+D/Xft4xTh5d8kl25g3Aytx4qPw4UxV9BVVOYZjWFKmZyBivFEQEmJPHkTEwq
         o34KP5k5EefcyU/RLhGYEmpLN69AcQLUM8UnvKwpiXZA829exq0/Q7z2I21CPl/sR7F2
         8DauVUefh93m5tgUh12o3jDe8mQ+TC5/E41TJWwYPRl/nQHUxNghlxagqzUiYhQalkUC
         B1ctafBz4bYi0oAqyTNo3zN1BtrJkOOnDa4qQ/BcusHf0Z2VhBr7yzDZS2gS53nwvfsP
         5zm05cbI8xE0lliNlTCjQsY8sHwRZRiSVPpKyD2GzOJoUhpMGHQsUDkxXvGHOnHlwr8F
         DjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257473; x=1790862273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vA/7F7T4hKWXEqYJVanQp0Khdd6KmZi7BaKquhMJvs=;
        b=Dad82t6eM3JFoslI4wD2fVP4+VTFnDR8SM7bOWemL7YPAD+LGUro54NonE8ScEtKhA
         UNToGlhs3EEurtKi2ogopExKwckwaZtINtd5/Xht4aH4S8ZZO1g/0UhV3ofS/cN1NCzh
         Z9cO12XQPTD/G9SdjJpDzrivjFEr70AEJ3rvwUujx9fsXz7br9sb5ck1O5FM7TLpLc6Y
         h3gkUkQs6OKjzNAgyKcyR5aPaftLnSTM3RfVpeg8F6powrRXn2+HZB0LDDe4j4va7Nyi
         Ia4I0DjTHWyuwPuD78hKWFwLlWcAIr5ObLMgINtYnc3YERmLxn4HqLkyeGe5RYPo+XG3
         VeWg==
X-Forwarded-Encrypted: i=1; AKwUvBxCLmGV2puMmgKHVP04z0WrzITfhk64mvPlAmvsIMfhPqcYnblJFnxwqYizLfVi6VYmY8jPeZL0QkaSul8Dq2Q=@lists.linux.dev
X-Gm-Message-State: AFuF++k1FVxk+3NDP73WkvR36yGgwLZO80pTS6lxaf4S+NcvJV8lts0p
	JcRrSnYldZKJzSEoNuO05J/zzAcviFWE4oagN+4w/mxuzfDKkdFCDfTBka81wjbSXj+ExR9hn2a
	VWAgamyw87TzLsSdqXow+4zx/fxaL1c9skLl2rf4=
X-Gm-Gg: AYBFou36oBOXqFGjDe9B6GLmyWllAC6S4A0EvtoF1G7HAKAx4GOMV9ry1w6dcKLKtMs
	Vjjf6kq6Ekn0trF2qaSYjDOhqxFrdl1Cs/XPwl9at7SIqeq8HsoIOInjbFdJqkBBY3yOQecjNgO
	AsifUBPYduqXTNxjobyTQhzN9eCSK1ZagTij4l8n8xPa96su5rj49yoav0/Y7ggS36t49CsaslZ
	nrhiwWriv0cmAt+inhrpbFF2vladTJq4AuX/ONzkhQoVY3dmfxJAhNO2HjhoFUvaS2fW2yVo2tz
	5CmlqFW1kvxXnp5gkfkezt/YzYtObHmdmU+XBiUKJsyqLCTD9iY6pDF3wZGa/+lffmy2AMZxf5A
	La+/zhnw5z4BnKe5AHocEC5O4jcRcuowvWYwYY60MecL18/RM2u4/J73g84BL/V1HqVncRHQDvg
	==
X-Received: by 2002:a05:6000:41ee:b0:487:71a:be5e with SMTP id
 ffacd0b85a97d-48871751e7emr4423057f8f.28.1790257473544; Thu, 24 Sep 2026
 06:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923104054.3324830-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260923105237.7B87D1F00893@smtp.kernel.org>
In-Reply-To: <20260923105237.7B87D1F00893@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Sep 2026 14:44:07 +0100
X-Gm-Features: AclHuK8zM1ciyUvzD6y496Uq1l_AhIJFVnKp0Rhb2IMAuf1s6F4re485NR0FU3Q
Message-ID: <CA+V-a8uD16uG8cc9m7NHVZXT5bU64TYfu+_1POuXeioRAy6Z+A@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-watchdog@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Wed, Sep 23, 2026 at 11:52=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] watchdog: rzv2h: Deadlock in restart handler via syscon regmap l=
ocking
> --
>
> commit 1e1b26069f70735a537750b22a51257bb422c2e4
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> watchdog: rzv2h: Add syscon support for WDTDCR
>
> The commit adds support for accessing the WDTDCR register via a syscon
> regmap interface for RZ/T2H and RZ/N2H SoCs. It looks up the SYSC regmap
> using the "renesas,sysc" property or falls back to MMIO access if absent.
>
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index 76c1d315b0e77..30b0b70fecaa9 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
>
> [ ... ]
>
> > @@ -93,18 +104,22 @@ static int rzv2h_wdt_ping(struct watchdog_device *=
wdev)
> >
> >  static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
> >  {
> > -     guard(spinlock_irqsave)(&priv->regmap_lock);
> > -     return regmap_set_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTO=
PCTRL);
> > +     struct rzv2h_sysc_wdtdcr *sysc =3D &priv->sysc;
> > +
> > +     guard(spinlock_irqsave)(&sysc->regmap_lock);
> > +     return regmap_set_bits(sysc->regmap, sysc->offset, WDTDCR_WDTSTOP=
CTRL);
> >  }
>
> [Severity: High]
> Is the external sysc->regmap_lock still necessary here?
>
> When using the syscon regmap returned by syscon_regmap_lookup_by_phandle_=
args(),
> the regmap has internal locking enabled by default. Since regmap_set_bits=
()
> already performs an atomic read-modify-write using the syscon's internal =
lock,
> this external wrapper lock appears redundant for the syscon path.
>
> >
> >  static inline int rzt2h_wdt_wdtdcr_count_start_nolock(struct rzv2h_wdt=
_priv *priv)
> >  {
> > -     return regmap_clear_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTS=
TOPCTRL);
> > +     struct rzv2h_sysc_wdtdcr *sysc =3D &priv->sysc;
> > +
> > +     return regmap_clear_bits(sysc->regmap, sysc->offset, WDTDCR_WDTST=
OPCTRL);
> >  }
>
> [Severity: High]
> Could this lead to a deadlock during a system panic or restart?
>
> This function is called by the rzv2h_wdt_restart() handler, which execute=
s in
> atomic or panic context and must remain strictly lockless to prevent dead=
locks.
>
> While bypassing the driver's local sysc->regmap_lock was safe in the lega=
cy
> MMIO fallback case (where rzv2h_wdtdcr_regmap_config disables locking), t=
he
> syscon regmap has internal locking enabled.
>
> Calling regmap_clear_bits() unconditionally attempts to acquire the sysco=
n
> regmap's internal spinlock. If the system panics while another CPU is acc=
essing
> the shared syscon block, the restart handler could hang trying to acquire=
 this
> lock, defeating the purpose of the watchdog restart recovery.
>
Agreed, the syscon regmap lock cannot be bypassed from the watchdog
driver, so the _nolock variant does not achieve anything for the
syscon case.

Rather than working around this, I think the right fix is to not
register a watchdog restart handler on RZ/T2H at all. On RZ/T2H,
system reset is implemented by TF-A through PSCI SYSTEM_RESET, which
triggers a software system reset via the SWRSYS register. The PSCI
driver registers its restart handler at priority 129, while the
watchdog restart handler is registered at the default priority of 0,
so PSCI already resets the system first and the watchdog restart
handler is never reached on this SoC.

With the restart handler gone on RZ/T2H, WDTDCR is only accessed
during probe and from the start/stop callbacks.

Is this approach OK?

Cheers,
Prabhakar
