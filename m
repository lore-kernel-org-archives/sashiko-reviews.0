Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794822890;
	b=QIO014zfeFzSam7bmoU5vTld5oR4jZJiNY/BLYZb8D6+HHmPnDwHDOmwVRJkmIpY7Ric
	 jFC0Mg8riH2QjZSkpGqfjnJ3MG7fgFJcshjqcL5jZZ21k+vxTcmz+pmlRjIwXsve2r9LQ
	 J2ea1mnDr+LQlvGwAlMHEFc089mU13LMm8NcThpNkJLExKNSHTqDBG730RNMtCPCx6JIU
	 GjPaYPQitLC0RBMAagg3M2QelYSqSAOK68XxqkL/rowIFf60Zcgslrj+pIV5/+xwIFkXT
	 51MttYwmGQOC3cLwczCYRG4pif4vX9ApethdkMyJjxkH5m/Jk/XqDM4OHv4XJmokeEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822890;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=Pnk+YSSUyRHpLAftbwKFGJcFj9ouF3Kcek56y/WRV8U=;
	b=CnWX8A8VGLw9qcGuUKQLdvl7hqG5QlsgZVTX57vYTsycdlOmZFy7B0aZMkm9wu0XGUTh
	 PP49TJm4B4IFc6gbPezowPuNWAi28S1ZFUaNnEau/czDEOhCzxpOA6yX9iNwd0LbLA2aG
	 DtNmOpTMjXpx97zaSgP1mhnhf8eGCddur8fRx4x/7Sl45bkGNJpKgyE7G+4OEw74zcqpW
	 LoeZoSIxjLU30J5JlIwLsIDTCJ8B9lQjdCDv9mt+S5Q5JkmsHbPICTqvuYCeVFmj133ZQ
	 t9k+BzF29QPIcFF0te5lxJnN+e7rN4Cs/TvkYVaIRjZzMx/C3IdvMl2+kxOl+uNIpBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NrYmbsjB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAC1606A323
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 09:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EAC1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NrYmbsjB
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 42F8120062C;
	Mon, 16 Nov 2026 10:54:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794822887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pnk+YSSUyRHpLAftbwKFGJcFj9ouF3Kcek56y/WRV8U=;
	b=NrYmbsjB42x17PnV6D9zzI8fx02lEM67mjdb0THfvnrqQEJLjFSEpba31yCgm5WR/x6PV4
	VMvH0tA0LKiCqduW6SKryg1uioQxoy3n6VouUsBtmzYlHtMjb86s8L5tRC2rWS9TtWLENu
	Ou0bPeVrzPKh4YnGfkagZGW1ABXHyo2PMnKyyeOmYxiCiGCl+6iIItdcYKv1F3aLREpemU
	eKLBZerPy1VlZjO12aL7RnWWxsvmpJI3JErjWbMy1LTKPF/qJhlTITHGFGVox+9WR/FDo5
	O7dUilXvnc6I/3pPlxvl9JQdFwSzYBB1PBRMlV3BdOvbq1Xq56ECbeJVOXVqVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794822887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pnk+YSSUyRHpLAftbwKFGJcFj9ouF3Kcek56y/WRV8U=;
	b=dK0IPdZrfDR01znkvBsX3FUdfiSNCOwg7J1TpAKVi587GE6+QlUzgTiiNZCX/SvK3z6YBg
	phrqq8ZXLwD57Ejtboga0MU1IqLv2K0s+l9Z9GLKEpOVB2js3Ij12zmV5gbhuwGG8btp8+
	E9FPd8ho2WGK3zWASmr5d3yFKt3X1OTt3PrNGwwtgunUSHYdeH/Fr9mZpMZiUfJB+dqEBS
	PY9ave2d6GB0K/V+guM/THNQ92Ea2slDto98xs6uVFk5zWQKrbKROnta/8eRG7WwJusQao
	ooFCwRJjaQoMG3MwZBHjSxvAYb/2usxI/Z1Z+aU4OuKoSdzPZ65COuOYUGjHyg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794822887; a=rsa-sha256;
	cv=none;
	b=UfNkY2KqyGI4MSRqdca5V7PhgtjdQaiJfzKD3Qx+HsMFpEyt30qLzUBD5Eh2pT86MpjzBl
	q6M7Dfg3hwj8H1DfkSrnGhzmmzJOUCWzEpJ9sMRlxPdySzzv/A1W3MY5wNsINTRrnVNF/H
	TStnpBOO9OWhxgJdicGSZIOFmi1zleUOEI5wtnGI0EkwhVDedytj7zjdb3HvIhiKsRBiTJ
	JM0TR6WJjrY502xgy+CYds5/3EBzPizuc6evIbzn6VT1YMXwk17qU7BRV6Nl66df0i3w3O
	9JrmShnMB1EcE3HoRGWiTt2kCTpG2anl4HuwVaxrPoFKu0Yz6psobtOI7MvGiA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <4de1556915872149ab2da2f8a6eec78a1201157c.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] drm/panel: ilitek-ili9881c: Fix Ampire AM8001280G
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Date: Mon, 16 Nov 2026 10:54:47 +0100
In-Reply-To: <sashiko-outbox-213271@kernel.org>
References: 
	<20261113-panel-ilitek9881c-lanes-v1-0-9d9320cc1387@pengutronix.de>
	 <20261113-panel-ilitek9881c-lanes-v1-1-9d9320cc1387@pengutronix.de>
	 <sashiko-outbox-213271@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Fr, 2026-11-13 at 17:06 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [High] drm/panel: ilitek-ili9881c: missing lanes init in three panel
>   descriptors [1]
> --
>=20
> commit 40a8a814e1b52ccce761f231179cd2bd05641a2c
> Author: Philipp Zabel <p.zabel@pengutronix.de>
>=20
> drm/panel: ilitek-ili9881c: Fix Ampire AM8001280G support
>=20
> This commit sets .lanes =3D 4 in am8001280g_desc to restore the lane coun=
t
> for Ampire AM8001280G panels.
>=20
> > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gp=
u/drm/panel/panel-ilitek-ili9881c.c
> > index 7bf38e96678ac..cc4cd646b6111 100644
> > --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> > @@ -2662,6 +2662,7 @@ static const struct ili9881c_desc am8001280g_desc=
 =3D {
> >  	.mode =3D &am8001280g_default_mode,
> >  	.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE =
|
> >  		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
> > +	.lanes =3D 4,
> >  };
>=20
> [Severity: High]
> This problem wasn't introduced by this patch, but are kd050hdfia020_desc
> and tl050hdv35_desc also missing their .lanes initializer from
> 2f7e4a699736 ("drm/panel: ilitek-ili9881c: Allow configuration of the
> number of lanes") [1]?

Yes, see patches 2 and 3.

> Without .lanes set, ili9881c_dsi_probe() passes dsi->lanes =3D=3D 0 to
> mipi_dsi_attach(), causing DSI host attachment to fail with -EINVAL or
> triggering a division by zero in DSI host controller drivers that divide
> by dsi->lanes.
>=20
> [1] https://sashiko.dev/#/bug/linux-62dd6149-f822-4521-aeee-730978e33590

I've observed samsung-dsim run into the "waiting for header FIFO timed
out" error message without this patch.

regards
Philipp
