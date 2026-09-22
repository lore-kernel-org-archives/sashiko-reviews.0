Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [91.198.250.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FAA30568F
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 14:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087418; cv=none; b=jLPK/Mk1jS28CNMggcMW/7UTEI2BCjd1O0i69UhMI1RMjYIIM8lKGzT/7CMHrPRlwNRRMgpOSJMOPHgeXr8TyuMmFUW34+hebY6Tj7i/Oiuz9VP3rcT5dej5Hw+SmVFh8QJ15q36+ixx7G79vf5WKPvEap5n9//BNkkejuXSMuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087418; c=relaxed/simple;
	bh=atdu01c4RK2DG+lMy/EvQV8Og3qJqEbSgEje4cjNg1w=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=JBTRlYVjP3XOx7y/IjDyeoR+QpmeQ6lgP6bKsBr7d46rkX1hT6+YoVt0x6LpynP6Li2zUiX8VQjdmYK99cyppYnCZhykIU+O8KhnVq4sdpHaP3sdGwWqs1nZdmhr8PTQMTeYjrnYJZLsFv95is7V3ekeeZ+UQA30aT4a5tOnyV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=NGZKlsr9; arc=none smtp.client-ip=91.198.250.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="NGZKlsr9"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4hq2RB2WTxzMl8l;
	Tue, 22 Sep 2026 16:24:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro; s=MBO0001;
	t=1790087062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jk7FZBLkKpedf/1eIqzW88EwiXgtovqCCzjxi9YUhTk=;
	b=NGZKlsr90fDVZCSKMK3z4rKjCsTaDpsVtbaIGBKv/S0mXd6bHnXthLOt3M1/e34jsJ6+xI
	Y5yhIr/9YQ/QKL3uySkRggf8QqgT9Wb19YJn2QdqdplRNQpAXSeqRU/CvHf9tq1amPdoYi
	6tiCtC30uF5jCAmP3RyHEe7Cclcr5Qob5wnRM5rWZdNt07I4F/BKwHL9apxV5qniAzsSSs
	f9o4e0XBT0Hy0hLb2W3yocKs3O65lKXnbrpGzUp+NNOtb3ng6vbWIyYdQvC0ykCSjSRJxq
	7TCTy3BLsWgL697LJR6VKv3XWoLvebJzt84W5Rgrk1Y1zxubVTxh+wde+rxtDw==
Date: Tue, 22 Sep 2026 17:24:20 +0300 (EEST)
From: Alexandru Chimac <alex@chimac.ro>
To: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Message-ID: <1591117350.78120.1790087060934@app.mailbox.org>
In-Reply-To: <20260922123157.927751F000FF@smtp.kernel.org>
References: <20260922-exynos9610-pinctrl-patch-v1-1-f6d816696591@chimac.ro>
 <20260922123157.927751F000FF@smtp.kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: samsung: Require clocks for
 Exynos9610 pinctrl nodes
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal

Hello!

> On 09/22/2026 3:31 PM EEST sashiko-bot@kernel.org wrote:
>=20
> =20
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dt-bindings: unconditional clock requirement breaks PINCTRL_TO=
P node
> --
>=20
> commit 8b1ed6a89af0afe8c1009cac2d735ea6bee6ec4b
> Author: Alexandru Chimac <alex@chimac.ro>
>=20
> dt-bindings: pinctrl: samsung: Require clocks for Exynos9610 pinctrl node=
s
>=20
> This commit updates the Samsung pinctrl bindings to require clocks for no=
des
> using the Exynos9610 compatible string, as most of these controllers have
> designated clocks.
>=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.=
yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> > index 1feb6a6fc6908..e4fdedb29631b 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> > @@ -140,6 +140,7 @@ allOf:
> >              enum:
> >                - google,gs101-pinctrl
> >                - samsung,exynos8890-pinctrl
> > +              - samsung,exynos9610-pinctrl
> >      then:
> >        required:
> >          - clocks
>=20
> [Severity: Medium]
> Will this unconditional requirement break schema validation for the clock=
less
> PINCTRL_TOP node?

On TOP pinctrl node we can just set "clocks =3D <0>;", but that is a bit of
a hack.

>=20
> The commit message explicitly acknowledges that the PINCTRL_TOP node does=
 not
> have clocks. Since all Exynos9610 pin controllers share the same compatib=
le
> string, applying an unconditional required rule for clocks causes a struc=
turally
> correct PINCTRL_TOP device tree node to fail dtbs_check validation.
>=20
> Could the schema be adjusted so that clocks are allowed but not universal=
ly
> required for this compatible string?

To be honest, I've tried looking a bit into the bindings format=20
and I haven't found a way of doing an "else if" in this conditional. If
there is a way to add an "else if" to this, I will send a revised patch.

>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-exynos96=
10-pinctrl-patch-v1-1-f6d816696591@chimac.ro?part=3D1
Regards,
Alexandru Chimac
