Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CF83E1203;
	Tue, 13 Oct 2026 13:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896617; cv=none; b=eYe1rz4kxKvxPmBVBAiLvQQfZtGqAucVW7qnYAbz/dWdqglOVrBPn+61GBwEU2xck/Ixs6It8FdsumQI6Xpxnc7uqG07t0TP2+AsndMalPXrPBKewJtMDjEivn/Y9y8wPIeC2wlx/CaYDJ79GhfW6NCIIL7IydpBsq1OYEaZlzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896617; c=relaxed/simple;
	bh=egmBtondgyOXHx5RLyTTc2jqoZj6T+91zbuQyedbmiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MXKCg6hR3UjnsmesamBWmwEUU2LLm0Uz5nGOGZs6H96ytogzPKzWHmeziuPbiQjhCG36HQHY0nwfSjAA52DYBn7VpBwppyQ7HRsFmd6BL/u8Xc1PbohW3Orz18UYMXVv4qYH+3QLbNXlcS4vTpCmCn+eEAQs0Wgq7IQZIU7zbnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=NHz8tD9O; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="NHz8tD9O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=TIHcLfREShiK1c2i9NlsVC922V9xk09myq8IMmakA5k=; b=NHz8tD9O5+lLMvWRRVIuyb/ffs
	oQlD8v1zY4aVLgkRGo2l7QfPvge2/tDH7tmb8SQEBW0TbC5fzHA3ao847WSYUuIDkEDR+nSncP/KG
	jRSv0I2XXaNvnO87UZon+sOi+eL4+s/07iKwRl3rANL/viPNA9BwWIvYLpK+07oFguGFLgkJ6W4fj
	apz4ffO7gVOPeiOh1b1fNPJM1VbaZNdUXANi4cMdUmBRxPhSSm6O/YyaxOLwLk4G5o7y+8pza4tFb
	roUxnmShOFci6SLpVkzDVGQyjCIlQF59KQJBCAHFZ6k1pce+2z203Tnc7bhXDCifAtrRrkC5JiKtF
	JCljZXlw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGcAG-0003cr-18;
	Tue, 13 Oct 2026 15:03:32 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGcAF-0000yV-36;
	Tue, 13 Oct 2026 15:03:31 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: freescale: Add LVDS overlays for TQMa8Xx
Date: Tue, 13 Oct 2026 15:03:31 +0200
Message-ID: <14085313.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <sashiko-outbox-169626@kernel.org>
References:
 <20261013111737.998282-1-alexander.stein@ew.tq-group.com>
 <20261013111737.998282-5-alexander.stein@ew.tq-group.com>
 <sashiko-outbox-169626@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28152/Tue Oct 13 08:26:14 2026)

Am Dienstag, 13. Oktober 2026, 13:28:27 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] dts: unit address mismatch in dc0_pc channel@1 breaks LVDS1 hard=
ware mapping
> --
>=20
> commit 9e71d1e0ae4bcdbdae19947de71699d2eb47af70
> Author: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> arm64: dts: freescale: Add LVDS overlays for TQMa8Xx
>=20
> Add overlays for the supported LVDS display tianma tm070jvhg33 on both
> LVDS0 and LVDS1 channels on connector X14 (+ control on X22).
> The corresponding display controller PLL is configured with 10x the
> pixelclock.
>=20
> > diff --git a/arch/arm64/boot/dts/freescale/mba8xx-lvds1-tm070jvhg33.dts=
o b/arch/arm64/boot/dts/freescale/mba8xx-lvds1-tm070jvhg33.dtso
> > new file mode 100644
> > index 0000000000000..4a8ba61962725
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/mba8xx-lvds1-tm070jvhg33.dtso
>=20
> [ ... ]
>=20
> > +&dc0_pc {
> > +	#address-cells =3D <1>;
> > +	#size-cells =3D <0>;
> > +	status =3D "okay";
> > +
> > +	channel@1 {
> > +		reg =3D <0>;
>=20
> [Severity: High]
> Does this reg value incorrectly map channel@1 to hardware index 0 instead=
 of 1?
>=20
> It appears this overrides the channel@1 child node of &dc0_pc but explici=
tly
> sets reg =3D <0>. This will incorrectly update hardware channel 0, overri=
ding the
> base device tree which expects channel 1, and will also trigger a DTC unit
> address mismatch warning.
>=20
> This can cause the LVDS1 display output to not function correctly because=
 its
> pixel combiner channel configuration is applied to channel 0 instead of
> channel 1.

Ah, that's true. Will fix in v2.
Actually I would like to skip those "overwrites" as the value are already s=
et
in base .dtsi. But then dtbs_check complains like this:
> /fragment@3/__overlay__/channel@1: node has a unit name, but no reg or ra=
nges property

Best regards,
Alexander

> > +		status =3D "okay";
> > +	};
> > +};
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


