Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A9C2F1FD7
	for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 02:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785033470; cv=none; b=j9iwxnuPW1N/F+SfmtkLWNfekXwZ2Is8ew2Ig3eFf0AE9RRJfH0KWsUOf+lVbKxhm47GMyXov3+QUXUWXE1XsXMWRFrNENtPauodqbWUatFBM6E4BxsVWFXRsi+zmnlu64doPfR8ZXdwsat8t3PCW0n9AwIzHlb7fZBo24XPHOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785033470; c=relaxed/simple;
	bh=DnZhAOmClUsjgPyiRYQ5v2c///L06Eh98JzPH/zNmEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Py8z5jiGYjJV/4JUPB9ALXtWeBgEKqRMFNhmMYZ9bQy0IhujrhLmNbPmIiz39PVIoOmEpMl5fw4xIf62KrU8w4zcuZ04axoZtuh+UDj0osyu68y03dp0LkiHxglH71042XlariwKaGOsq1tamYrG7hzLE9+WJfSxDi99qvUB5MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rZeX4yLB; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZeX4yLB"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-44856d185bcso1408035fac.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 25 Jul 2026 19:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785033468; x=1785638268; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fiy5MIwEYC79lCUdHmcSHn5jPUbbQsIQK1Ub38H4x78=;
        b=rZeX4yLBT5cOXH/XNfMcrAdJHXLp4ndlmJaHjRhSIDQO31iJj4SheuQfnsanXu/GKd
         ccYI6UiEaneYfl9GiHh2N59MrIb6y4ONsO8PFaeUEoc5sG2YgplZ0D6uOy/Si/rpBSM3
         RQVongkwn3pehYq6v2zgXEyU4h75DApjqXYQfCWrs1a/uPXDcNmVMgzmURhCJAApnOH1
         IQKiF8eGE4T2qhGZvsSd5HKOSnKCrlrjwT6zWk4bt8cJJubewuOfLOXSDprzk2T7798j
         EXOdi2W8ongO2L3vStQwznehPnO/Ex4K34T4qqex2ow4TIjFziyeANtgWcvaKKUS8ZXR
         O60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785033468; x=1785638268;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fiy5MIwEYC79lCUdHmcSHn5jPUbbQsIQK1Ub38H4x78=;
        b=NDb/qD7DsFMcu//svPBQh8KDBWsffG5R4oR7Oe2ABJEecwQrUWVGtNNJhN20/nZdOz
         V/o11s/xETuDUQu1jnrOcU5S/tBnp6af4jX/Uv9GtuCiL8dYltxF3nnXDbpTHDI0p9Ye
         2CMC0K5jFWgJOs4rQcIk7mCl0IX68RkGHNSVZQlTKqdu/1xTODMVw5YfuBZzeDpA3u8z
         amHhxtTp8XdvU/8IZ/yV9n29+HN0FCjL7TWyIRlo8h0sbT7X7oMy0po8JYq4Afvl7CsI
         C+SggrBdGuq/yi7S/KLoApvVyVg+2m3kyu/b9IFser6mwt127K/mh12tq1JEQc0pLxz0
         POqw==
X-Forwarded-Encrypted: i=1; AHgh+Rr06IBM+p2H93a688it3PDjNUre2hlcY2mg1jOm405Yuwi0S4+n5ofrdrSVJMBqW/Jr4vT6wLh/KcyrENo7mw4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQnoKCIQ3N9wqJg3M+eTTSz2HyaEbzD7z8NL0jgKAbvUFw6Iga
	UsA3LlESd6qjZlY4xvW1KNcrjDXZ47VC4OsTL5zgHj4AtcjHLJMVASet
X-Gm-Gg: AR+sD1214D7N6UOeaLAWNxJ58BrRgf+awmz/g/JJ7nex8IJETUzSgc8gBTucIeE/+5I
	Jgse/Bqff4fBM2vObvTNVYp2YAR5OY1UUvxlnqkFeCaXgS94VsHly0hhV1DrmJp8OyXgI2nilbE
	RsO0mWlBK9jdcchopTlXAdixKlFbS46741Oq08lMO+RoV3vecNGHderEXi0AJTCHGz0tqM7OwHE
	WfxCIkSiqhCsFIlpUB9kaaQh+UqjpCitfkeU2yTWY9X3PIG89opzyG7rrRBQEbTWoo2Bcqjj362
	uJjii4+Oqf+SGtPO6vKEhJn2ciIuJZ5kKIiQzRvc5HZs7xbi8GeVH0LTwrKashYzkR0SZzEUiSl
	9HDKnwohXalbo4bmsdM2H3ffBh3KZX/VgLBAk4EcPZk+DMuYT+fl0L1fEKsjqMvjpzLfqUGfbtk
	UnyWCw/lQ=
X-Received: by 2002:a05:6808:d4b:b0:495:9870:2b25 with SMTP id 5614622812f47-4ab6a1fe862mr3734325b6e.34.1785033468220;
        Sat, 25 Jul 2026 19:37:48 -0700 (PDT)
Received: from gmail.com ([108.243.219.47])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ab0c7a1912sm8353622b6e.2.2026.07.25.19.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 19:37:47 -0700 (PDT)
Date: Sat, 25 Jul 2026 21:37:44 -0500
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: Doug Anderson <dianders@chromium.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] drm/panel: tdo-tl070wsh30: Use mipi_dsi_*_multi()
 functions
Message-ID: <amU_GppAwt3XXPX-@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725170134.035EB1F000E9@smtp.kernel.org>

On Sat, Jul 25, 2026 at 05:01:33PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Does returning early here on a DSI transmission error leave the panel in an
> unrecoverable state?
>
> Because panel->prepared is never set to false on error, a subsequent call
> to drm_panel_prepare() will immediately return 0 without re-running the
> hardware initialization sequence, leaving the display permanently blank
> until a system reboot.
>
> Could we unconditionally disable the regulator and return 0 here to ensure
> the state machine remains synchronized, even if there are DSI errors?

Agreed, and this is the alternative I raised below the cut in this
patch.

Unless anyone objects, I will send a v2 that disables the regulator
unconditionally and returns 0.

Sashiko AI review: https://sashiko.dev/#/patchset/20260725-mipi-dsi-tl070wsh30-multi-v1-1-69160b83982e@gmail.com?part=1

-- 
Thanks,
Akash
