Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794399241;
	b=hjdh2wJDx7K3BG868xrkL4sM9Neh672rB0mwoRtu+hQRHcUGawnn+/QDx9l8OQMPv6fc
	 omPtFxJh0Fgzj311oLObcfdRSRcU6/rg1izOjaplnhkGF5WuhHbCY0XXKoJ/z6gHyMUIp
	 D6CWk8eXSB+6M4nOG+Itpn6dYhnARLJ47xE0lXuVQL2Plp5I6MuoFVbNGCnoeKaT23rqG
	 //WoOxX7KJ/VTyYeak3stI0sOIQvW6xWWSm6qoGhZ8vaDGUwEpf7aoAvptcR97pFqknzF
	 YZqAXyD2pWkeeLGnpdtWYOxayeXeyC2upN9CRuosIxMWnZ0O9L3Jr6fE+3VM/BvnKFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399241;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=4bwKIVEjY0OU55JXXSqGKkZRhYi5oOMQaIlb5Ao2IQk=;
	b=iobH1/GUJDG5rXgKTkvJ2VSpFK+sK9eh1Dx6k76ryFenfB+DzbZW7FUjKi7Lxd8OfpL4
	 T2hDEoavEHWFFs8r/UN8WDAJtddyRJVKhkpz1ksX2xX0jEO/aRjw2Wj+nEWIFPeBGu2xb
	 0c7988SnDvhkAFquLCugJbCvDg2GMAkShwnhXi1CA0tGb9WDMxHWtWKYooBx7BrEdcry6
	 l8qucmCqAEdGSsWWsCGM37PfDUrT26PNqoZI5/Iq5cMrYmi65GbEpSb+1y1d7nPxYRYnd
	 Yd2ckc2VMmEJCM/tAFIsHJRyi5tMXEs6xKW7KA1Ueq5gX+ASPqxHFB29GUyEI6KYafA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=jzVIU6cS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A6F606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 12:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94A6F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=jzVIU6cS
ARC-Seal: i=1; a=rsa-sha256; t=1794399239; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Usa4o5T3Oxyxi6K+F5lYduDMUZq5InprB72fsbIZnZs40N3d/LfFW+1zCf0yrx8uAwRXGuKM5Zr/cpmz9r7jYmk62jBnpG1t18qovfTLVyaVR8IMbJFQoyKqzyWX1XkttjI8GrtK6zdjInkPfNZCrwL8ch5Fbk8js+EU9EBv7Ek=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794399239; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4bwKIVEjY0OU55JXXSqGKkZRhYi5oOMQaIlb5Ao2IQk=; 
	b=ei05DLZq3aL5TwyVetffHzdtHb7hC0rZchua1c95PZcMDYvDKP5+O+82TVrFQFWG+KDnj6wKEQgdF5hMlKwX+vpwTuKQ06scS8G8bcBZSenXV5ld2qsH4bzsc5ScYY0PXHOkOXko1fBeBMJ7T5O/u2ccXio2Gj89cwzf4No2wwo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=jzVIU6cSQ0FgV8+kot7PQZAkjvqVbu1wh44hR+NKDzEHXaMcP12c9iYzrdk1AwACkzC91FNPTp2SRRYmnJmp9u/emmz4q72KWtygJqgmNzDNdipVsAHw17MjyvVXDi7PqXH313PTdGXfHODN23xOKoKXG0D4uz/yQRElg3tnTz11dwK8oU/QGm1qRIXQrygYVrogrxgv8pnCWnuvykxxVDXwXbOxJiaYGoj7vCc3z5wITRPPM+WNZbaaQgfnS71fjBZaOLWbvyCexb7K646G3P/mc4CfGv7/f8GOSGboDhVJSyxiMdgnWTmnAptN9yFiYJIMKHsqrqlFzSCyn+/L7g==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=4bwKIVEjY0OU55JXXSqGKkZRhYi5oOMQaIlb5Ao2IQk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794399237934877.6809005981979;
	Wed, 11 Nov 2026 04:13:57 -0800 (PST)
Message-ID: <07c9a10b8cb1183a1438eed5bea2b4133ea1ff7a.camel@rong.moe>
Subject: Re: [PATCH v2 9/9] HID: haptic: Remove stubs in favor of inlined
 dead code elimination
From: Rong Zhang <i@rong.moe>
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
In-Reply-To: <sashiko-outbox-208030@kernel.org>
References: <20261110-hid-haptic-kmod-v2-0-b835a067cb62@rong.moe>
	 <20261110-hid-haptic-kmod-v2-9-b835a067cb62@rong.moe>
	 <sashiko-outbox-208030@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:09:50 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi All,

On Wed, 2026-11-11 at 00:45 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] HID: haptic: hid_haptic_connected_to_input() returns ERR_PTR
>   instead of false
> --
>=20
> commit 3914d83f5b9ce7ec32449543dd125ffa8f399224
> Author: Rong Zhang <i@rong.moe>
>=20
> HID: haptic: Remove stubs in favor of inlined dead code elimination
>=20
> This commit removes the #else stub implementations in
> drivers/hid/hid-haptic.h and replaces them with hid_haptic_enabled()
> checks inside the inline helpers.
>=20
> > diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
> > index a71ccee569f31..070b56189ccbe 100644
> > --- a/drivers/hid/hid-haptic.h
> > +++ b/drivers/hid/hid-haptic.h
>=20
> [ ... ]
>=20
> > @@ -80,6 +87,9 @@ static inline struct hid_haptic_device *hid_haptic_al=
loc(struct hid_device *hdev
> >  static inline bool hid_haptic_connected_to_input(struct hid_haptic_dev=
ice *haptic,
> >  =09=09=09=09=09=09 struct input_dev *input)
> >  {
> > +=09if (!hid_haptic_enabled())
> > +=09=09return ERR_PTR(-EOPNOTSUPP);
> > +
> >  =09return haptic->input_dev =3D=3D input;
> >  }
>=20
> [Severity: Medium]
> Should hid_haptic_connected_to_input() return false instead of
> ERR_PTR(-EOPNOTSUPP) when !hid_haptic_enabled()? =C2=A0
>=20

Oops, bad copy-and-paste when rebasing...

I will fix it (and other issues found by Sashiko) in v3.

Thanks,
Rong

> Because the return type
> is bool, the non-NULL error pointer converts to true, inverting the retur=
n
> value of the removed stub and preventing dead-code elimination in callers
> such as mt_touch_input_configured().
