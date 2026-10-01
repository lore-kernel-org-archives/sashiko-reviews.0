Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A0E19D8BC
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 14:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863446; cv=pass; b=iBEPh3ndyYlsZ2wNfUOlnybpPBnbp8McdOgUv2xta0YU/dAtbXlHG3rB7kGy2d1zZV82Ul9LdJXy9KOuatNNo99j3azgUVYuK3BBeB17gTX2Wes7ehdTDFeC3f8GqBTqELRzCpP6CWNEhFoP+MqtMD9bpzALMmLdfE9EaH8JrgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863446; c=relaxed/simple;
	bh=U9jLK7/wc7B6mGa6+VCwGx4Ieg2jj91kEAwv06rg/rQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKCzPPEStgBkv4XUxG026KQw5J2MOkTRKbAh1cGIEKUWFOhJGGnETuN5kKNBirLNfUIk208MI1JZY/vsbzVNzkZvRrgCXHY7lUsYDOtt2jxaa4FLFBzmEEGyYII+qb95BB9yIXeBCDzL8fAkvDWw6ABZSIz/pzP3AvNz98J0VpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MebMxh2a; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MebMxh2a"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a7756096e7so19279991fa.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 07:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790863442; cv=none;
        d=google.com; s=arc-20260327;
        b=m2l7ebtUgjHv9RQVXl9sHIuqgF48x2vRn1P8u+O8FAbaA9DuU1FR3p7T/anvi3a1IW
         CncQjcvoF5yB0Q3Lt2w0Igo5pEMfm6LPGhTGpMHbTHQYjMTrrd8SBnJXNB143K2V5Ovy
         Q+VifwsPVbdJ9Z+TMUx0EJv8zyXl2qud395O0gjkAgAFp4G0n/tf9LMIYLJU/JyTPUkp
         hIL6ZlHxrGjcyaKvk9lGzQX0uEDJYldbQ5RMp+upU9EuHYK8t4ARrqvoU9FRCsmx3cAx
         AdvFihQGsYehAHsnV65dKnAVenBAEz457j33cXUSd+xZV35VHLtNF9CU9XB49SFDrod9
         /xOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U9jLK7/wc7B6mGa6+VCwGx4Ieg2jj91kEAwv06rg/rQ=;
        fh=oxqvzzyL6o02JsJSzbdpVLalJy797tM5dI6XYPcNd1M=;
        b=P4lvftdXhuwhrs8hfuw1eDZke4PSZNNbaFf8RvQY3aeAkwrrznTIXv/thM8jVAXmWy
         kjc4lOQSYTWtxIoMFby50uV4pbXWWJcxX9IRBNQBopfphsQr0bB3RR8tXiwuB84CDZG6
         yAr7iUhUsURNAjxDIDF1AChmXGYPVbHI8K7ErvhZegPWSzzW+11ifOYpKFveQhdin5Mb
         ETj4cEQKpUhBRrV3yX+8kI8kjLWhpuaHtgUzI9sjsmu/+PPONf6Hm1/GJ//yuxA4Blws
         lEJjlj0R0Ex1UGPwlHgWnbp/5fkhznNFh1Axq3WSdHlcruLuv5/FpoGKQvWPHQoYo0jX
         PhPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790863442; x=1791468242; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U9jLK7/wc7B6mGa6+VCwGx4Ieg2jj91kEAwv06rg/rQ=;
        b=MebMxh2a/2AaLxNS1zUbDK8TpR4UW0JuYtFQa8YmlCFDytkeiK4RNDCFDYf7iJIQul
         HWdhYVpupgAbznZZEbE9BIvEC9N8RIiJaEOB684SrQ+ieI74jEjv6OiOV3pxaDlyddcP
         OmX/6xW5X9HyePv9rzceqkHSosub5ozK5cntlu0cO0q0IMZFunDSMC0wmzzrIZqho/Ex
         I8FutnZRZjW6ag7E29mExmXRK+IYRKlXkTmyUyh5V37triE8j8hZ8+qdU4Ytkl8nr4pV
         kfuK79PdGK+z7Mo1RNWG37OGcgxixa00pBZkDZoNXRXWv6AZuM1s9RXeWQO8ov8eh99Z
         nduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790863442; x=1791468242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9jLK7/wc7B6mGa6+VCwGx4Ieg2jj91kEAwv06rg/rQ=;
        b=PckDB5doFaWlWHbZeHweHV3WvqYSm28Ou+0s9KwkL6fOvWiHvaaPJIVhiAC5doRjZV
         0CGdcOQcGeZ2lAVQxo/IgIc46F0qNRWRjhOb5ZODh24uJW4hR0fiAhXQGtpTsBfFTzSX
         mNpxpTWGkvznfZ7uX3EVsnTKdKRu80FbRGHknT5L4AOGYai0GzkGIYTyQXSr7kSRkczA
         KpSsik1k1CxFiUCk0bZbDxJadmcCzDY8wAe30MXkp2vD9gotetaCK3+kpYyWhvsHWV5U
         ZK130oqLH1l/qTB2+eMP1iHqJz9NpouTyo8zMy/lmbVSYT8c5QGjUviTp/9zPhEUGEo0
         QNFQ==
