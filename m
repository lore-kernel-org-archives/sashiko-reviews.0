Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF004FC33E;
	Wed, 14 Oct 2026 09:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970771; cv=none; b=h/7GcBjLwbjJc09nKUICxBbxGLPOjFGD4gWYK1rFkQjRkRwUTJwgtGpMSqGp9W4EEvxHnoHw0ytC3RgaE1leoTw0PqXdz0IPHruIR58nuAuuC/YQ7tfdEoWkZaNUYONDOZVFD0ouU4V8LNL2USHnzzpj4Kqx22z81PgpAFC5UBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970771; c=relaxed/simple;
	bh=r/wahqHiEoyAZQhGQeU48qJzdO0Mb6kfkuPNjZePG1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F7qjLvkWLcmvF4/UJI6Ks8xRpQI9sXtnOwA0xi4tBrjBOyIF2lqTucBEwqZXW6do/WF4SoxHzomzTWtN4+RNATU+8/Hvy0ucMkn9A3ee9C6ce2JPrhZUJp/Sy8SOV3VqmIG84ekZsXmwaJKFpqcijmg3sj5qyoofPIn5hgXS8yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=nR1Fx1jq; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="nR1Fx1jq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=TpeTFtRKkdVPFxwXXxf9+WzZqUtm/D3M7A4QvZCvXUM=; b=nR1Fx1jqqoPGLdwt6Yib4pIJ41
	QkHHgfymMBPIUksJftc9ChvONa5o2gG3tbYKdwdfLKB0B37k2A1RdMbI0GrM2z1d4+BkjrO5yx6om
	v7xiTOBvnt7mqWrmjfs24ZBxGmfpXzBaPsLyiIFn7lFvKKBt2zoZ6f1p3GPsbcNWXIQKZ4xBtExw/
	qvSJpZVORNIxt1qqf64eh1z1CRADs1BuRLlWixsvQ133UHae5hZGFMnQHBGa6ttehB2D6AG2ZWh06
	xTVOZeJ908jL9VPWl4U4zzDHtX6eh23EZz4kE23GXtSOebdOYSt2lhki6o356JC7+EsVZSW6VWC12
	T6fyBN+A==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGvSJ-0002qD-0E;
	Wed, 14 Oct 2026 11:39:27 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGvSI-000Cgx-2F;
	Wed, 14 Oct 2026 11:39:26 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, Frank.Li@kernel.org
Subject:
 Re: [PATCH v2 1/5] dt-bindings: firmware: imx: Add SCU controlled display
 pixel link nodes
Date: Wed, 14 Oct 2026 11:39:25 +0200
Message-ID: <5233262.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <sashiko-outbox-170937@kernel.org>
References:
 <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <20261014071657.118378-2-alexander.stein@ew.tq-group.com>
 <sashiko-outbox-170937@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28153/Wed Oct 14 08:24:15 2026)

Am Mittwoch, 14. Oktober 2026, 09:24:09 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] dt-bindings: firmware: fsl,scu: enforces non-generic child node n=
ames
> --
>=20
> commit bc38a98038b8a49cd066c13a1783d4225b66e234
> Author: Liu Ying <victor.liu@nxp.com>
>=20
> dt-bindings: firmware: imx: Add SCU controlled display pixel link nodes
>=20
> This commit documents the SCU controlled display pixel link child nodes=20
> in the fsl,scu firmware binding.
>=20
> > diff --git a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml b/=
Documentation/devicetree/bindings/firmware/fsl,scu.yaml
> > index 307f1c6278532..cd6cda1192a89 100644
> > --- a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
> > +++ b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
> > @@ -30,6 +30,26 @@ properties:
> >        Clock controller node that provides the clocks controlled by the=
 SCU
> >      $ref: /schemas/clock/fsl,scu-clk.yaml
> > =20
> > +  dc0-pixel-link0:
> > +    description:
> > +      Display pixel link0 in display controller subsystem0 controlled =
by the SCU
> > +    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
>=20
> [Severity: Low]
> Does this naming scheme violate the Devicetree Specification Section 2.2
> (Generic Names Recommendation)?
>=20
> The specification recommends that node names reflect the general function
> of the device and avoid hardware-specific programming models or block ind=
ices.
> Enforcing exact node names like dc0-pixel-link0 prevents device tree sour=
ces
> from using generic names.
>=20
> Looking at the SCU firmware driver in drivers/firmware/imx/imx-scu.c, chi=
ld
> nodes are populated using devm_of_platform_populate(), and the downstream
> bridge driver in drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c binds us=
ing
> the compatible string (fsl,imx8qxp-dc-pixel-link), not the node name.=20
>=20
> Since there is no driver or firmware ABI requirement dictating these fixed
> node names, would it be better to use patternProperties, for example
> ^pixel-link(-[0-9]+)?$, to allow and validate generic naming?

=46ine with me. Will replace by patternProperties supporting the (same) node
names: "^dc[0-1]-pixel-link[0-1]$"

The distinction between DC[0-1] is necessary as can't be enumerated linearly
because they belong to different display controllers and are located in the
same SCU node.

Best regards
Alexander

> [ ... ]
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


