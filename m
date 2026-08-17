Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7813FADF6
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 11:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964768; cv=none; b=nIr1zzlfDbfedooS9JV+IGm1Pwhgmd8SFf612kzTivetVEEA1bHvliWdZvgjwUqmnIwQg0gPJczxTbDXi1i6dSyX221bmOpaGMLbozKcHCE35Rls31fY2yzCiW/cOciQ8PvKEteReaMBF95Vt6PDnQiOAE7cq8cOwMxYroBQQRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964768; c=relaxed/simple;
	bh=HWTrrRVLqcGXX4ANkmejO09hwO7EQ8/1dnaLQCRzUgQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KnH9ets5e6oXDQa8DFmEY0McVcjgP3jZg0VWPl6TZBmGWhcbOEMGc0OjoE+vP+cuDPMH1aJjj/fU8HAwHOw+/kZYk0l2ND3WJgnxrpKB+zz07nUnDKWiEqfjPYZAClyI9jVBVhb3IOApg9UfwoXSzRMYGBG62ZNcCZwUGd+l+cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=snN5+GpF; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="snN5+GpF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1786964754; x=1787223954;
	bh=xxVLMcthIF037nc98hyaoTk1HD9DpMu50mlc7ba6Hzs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=snN5+GpFMTihMBRiOLpzhSjWugjTesBY+HktMLXmIxwDvdzTn2Np6l9OrgWJ5ugL6
	 Mkn3sTOfAckPTJQ2litAkshE6XURFG0pJEix6P0McO22NXJEjmybC13jjOKNrRlEuz
	 rg0NMZlV+KdTXYtfLquK//2qh4ZZx9DHu6uH2bKJo213qsLpd8WYT18lDYPeBOHTwi
	 tg9Jn/xQtHtfJZhWbR6997wU9fdt8Gcctkcs/3YmYOFJ0hCy4txWr/S5xhx13VhRx+
	 B8I9TdhzMrjRiYgd2mBHjsSeZd09A2HwCEzxbUF2myewC0HUdFfvpTiaS4kYcHnF5k
	 xbeH8n8+Yf8Zw==
Date: Mon, 17 Aug 2026 11:05:49 +0000
To: sashiko-reviews@lists.linux.dev
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwinfo: samsung,exynos-chipid: Add exynos5515 compatible
Message-ID: <q3RgGWf-H5CYBBgwq-lceGTslnlwVzflgM6OEqjvyPfQH4xtyqes97znQnJ3kCGK9VUALqj0-sx7IVE-WVy_MvWxmDk6ywsXZotJwn7jhfY=@protonmail.com>
In-Reply-To: <20260817101658.75BE71F000E9@smtp.kernel.org>
References: <20260817-for-next-lucky7-chipid-v1-0-eb2908705c0d@member.fsf.org> <20260817-for-next-lucky7-chipid-v1-1-eb2908705c0d@member.fsf.org> <20260817101658.75BE71F000E9@smtp.kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 9713a5f8b78ab84d33eef7158e63b399161a56c7
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Incomplete support for Exynos 5515 causes driver probe failure
> --
>=20
> --- Patch [1]: [PATCH 1/2] dt-bindings: hwinfo: samsung,exynos-chipid: Ad=
d exynos5515 compatible ---
> commit 5ce6d6fa94d63e1a87277e33f24686ff951995c4
> Author: Aiden Isik <aidenisik@member.fsf.org>
>=20
> dt-bindings: hwinfo: samsung,exynos-chipid: Add exynos5515 compatible
>=20
> This commit adds the samsung,exynos5515-chipid compatible string to the
> exynos-chipid device tree binding. It specifies that it should use the
> samsung,exynos850-chipid compatible string as a fallback.
>=20
> > diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-ch=
ipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.=
yaml
> > index b9cdfe52b62ff..619faf33214bd 100644
> > --- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.ya=
ml
> > +++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.ya=
ml
> > @@ -25,6 +25,7 @@ properties:
> >        - items:
> >            - enum:
> >                - samsung,exynos2200-chipid
> > +              - samsung,exynos5515-chipid
>=20
> [Severity: Medium]
> Will this compatible string cause a probe failure on Exynos 5515 hardware=
?
>=20
> Because this binding uses the samsung,exynos850-chipid fallback, the
> exynos-chipid driver will attempt to probe on Exynos 5515 hardware.
> However, if the Exynos 5515 product ID is not added to the soc_ids array
> in drivers/soc/samsung/exynos-chipid.c, exynos_product_id_to_name() will
> return NULL:
>=20
> drivers/soc/samsung/exynos-chipid.c:exynos_chipid_probe() {
>     ...
>     soc_dev_attr->soc_id =3D exynos_product_id_to_name(soc_info.product_i=
d);
>     if (!soc_dev_attr->soc_id)
>         return dev_err_probe(dev, -ENODEV, "Unknown SoC\n");
>     ...
> }
>=20
> Does the driver need a companion patch to add the Exynos 5515 product ID
> so that it can successfully probe rather than returning -ENODEV?
>=20
> >                - samsung,exynos7885-chipid
> >                - samsung,exynos8895-chipid
> >                - samsung,exynos9610-chipid
>=20
> --

The Exynos5515 device tree also uses samsung,exynos850 chipid, just like ev=
ery other 850-compatible-chipid device tree.

> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-for-next=
-lucky7-chipid-v1-0-eb2908705c0d@member.fsf.org?part=3D1
> 
