Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FDD3AFB07;
	Fri, 18 Sep 2026 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727906; cv=none; b=K/BRSnpuBVTs8g5ITK6PfGgt8MViwcmuY3UPuZVuumubgyuDVcNekuEN6HjpcroHYVLrL6oSzTlGWTPWaKvhL+0L8doYOA740GMekIJko8aI7CBiNxCldp6juXHb57bJUSJuLmVtoVWZY7NIPfR+ARTlzEixtCxfz/IGQPx5Ilw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727906; c=relaxed/simple;
	bh=E3WtwFd5Ad5TETS6xL4EwW3ODO/fN0e9kLu9lDjxPeQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=VSi0vmp4DLuMmFNEyf45zDS5IXJ+bEsBR3T/cPKVxlDT1VNHNcNZihMRFSdlJ/+KDi1qRcCHAonsuBi2nu7lL8N+cT/ue5RYw3OpcYg24qjmblTWr1vzSSVvWh40R0rWPtNyntLh/wI6rOcXgQyevpeShydLRgqitLHK+1t0ILA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AwOlt38w; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AwOlt38w"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EDFD2835;
	Fri, 18 Sep 2026 12:36:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789727799;
	bh=E3WtwFd5Ad5TETS6xL4EwW3ODO/fN0e9kLu9lDjxPeQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=AwOlt38wTYdNWFzEOIWWT1qKJJg2c9RYyk+Ugw7oZOxxMIOcC0Am5GDDtUDGKfiHo
	 wA6h66ULtjw7M5PL5HCWLNdKJaAn5B22riV6JRW99Bddu8Vc0kuwggSeOrEy8PDJWa
	 r9WcToCvHa9Wr+U6CaNTLA4GBlDJkj4wLsHnmioI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260918101903.7B5E71F00893@smtp.kernel.org>
References: <20260918-kbingham-orientation-v5-0-e1a134326988@ideasonboard.com> <20260918-kbingham-orientation-v5-6-e1a134326988@ideasonboard.com> <20260918101903.7B5E71F00893@smtp.kernel.org>
Subject: Re: [PATCH v5 6/6] dt-bindings: media: i2c: himax,hm1246: Use video-interface-devices
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, media-ci@linuxtv.org, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org
To: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev
Date: Fri, 18 Sep 2026 11:38:19 +0100
Message-ID: <178972789913.1723501.14514853233712550168@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting sashiko-bot@kernel.org (2026-09-18 11:19:02)
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] dt-bindings: incorrect macro substitution for orientation
> --
>=20
> commit 009f981811cc18f443edfd8ba45e1a412697cced
> Author: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> dt-bindings: media: i2c: himax,hm1246: Use video-interface-devices
>=20
> This commit updates the himax,hm1246 device tree binding example to use
> the new video-interface-devices definitions for the orientation property,
> replacing the previous hardcoded integer values.
>=20
> > diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1246.y=
aml b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
> > index a65488fcc643f..ca5817684e1e2 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
> [ ... ]
> > @@ -103,7 +104,7 @@ examples:
> >              iovdd-supply =3D <&hm1246_iovdd>;
> >              dvdd-supply =3D <&hm1246_dvdd>;
> > =20
> > -            orientation =3D <2>;
> > +            orientation =3D <MEDIA_ORIENTATION_FRONT>;
>=20
> [Severity: Low]
> Does this mistakenly change the orientation value in the example?
>=20
> In dt-bindings/media/video-interface-devices.h, MEDIA_ORIENTATION_FRONT=20
> is defined as 0, while MEDIA_ORIENTATION_EXTERNAL is defined as 2.
>=20
> Replacing <2> with <MEDIA_ORIENTATION_FRONT> alters the actual value from
> External (2) to Front (0) in the device tree example. Should this use=20
> <MEDIA_ORIENTATION_EXTERNAL> instead to maintain a direct macro replaceme=
nt?

Dammit. I'm an idiot.

I even remember checking thorugh when I did this, and I must have been
looking at a different part.

Anyway, thanks Sashiko - update coming.


>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-kbingham=
-orientation-v5-0-e1a134326988@ideasonboard.com?part=3D6
