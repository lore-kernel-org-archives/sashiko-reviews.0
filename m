Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760624FC344
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739693; cv=none; b=nQe2nUSjm1KaHtJA53CRGdervy99YXKQEMIkrgCqPPp49VfFRs1+stJyJEHkDRMOzj/aiE7TVAaZEY+K00TyEglK/J8sTR6QIZwsQTjuswBhE/RIgNtqx/uaricf76aW6oKMkCIQjW44d6HxJf1s0Xs0MscbzXLA+McKdT2zxhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739693; c=relaxed/simple;
	bh=yp7HMr0aWV681B77Js62TvRWsJBPqCQDHzf1UvVZYLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TlyeelZZu0ONQK0BuvQ7W4zKaGSC2wSFDMCp3DjD62YpZeiY1wTuLixqc1/Lc5ruoU6MGk2VD4lM8/i3c75UKBgkyYSC1u6oXCDG1yr5U1crH5wzMEyR3s6cESjN3SJ3XfL0UTHUNVyA4+du0rY5rcF2LOMtQZvQPi8ore3uWHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZZZ6gsvR; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZZZ6gsvR"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so5781605e9.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 06:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789739682; x=1790344482; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BctPu7dKYbEuQZ+gJ77lmkNhAUrzQqQjO9Xv3Wy0GBA=;
        b=ZZZ6gsvRVlcFlcff2RejHhJQNkHEuiMNUdgx1065pLgYYIkFfhXXMPwUMm2m66NnoF
         lXObDXkdWOOys7ee+Op8sotkIFTABxa2Z0NzmRdDQ8tBo+KbS0wYgXO0vF5MGRQg+xJt
         kHPGfPYF6OKQiA90+o78TBVK5AKCWvY1/X2ey+73cP/05nbhijXDWefSH3LyET8mVhi5
         CxzxgzAZanRF5ewmqfjBEtY0LDMNZjR1dicEWKD9A2DGMuP2vkh28KvPtgGZ+8yn6vfO
         ibkcw9sHm+yl9lMwv9S8tdKi8iknq9LzJN1Vv95gdkj5JM3FDdbY1V0jjLnWIk3rANS2
         2cOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739682; x=1790344482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BctPu7dKYbEuQZ+gJ77lmkNhAUrzQqQjO9Xv3Wy0GBA=;
        b=AN15fR3q9pZC38KmmQpfyxe3dZjYJdkyWTFyEWc7b0XyRAwq4EMG0Bf7eAYg02hLQg
         D/HYV4laeRsdiVlvX19lQrUW3/XKQL7D0lKhC+oNnGlWUemb4Wp+9TFie8j3XMIngovn
         gkrCYsgPEahN7yfKvrK6dt+Y9NFktctGmloKnFnoFhI0srQUHDm/gNm9n2dmWS6l5Tcr
         hQhqqR0Zk8r495phzyKG46eZCd9iraqoq5t5cixxS0GiVBsUU0dFzQAfkfzUZfTCfKGj
         HliFzi2FnzqjL6S8GAK6IPKsV2faHbgKUyvnlibBpMp7G181T+yG+T5y4O/1irFXty7v
         7l2A==
X-Gm-Message-State: AFuF++mtrMnFbrm9u/OrGrVrQ82mKmwws4Obprjqy5qlQPnjjER5DG1Y
	exuLafLOg7g1WRJ5aidAmqI8QksBRXtKMnP6HcES7iJb96C4hmH6gvmtPfb7elxlYQ+7g+TT5UJ
	3bPZ1
X-Gm-Gg: AYBFou3APAGN1h5cbHW7EtRmd5QrnNd1QmbTjqjF33rVvikaktciiaCj5K78331kLKI
	TpPr4bs4J1QpAIOB6ADhoDMkuG99xdLIR8JyuhaHjcRIsAWRchcYRU1NtbPfq61nVnWn0HJwL87
	oU+sBr1EkJErsjxYIEdfOcDzWebkR6u4kyRuHv8rNobl5NplSZBKbXDEmFFhZoAXhZeLGUD+pj3
	kIfk5uk0AvrSnBiRLUUneysBAb9XOr4Sf4QqowL9k/izCoK+vienoNIiJ+K8zwp4lULKfhbr9KA
	gRyTwdTa5vfAKGUK9w+RtcxheBz70dHz9Tg1n+89Zg4rr1nfmnMMHGt2e1bawmsSz0aC/viBmy8
	eRluCUFEFBLl/PSUVSA6ndr0ozB6D66jx1orI2EYG288RRmma9tK0CvhS8vwo09jPhwEJs4mCDy
	r5r0HNwFTv2WGeEV+X8/HFz6kqcsYtGSOnoNAeccSe/by6xUFpEd5qhhN/BOz4ebUWaqLO+t/Ex
	QSdHoQGd8Xo1CYQ3WCp9KHFEmISdht/FLsmfabuGtUZlnDaJ21soSgQpKideg==
X-Received: by 2002:a05:600c:310e:b0:49c:f4ff:e872 with SMTP id 5b1f17b1804b1-49fc5681249mr33668935e9.5.1789739681828;
        Fri, 18 Sep 2026 06:54:41 -0700 (PDT)
