Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5452137F311
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 04:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337433; cv=none; b=Mb7sJE0PUQkCeeM3eNv3dYrBnBguL1bQaCrlOV9C+OpCBUlFRLDjRNXGF1gPXYHAghWhFr9YHG3paZltrnEHunpplEaz9XbhWY66ULCJdTO8QmiupWvKiADNSNPHT99ShrjwTMRxmcAw7UwZg6sLFVcLf62Bnqj2VkB7YbCfU0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337433; c=relaxed/simple;
	bh=Bhskj8y1R552m79fnnauJCbMurjNMkgQt7/Tjc9jmTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oanes99WDZimL7Ypn3toTJQNQLclB8S6WFMBSyIvxDP1B/3DwZnmOCMtqChUAaPkLbg/7w+U/SOlkAIy29p6LikwYUfhGJE3luUpyVzGa1ko5vyVGqpv8Thr15BSMNzOEjKlcWXHgr2VMVhmmqYypO/IdRNYbx3uhezUr38ayxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YoR6Z10X; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YoR6Z10X"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954dff6536so11924015e9.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 21:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786337429; x=1786942229; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bhskj8y1R552m79fnnauJCbMurjNMkgQt7/Tjc9jmTM=;
        b=YoR6Z10XComwzLCqWf2Leh1sLO77mU6lk++bggxpESzM8cztPawSouHlZk4rfJrEAS
         jjf4yKdwOxQn0urLuUl0roGF+BAZ4D576OiDZtkaRxZEZ2BozEwRVHzNCmX2ZySPXOU0
         WT3WM5dxXu6IY8qpTV0khHBMAGEEw48cW+lhSIzRoLc3wOSJrDfdhlmebMcFF4QQ8hFy
         TATjrKUm53l+fpU1VrXtDzWM9GnI6iJcx81+FxYGiqeTOglqkx1hfTzrXgEsX7ouDFPe
         CaWIVBKo0tZ2yKqCPOrqKDUiUa1dC3MY46d9rgE5FrSdpP2gu5Vs+SGiMrsbgjgqJZo7
         R8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786337429; x=1786942229;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bhskj8y1R552m79fnnauJCbMurjNMkgQt7/Tjc9jmTM=;
        b=Skw8ymIOIZdgNbupxcJBs3+hbigf9g6/owIoQmw7b4IUiu0sUIvTVXi63Tquv/k9fV
         ibcUeppr8jD9vqOECUiyGsSJwaVMFvak1xuQT9s1zUlIv/KHi06Yn89/IkRueSyieVHr
         5vTHZz/qbQPYduzmdAWfSfUvKTYWCTOUOBufuJh/CGupPkQ2TyneYriprsikkxRAhCZa
         8CNPKpBW43oxlgwimBHWb8U5TsWy7BoSRdG2H9lbKSkJcAlIcLAOoaig0vrwwg2fKhEj
         QHBfMviKXt4o7pZpltgUqwykIAWqbKDSPNXIQ/ADJSmamucCrqI6QQKqMWDs1+Uxpa4M
         BCEg==
X-Gm-Message-State: AOJu0YwJ0z/6EaPe4UpqQUos1mFipBlhi6Bpvy3D0HRuu+hp3jUzp/rS
	P3+I0hDTVbfgYtXAmcwYEfzETWK3YY5z2NwEJGy8owhGYpYSHQG34kRTSGpFpMcEBbdy6S195LN
	kAYkh
X-Gm-Gg: AR+sD11onSsdVz0f2dBoBLSc/tcSBrIMTd3HC7r3UN2t2Nxkurdx2WYpkmlbxQt7gIg
	soEBmbGDngs2ti+nlv6Rbv4j4eqlcB6ekjXB0In4yuIf0F4aaWdEUzuXMm6A77gEE26vjXU2CkT
	i7wXqryKZota6lDdEzQGhRWLV46qWhsPL+pzL+LC+aI5BQaAjS90BWFNNmKdtAeJFH8wQdwKbUy
	/5uVFXvV+Af+W0Z23JWFZnk5+qHEhrxSh0GN9wYwJ/i0WhEabMCyj3IPCAeWqZtq2Sao835LlJ+
	Oy/8okOUIScE/TT2MvEz+bEcfcaqrohybz3VLCeb+Ldwy+0OITPKEd79CoKz5Xhxyyh8iIC3xsA
	4Wj9nB/3W5Rj2Kz3i96RhNs00G/FNMPQf3SPymWB9dX4BASyUzvrfi6jHbyJnNaXl0QCF9S0GAu
	GW9IbUGWUeGbQjAASGLiUma7Zxq2lGrYuewI57rkiP42c9RYmk/Uqz2NdAmsu2zue4pNIGb67td
	Z3E
X-Received: by 2002:a05:600c:a47:b0:499:484a:7644 with SMTP id 5b1f17b1804b1-49959e2eb00mr345215895e9.9.1786337428853;
        Sun, 09 Aug 2026 21:50:28 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4995428f294sm372428995e9.15.2026.08.09.21.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 21:50:27 -0700 (PDT)
Date: Mon, 10 Aug 2026 06:50:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: Ben Zong-You Xie via B4 Relay <devnull+ben717.andestech.com@kernel.org>, 
	conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/3] pwm: add Andes PWM driver support
Message-ID: <anlXaad2BMush07G@monoceros>
References: <20260625-andes-pwm-v6-0-3aef11711017@andestech.com>
 <20260625-andes-pwm-v6-2-3aef11711017@andestech.com>
 <20260625104613.CFCD41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lcwqrsz5qzzs4vej"
Content-Disposition: inline
In-Reply-To: <20260625104613.CFCD41F00A3A@smtp.kernel.org>


--lcwqrsz5qzzs4vej
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v6 2/3] pwm: add Andes PWM driver support
MIME-Version: 1.0

Hello,

On Thu, Jun 25, 2026 at 10:46:13AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The driver fails to update the hardware PARK level to the inactive state when disabling the PWM channel, leaving the output stuck ON or at the wrong polarity.

I didn't look in detail into the patch yet, but I think the review
feedback here is misleading. There is no promise about a hardware state
for a disabled channel. The only objective is to save power.

Having said that, it's *nice* to drive the inactive level, but if that
isn't easily possible (e.g. because the output goes to high-Z on
disable) the primary objective is to save power.

So I guess the feedback is OK, but not "High".

> Additionally, if the polarity changes while the channel is disabled, will the
> hardware's inactive level fail to update?

This is in the same category. It's a bit surprising, but well in the
limits of what a PWM consumer must expect.

Best regards
Uwe

--lcwqrsz5qzzs4vej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp5WI0ACgkQj4D7WH0S
/k6uvgf/QZmDu/btQL6geT+qqHEQN7l+EK0l9p3A+CrqaMHlQP2lPn7VVPNxiinb
wDcvRoLSatNz6x9a8ER4AFNJoFioKAltqvCK86Ti0UJuN7+VArjfPZJAl3mtmio0
YOLXdH7PMqbqWuzhBxdMUXavTZnFA+Hmg+Vp9HmgJExrRqqk6IoebudKzXL7F3T4
bYD2F02Gd+oeDjBLxDU93erNxo2G+KHZFF594ZjrO80bqREwoN9cIvqygeaNBnVn
uhoE/oJ5VfFkR+HyXpZnHjSKpqK6JzF9ItcyRvlQih0TyDH2zrm1LB0wZKnyVGJF
BdAYmdSKXBufQIGjYZLjGkQWSnsEDw==
=L6CL
-----END PGP SIGNATURE-----

--lcwqrsz5qzzs4vej--
