Received: from mail-07.mail-europe.com (mail-07.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4FB42377A
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 12:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339395; cv=none; b=JpVDhyhIZrAnPtsBtiyKAxbuqmSKRl1yV5bFudkCHy1lZx/KH7sTgWIg6KwOb0pvRQG/SIuBIF2SXfPJ/RL165GHleAdA1BlfgX2UT71PvmmE2s+S9MZc8g2Xmhkx6gir51he4iUnxIzPD8YWk97qdmkNvaxDKzCj8G/3iiijoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339395; c=relaxed/simple;
	bh=DvNWVcoUOMJllcw4xaG67Je66RGWuchYXSkBafMIYQY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NlrJ102bsv0aU9myRn386rXm6viiUbnmTvgs7JGppLOBTSd1Q9rtuYUu/sd8chNKoVKyoRUHA5RkMnyWBqDkpqvstXOkGz7eXMd3I3k099PkIbvof7rCoYNVSGeaoaIRLKqVFhGgRo43CZ+wt2hDYOJORr/CmwdYlJTx+NQoxLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=GCuj59RL; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="GCuj59RL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1783339375; x=1783598575;
	bh=82x8bAf2wNBQ5QOhiP8e0is47IQ1BDz7G4Bf4Ik32/I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GCuj59RLs2Zs6JshFntV3StWw074ejLXvSjBIa/99p1F66DtVa8fJD4bfp6nuRl8g
	 k6U9qxxoKzrDGHX8YvCb+lwoifLueU2A7MbJOO6fkSUfDhPNo/frQ6Gco5IbF2Kbqb
	 gKD56ktrYTDtW8lPFGbg4rl6bF4+zNpxnJMATmTh39BJvV1nskOJNQ9GdN8FahpjiO
	 v6yW+e2kpk2yAr8Fl5DUMrkUSUOQLFbTNxfB7NN9RK90sHkwPNLP7ywiYueO1DNLNj
	 Snk9+Gs60NNp7wL3tM6iVtv0kc4WGZcA9D3AFpMGqnCjiSM5U04qUrR9Y7LjAvCvzm
	 7we82K/ZiHAiQ==
Date: Mon, 06 Jul 2026 12:02:53 +0000
To: sashiko-reviews@lists.linux.dev
From: cristian_ci <cristian_ci@protonmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 1/4] arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
Message-ID: <u25a39zbC36mvz8rp3abyH03bkExXAuUFYxKU8flfoGV3XFttpebG4sRvv3e00ObVPBhEtegUvYr0d09FnnWl9BXOfizKGlng9X2Vpalq14=@protonmail.com>
In-Reply-To: <20260701205956.EDE121F000E9@smtp.kernel.org>
References: <20260701-rimob-new-features-v6-0-be7d5d1e007f@protonmail.com> <20260701-rimob-new-features-v6-1-be7d5d1e007f@protonmail.com> <20260701205956.EDE121F000E9@smtp.kernel.org>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: f63ffe97537f68d51dad4f445117b2d6fa51b51e
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, July 1st, 2026 at 22:59, sashiko-bot@kernel.org <sashiko-bot@=
kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The panel's compatible property is missing the mandatory generic =
fallback string.
> --
>=20
> commit 14ab3e4951175e1cf33309cf294f421f36606cd0
> Author: Cristian Cozzolino <cristian_ci@protonmail.com>
>=20
> arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
>=20
> This commit adds the description for the display panel found on the phone=
.
> It also enables the GPU and sets the zap shader firmware path.
>=20
> > diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch=
/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> > index ef4faf7631327..5a9d71d1e4664 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> > +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> [ ... ]
> > @@ -87,11 +94,70 @@ &hsusb_phy {
> >  =09status =3D "okay";
> >  };
> >
> [ ... ]
> > +&mdss_dsi0 {
> > +=09vdda-supply =3D <&pm8953_s3>;
> > +=09vddio-supply =3D <&pm8953_l6>;
> > +
> > +=09status =3D "okay";
> > +
> > +=09panel: panel@0 {
> > +=09=09compatible =3D "flipkart,rimob-panel-nt35532-cs";
>=20
> [Severity: Low]
> Is the generic fallback string missing from this compatible property?
>=20
> The DT schema for this panel (novatek,nt35532.yaml) strictly requires two=
 items
> for the compatible property: the device-specific string and the generic f=
allback
> "novatek,nt35532". Providing only the device-specific string violates the
> binding and will trigger a dtbs_check warning.
>=20
> > +=09=09reg =3D <0>;
> > +
> > +=09=09backlight =3D <&pmi8950_wled>;
> > +=09=09reset-gpios =3D <&tlmm 61 GPIO_ACTIVE_LOW>;
> > +=09=09avdd-supply =3D <&lab>;
> > +=09=09avee-supply =3D <&ibb>;
> > +=09=09vci-supply =3D <&pm8953_l17>;
> > +=09=09vddi-supply =3D <&pm8953_l6>;
>=20
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-rimob-ne=
w-features-v6-0-be7d5d1e007f@protonmail.com?part=3D1

Please, look at: https://lore.kernel.org/all/s6kyh5wyamcxyd7xsbu5wrrpndpdb5=
xhxapmxze2qgblng5eiq@hl36nzg2lldg/
