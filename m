Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9533DBD55;
	Fri, 26 Jun 2026 12:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477190; cv=none; b=Dk3wp5vo5t7B34Gb6aetHB0FBnteyh4bZ3S+qR7uW6TKxdWBKNpad+9W86H2NvDrEmbw5RWhhoVVD6BFTglEvz0Y7jV9eV7L8Za1TtyPx6JDPo6tEa9Qy8Cn8UBrPbfNvAJ07nl2rc1rt0aRB8fzY6K1JrM5YPl0Gk44ZJq2JbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477190; c=relaxed/simple;
	bh=AD/rgS2yrWJfwfl9/AeTa0uM/dDOan4Hs9d7ZKdjbjA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=otATfaHBpLV1r6hdhFubXevDl/oO4GRGSA7dKRgdKUGAinJqCwNquCl+ihF5N+j30RqLZSxawG9AbLnzspaBle1x1jvkQGUMJRfd8AwuTK1k8zP2OmMx2NuTyYKlWdy/sW1JVq/Vs2lb8wr91o3UqV2dzpKaZC110jmHhX55gBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y9bufFXA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y9bufFXA"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7DFF174;
	Fri, 26 Jun 2026 14:32:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782477145;
	bh=AD/rgS2yrWJfwfl9/AeTa0uM/dDOan4Hs9d7ZKdjbjA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Y9bufFXANqvkz3zqsR4De5M/U2SwIEdDJTuNDQIIIPzu76cjy8lmVCUHdi+4YM7pY
	 Ru7JmT8Bc2PXjx5Xirb2rcDeN4lTLxXtXrC5NNWy+buy9GAbyAKcy3YJn19vEknbuB
	 a7FiiB6RCy+A05grpyybGkvGwvgQpDse84JXEVwM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260626121557.92C6D1F000E9@smtp.kernel.org>
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com> <20260626-kbingham-orientation-v2-4-47178be927b4@ideasonboard.com> <20260626121557.92C6D1F000E9@smtp.kernel.org>
Subject: Re: [PATCH v2 4/8] ARM: tegra: Convert to new media orientation definitions
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
To: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev
Date: Fri, 26 Jun 2026 13:33:04 +0100
Message-ID: <178247718423.372005.12851091564301822991@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Hi Sashiko,

Quoting sashiko-bot@kernel.org (2026-06-26 13:15:57)
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The commit introduces an undefined macro `MEDIA_ORIENTATION_REAR`=
, causing a Device Tree Compiler (dtc) build failure.
> --
>=20
> commit 26c9ba57e237b4ebfdbb6dbf2af353106c11c695
> Author: Kieran Bingham <kieran.bingham@ideasonboard.com>
>=20
> ARM: tegra: Convert to new media orientation definitions
>=20
> The commit updates the NVIDIA device trees to use new media orientation
> definitions instead of hardcoded integer values for video interface devic=
es.
>=20
> > diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boo=
t/dts/nvidia/tegra30-lg-x3.dtsi
> > index 60e8a19aa70ec..c58e3026a115e 100644
> > --- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> > +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> [ ... ]
> > @@ -1216,7 +1217,7 @@ rear-camera@10 {
> >                       dvdd-supply =3D <&vdd_1v2_rear>;
> >                       avdd-supply =3D <&vdd_2v7_rear>;
> > =20
> > -                     orientation =3D <1>; /* Rear camera */
> > +                     orientation =3D <MEDIA_ORIENTATION_REAR>;
>=20
> [Severity: Low]
> Will this cause a Device Tree Compiler build failure?
>=20
> Looking at the dt-bindings/media/video-interface-devices.h header, it
> defines MEDIA_ORIENTATION_FRONT, MEDIA_ORIENTATION_BACK, and
> MEDIA_ORIENTATION_EXTERNAL.
>=20
> Since MEDIA_ORIENTATION_REAR is undefined, the C preprocessor will leave =
it
> as an unexpanded token, which will cause a syntax error when dtc parses i=
t.
> Could this be updated to use MEDIA_ORIENTATION_BACK instead?

Ah man - the heat must have been getting to me. That's definitely
supposed to be MEDIA_ORIENTATION_BACK. I shouldn't have read the comment
I replaced.

--
Kieran


>=20
> >                       rotation =3D <90>;
> > =20
> >                       nvmem =3D <&m24c08>;
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626-kbingham=
-orientation-v2-0-47178be927b4@ideasonboard.com?part=3D4
