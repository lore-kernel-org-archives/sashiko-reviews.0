Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DAB40927B;
	Wed,  8 Jul 2026 16:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783528118; cv=none; b=Z/xhucRrFIR63iC/s/EFufb42pH64I2dFvfNTdgvqTPnofFCZV/ufAsCSqo0pbuqm/Xve+2cpaA2Ib6V0T+RAPea0J0mlnN7j/SqWFRQsi1XYefE6+7WyJD3Yr3Bmcig6P0Dqn/dI0b5kFGHgQERLkhtm2C59uz1Nx8TBJGgkrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783528118; c=relaxed/simple;
	bh=NF8JNiJ9Ox+VVCyHjl/7wQlLKRUoajhks5KQg+FOINk=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=fxiQ9l4hCMJvOGhw/AAqEzN2nb3JZn6B2GMUnN06f8nPbKT48Qy8F6p5KHAJ3LgBSl5AakjjMOp0Q5Pokqy0I9r+w1FmjpGK5gcisTYAwdNLJ4upvNAZNB5HJ0q+XFhs1i/ywnzwZtdFa6wBJpPBBzHy3LI6opHnvGvoDGFDq44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pjj8Wk5q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pjj8Wk5q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0C71F000E9;
	Wed,  8 Jul 2026 16:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783528116;
	bh=XpiaCvBcRSVe0aJ70fnXRFoJ2U/2HD+Ywbrl2kVCn34=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=Pjj8Wk5q6MdmXQYuw9MWwtJ2El98jvspzfj6cmGKeNUhRSQPWiTessd5wC89OhjiA
	 9cvcPLhvffRXWMsnevOJ1n5B6cv0jXp4LbH1tY4d3cf5YzI0n/EtK8O/yFZXZSdLA3
	 xoVL0zVWc3YhEn1YRdGWNfGUZbgI2eiDfdrHYjZTv5YGRdta5GH4FvuVSOYM544XSX
	 Wax7imOlxgMjAJNXoOxYnnggOXn9E1SMWGHMX//hQ5hrM8GGjd0HpPdSR9Q1M4NIOU
	 u+jbSY5XgHmrCLtusp51QqVmPpgMY64/aAGn1urpeq9h+DycvkgmHbmC42EqrE0FkG
	 8pO0YlOzP8iIw==
Message-ID: <99f0b52f6a723f2a548a5b06deea957b@kernel.org>
Date: Wed, 08 Jul 2026 16:28:34 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH v4] drm/fb-helper: Only consider active CRTCs for vblank
 sync
In-Reply-To: <20260702145021.226932-1-tzimmermann@suse.de>
References: <20260702145021.226932-1-tzimmermann@suse.de>
Cc: airlied@gmail.com, akemnade@kernel.org, dri-devel@lists.freedesktop.org, hns@goldelico.com, jani.nikula@linux.intel.com, javierm@redhat.com, kernel@pyra-handheld.com, letux-kernel@openphoenux.org, linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, sashiko-reviews@lists.linux.dev, simona@ffwll.ch, zhengxingda@iscas.ac.cn, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>

On Thu, 2 Jul 2026 16:50:13 +0200, Thomas Zimmermann wrote:
> Only synchronize fbdev output to the vblank of an active CRTC. Go over
> the list of CRTCs and pick the first that matches. Fixes warnings as
> the one shown below
>=20
> [   77.201354] WARNING: drivers/gpu/drm/drm_vblank.c:1320 at drm_crtc_wai=
t_one_vblank+0x194/0x1cc [drm], CPU#1: kworker/1:7/1867
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