X-Forwarded-Encrypted: i=1; AKwUvByndPERj8R6WT/6lpjM2cYQ7WVxPhbjvSf5OtbgG3Kh3FB3bU/pY1DadQmTpoxfR2GJT14fBS/y+uE1H/6FS8M=@lists.linux.dev
X-Gm-Message-State: AFq9FYIKkj8+j4G/ZN0Yh1citCq4qEm6BJ9BWuMjJygs1xuRF9z9J25z
	OGrB7KnQF8S2Rydk/GZrsbS03eRFiHYUl7sc/Tvwhp9nbfrAtA/40mGwozhrAMwfBQN3+1HkG0s
	0imB7VZHbEyySjnPb8JsD2bGdYnuUL8g=
X-Gm-Gg: AYBFou3JQNXuPFJvZnO5lCuxSoH0PIXLdxQsbSyOWcyChL1C922YWzxF4J6E1+mDwbN
	Xg8RYuGWoxDxy4Upzl99nTvV2UQ7LRkV2rOkJ95sJQT6shI5rSWhuWC9oSOUSn0Ih7vhkcPxUXY
	NQ5jLbu4QUFAaWO9t+2dyI50iVBr68QftaqQv3Ndjx2NCw7PolQB1HuRFvxC0BYsQilkFIsxg3U
	Qnzb16Ecdz4rHbJIkUZpTvP7NzexKFDleeuBPuO8PvBkTQW4WCasp7Gbe0LovRRlu2k7L4aGx6N
	iztxVaH2deXjpfkfxliRIpXndD1gr2MNyxLlQHX7SBblomC8kGeUAhgoIhQCBPHHt6KkDszpDZd
	2P3M0dHdQi6Oa6Pkvrp0daBFFUZjtS/7FyDbZSODfQ9sEDw9oW9J/8oCd13+qaZi212OoCEtPC7
	/R9X3m+eUVZ8TflnUl3yRDbKqrS9PycYrQoHkjDb2L
X-Received: by 2002:a05:651c:2121:b0:3a6:27ba:be0b with SMTP id
 38308e7fff4ca-3a77928dc6cmr16119671fa.20.1790863442038; Thu, 01 Oct 2026
 07:04:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001133736.802604-1-tzimmermann@suse.de>
In-Reply-To: <20261001133736.802604-1-tzimmermann@suse.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 Oct 2026 17:03:25 +0300
X-Gm-Features: AclHuK-MGGGgGsa7XTJEX30X4AH0rHlA77AtOEFwmZmXzvdKsC2XJRDqSMsLZSA
Message-ID: <CAHp75Vf80MzmPvOK7Qpy99dxoKY1JSiJWM6KUVswoO12LgtuBw@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: Remove simple-display pipe
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, decui@microsoft.com, longli@microsoft.com, 
	ssengar@linux.microsoft.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 4:37=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> There are no drivers using struct drm_simple_display_pipe left. Remove
> the related helpers from DRM and clear any TODO items. Hyperv-drm needs
> a minor fix to include some additonal headers.

additional

...

Makes a lot of sense,
Reviewed-by: Andy Shevchenko <andy@kernel.org>
with the spelling fix in the patch 2/2.

--=20
With Best Regards,
Andy Shevchenko
