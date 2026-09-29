Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA42519938
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 13:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687152; cv=none; b=AuBcb95Aq7LAKDG3ZczeTd8CzeQ3ob1JKbEOro20Q+X1zgkaW5m2C4x2Ppuld9lRLtuapSc6Zr2xAXmRJ55vSuiUmVSilgWCjVL2qSAm1TJJEjB43XWOqchwpqQyKHpX2iXVLn9kffg5bb9ZMFGWpQffwxigVaVOrn8ihs2ntmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687152; c=relaxed/simple;
	bh=3+88oe4cL8erDWDweFA4+M2mDcFpRH3901NuhAxxxs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MIWVGvWccO6SCf75Qo2fjKmXPfWNpAFEBh93i/knmNWE72aydzLJtGh6hDem/mBzEmUTOaUWiWxikPBhuW+PgoMK0be3DLOgB0tTlDd/Qq0E6F0NRWX4O19sWK0XyrxV8mGlq7YUhacU9oFFM4lNEeC8lPhUS8VmaTnpFXEI4ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ipFrlXSL; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ipFrlXSL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=0WEQO4Duyi8rXvRZ4M+FLRW+QzZlNb/OqyioA9LGT5M=; b=ipFrlXSL+e7fUwTli4mrLPH2XB
	BdPafufD+m35uIKe7zZk9bHqBlh0+zt67abCjpZyg91uqXfLtHPxYnFF9KbIgrdfgnidRcKRxYCYx
	CThgGkYLZYyOgDGsclF9mHIFQegCzHQ69UHRm8DyPGJEgA79QmbPTCRT2lj1wM6vwRVxxW3RH/Dv7
	6Wp37CAlsptx3vvw81eYkJIrm/5SAeOiJohY/vcuE1KFJO+WvWLPfZePKvB8sgU4+wzmRIbcEG/oV
	yLDWVv+TAqJDhuBTEaM0qyk2NnMbaUYeVpZHktyrpoVk7KNRoYCcUxOEqvAnJB0tIyMUWSJ46JH5v
	BDn7tZKQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xBXWl-0003wd-1b;
	Tue, 29 Sep 2026 15:05:47 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xBXWl-0005Y5-2Z;
	Tue, 29 Sep 2026 15:05:47 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject:
 Re: [PATCH 1/4] drm/bridge: tc358767: register DP aux bus even in
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
Date: Tue, 29 Sep 2026 15:05:46 +0200
Message-ID: <3975301.kQq0lBPeGt@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260624123138.7D2161F000E9@smtp.kernel.org>
References:
 <20260624121515.2301219-1-alexander.stein@ew.tq-group.com>
 <20260624123138.7D2161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28138/Tue Sep 29 08:26:15 2026)

Am Mittwoch, 24. Juni 2026, 14:31:37 CEST schrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] The bridge detach function `tc_edp_bridge_detach` does not call =
`drm_connector_cleanup()` for the connector initialized in `tc_edp_bridge_a=
ttach()`, leading to a use-after-free when the module unloads.
> --
>=20
> commit 29555064108dbff74cdded5aeba9baee8adfd8a7
> Author: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> drm/bridge: tc358767: register DP aux bus even in DRM_BRIDGE_ATTACH_NO_CO=
NNECTOR case
>=20
> This commit changes the bridge attach sequence to always register the DP =
aux
> bus. It achieves this by moving the check for the no-connector flag to af=
ter
> the aux registration is complete.
>=20
> > diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge=
/tc358767.c
> > index 7188935fdb826..a1663cc6c2236 100644
> > --- a/drivers/gpu/drm/bridge/tc358767.c
> > +++ b/drivers/gpu/drm/bridge/tc358767.c
> > @@ -1833,14 +1833,14 @@ static int tc_edp_bridge_attach(struct drm_brid=
ge *bridge,
> >  			return ret;
> >  	}
> > =20
> > -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> > -		return 0;
> > -
> >  	tc->aux.drm_dev =3D drm;
> >  	ret =3D drm_dp_aux_register(&tc->aux);
> >  	if (ret < 0)
> >  		return ret;
> > =20
> > +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> > +		return 0;
> > +
> >  	/* Create DP/eDP connector */
> >  	drm_connector_helper_add(&tc->connector, &tc_connector_helper_funcs);
> >  	ret =3D drm_connector_init(drm, &tc->connector, &tc_connector_funcs, =
tc->bridge.type);
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but is a pre-existing issue. D=
oes
> tc_edp_bridge_detach() properly clean up the connector initialized here?
>=20
> Looking at the detach function in drivers/gpu/drm/bridge/tc358767.c:
>=20
> static void tc_edp_bridge_detach(struct drm_bridge *bridge)
> {
> 	drm_dp_aux_unregister(&bridge_to_tc(bridge)->aux);
> }
>=20
> It seems drm_connector_cleanup() is never called for tc->connector.

drm_connector_cleanup() is called from the drm_connector_funcs::destroy.

>=20
> Since tc_data (which embeds the connector) is allocated via devm_kzalloc,
> could the freed connector remain linked in the active drm_device connector
> list when the driver is unbound?

What I can see is that the connector is removed from the list in
drm_connector_remove() called by drm_connector_cleanup().


> Would this cause a use-after-free if the DRM core accesses the connector =
list
> after the module is unloaded or unbound?
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