Received: from localhost (p200300f65f19a90444c8989fe13f5be4.dip0.t-ipconnect.de. [2003:f6:5f19:a904:44c8:989f:e13f:5be4])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4872008023dsm4183569f8f.29.2026.09.18.06.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:54:40 -0700 (PDT)
Date: Fri, 18 Sep 2026 15:54:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: Ernest Van Hoecke <ernestvanhoecke@gmail.com>, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 4/7] of: property: fw_devlink: Follow PWM nexus maps
Message-ID: <aq1CSswlo57jZpMH@monoceros>
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
 <20260910-fw-devlink-nexus-ready-v2-4-17ac82dbe226@toradex.com>
 <20260910143106.B457C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="izmtx4jkinsmqk5r"
Content-Disposition: inline
In-Reply-To: <20260910143106.B457C1F000FF@smtp.kernel.org>


--izmtx4jkinsmqk5r
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/7] of: property: fw_devlink: Follow PWM nexus maps
MIME-Version: 1.0

On Thu, Sep 10, 2026 at 02:31:06PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [Critical] Missing bounds check in `of_parse_phandle_with_args_map` all=
ows a malformed Devicetree to trigger a stack buffer overflow.
> - [High] Missing cycle detection in `of_parse_phandle_with_args_map` allo=
ws a malformed Devicetree to cause an infinite loop.
> --
>=20
> commit 17ae1bc408452875cfad3c0d990add52c676f9b9
> Author: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>=20
> of: property: fw_devlink: Follow PWM nexus maps
>=20
> PWM consumers use of_parse_phandle_with_args_map() to resolve specifiers
> through pwm-map properties. fw_devlink instead parses the pwms property
> as a direct phandle reference, so it records the nexus node as the
> supplier rather than the mapped PWM provider.
>=20
> Use the map-aware parser for pwms so fw_devlink resolves the same
> provider as the PWM consumer API. Direct PWM references continue to work
> because the map-aware parser returns the original provider when no
> pwm-map property is present.
>=20
> Link: https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4j=
bauradujrre@gc5nbdhhixaf/
>=20
> > diff --git a/drivers/of/property.c b/drivers/of/property.c
> > index eba7e9fe6c386..a9c51d639a2b5 100644
> > --- a/drivers/of/property.c
> > +++ b/drivers/of/property.c
> > @@ -1426,7 +1435,7 @@ DEFINE_SIMPLE_PROP(extcon, "extcon", NULL)
> >  DEFINE_SIMPLE_PROP(nvmem_cells, "nvmem-cells", "#nvmem-cell-cells")
> >  DEFINE_SIMPLE_PROP(phys, "phys", "#phy-cells")
> >  DEFINE_SIMPLE_PROP(wakeup_parent, "wakeup-parent", NULL)
> > -DEFINE_SIMPLE_PROP(pwms, "pwms", "#pwm-cells")
> > +DEFINE_SIMPLE_NEXUS_PROP(pwms, "pwms", "pwm")
>=20
> [Severity: Critical]
> This isn't a bug introduced by this patch, but this change exposes a
> pre-existing stack buffer overflow in of_parse_phandle_with_args_map() by
> parsing pwms properties automatically during early boot.
>=20
> Does this code overflow initial_match_array[]?  If a provider node in a
> malformed Devicetree has a #pwm-cells property larger than MAX_PHANDLE_AR=
GS
> (16), list_size is read without bounds checking:
>=20
> drivers/of/base.c:of_parse_phandle_with_args_map() {
>     ...
> 	/* Precalculate the match array - this simplifies match loop */
> 	for (i =3D 0; i < list_size; i++)
> 		initial_match_array[i] =3D cpu_to_be32(out_args->args[i]);
>     ...
> }
>=20
> Because fw_devlink now automatically calls parse_nexus_prop() and
> of_parse_phandle_with_args_map() for all pwms properties, this regression=
 can
> now be trivially triggered without requiring consumer drivers to probe.

Does this need

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d71ae0449360..68d3eaa86742 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1579,6 +1579,9 @@ int of_parse_phandle_with_args_map(const struct devic=
e_node *np,
 	if (ret < 0)
 		goto put;
=20
+	if (list_size > MAX_PHANDLE_ARGS)
+		return -EINVAL;
+
 	/* Precalculate the match array - this simplifies match loop */
 	for (i =3D 0; i < list_size; i++)
 		initial_match_array[i] =3D cpu_to_be32(out_args->args[i]);

?

Best regards
Uwe


--izmtx4jkinsmqk5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqtQp0ACgkQj4D7WH0S
/k4i3Qf/ZU6j+f+F7wEOu0lkTb81o0hWsS22SRSxwiuDLT4jWT5t4IuoK/x5BS40
JKehGVJAkVNIKR1zWwqVGuq88y1UfVBj1TvaBL5be1eUZ2UmVQ5J9kcH3TNVHTD/
b4XoZbJncEfEx7aB22zQmXPepdavf2m8L2Slxa4L6fk465otOat2RcnetYXb4l+6
Q3zxUPTZrevAOJxTIR7RwwV5LC67fFVGfn8aIQ9nHMOMKruF8nVKVmJyxqaSTzx+
QLAOsskHoXZSvj2rNgWXxfMJgovl8D1qiVSJyuFWeeWMootDtMgQfU2FR8HhJvJ4
pUzkPXQobT0JAAUTcSA216S0XpJZOA==
=lw9L
-----END PGP SIGNATURE-----

--izmtx4jkinsmqk5r--
