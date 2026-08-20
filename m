Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB4039449C
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 18:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787251433; cv=pass; b=YxHrc/SYSSqOnUy26CaEgz28dkeNTS1m0eRE9Bl90THbWVRMCEN4S0OUaqFyC3EAdw9twIcqrkVNbiRGqqLPNhkB70xSIXPRhiEKh17E8GGyZqfMU3oBHepSqgkaVEw/jflRhXwUKMmKPsTOEUEWiDmIKwPhALWwsnwFc+uCQtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787251433; c=relaxed/simple;
	bh=Eokv7VYq8/Jopa4y9Fd2HUxgAgf/fH9R5m6fsZbPKyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRjL8lfhUGtik/HgARgI//eepJgipnMxJdF0S21usaHkZ9y0SZo+TmJbnWY+SDPFUK52bMkpYrGv0pfqUNTKXWR0SW1GioaSCtCgMU6NKc98ZQd0H9GMBRmy9WlEHjFGLZ3WCyUdNz+G7PI4eefVc0stfeyC2AAtg9AM/L1gIZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=baTXM8Cm; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baTXM8Cm"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-499b02fc590so1230755e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 11:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787251431; cv=none;
        d=google.com; s=arc-20260327;
        b=i/aQOCVse58xJAxHpRTDYtvu10bcWnxKGcwndXswCnw/kLU/sJpLVoADUNISEnUTQg
         JtsK6Lu7pBXrgwbZxdFh3eZOjMuuLaybjhBTJy9vm6l2GusY4IpkDjLJ5Un70eY1++Y4
         2lkbkilhXfon+gG+D6cOJ1XQYX8bziV7Pc5hCVvICTGbiTzD8hzBtsksZnuarB3FjuHQ
         DVEz8Xl+eFKhwDkPfvX8ZBz4qsM4Ua7wd+INbR41W7NGPHp+1rlKRStFR/qidU9vMMpa
         hYs9JU0BczicveIKQkEJQHSqeYRAlrIxl20NwbOi9uyD7xPHQcpWuEx20Bv8L14cQs87
         orfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Eokv7VYq8/Jopa4y9Fd2HUxgAgf/fH9R5m6fsZbPKyc=;
        fh=ufhq17K8SHFW6jkuT/vGKJNPDbJRL2tWbiI2//5X5Tc=;
        b=S3vCw86sqeMp47F5LQrYGUN+w1RcU+7hvfL5vPofJHpYJZuwF3XrXevKkEBrwllulU
         BJGRdw5vCU7xn/wk0dH75mWTbaJqjh3pcWF9mmOFX2mU2f/92STclGgE2yGTCQYtlzgf
         +zrLS/w5phdiTS14cHac+iyz5Khor2JuZuQ6iGafbhMt5urXcBW+Idf9qf4vp6edqx05
         pl6Aw+hjxY6VsUoTgb/dgPTdrCfEd5q1JWKzRtj8cgFefG7244xQvTNkz6K82Q0H6tjd
         FTODpcO0Q0qDDEhNF+thaph+BVvAqssLAEM340ds7sxrp1zPmkEL5Z413DtoyTNSJ6XB
         HEsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787251431; x=1787856231; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eokv7VYq8/Jopa4y9Fd2HUxgAgf/fH9R5m6fsZbPKyc=;
        b=baTXM8CmggYjN99D0wCtwcjWzmlgETYHk1GdarJF9+kmB75eV7+AsYZNfA/J+su+vl
         Rr/qG0aq8wvLSeVnjqcf+EqRwGDERVgG89uVNlz7YEKR2vH0uXBsUK8FM/raCkwdnpMX
         gq0OZOl8jQvOebFJ/tvB9EY0IShUVa86at7xaRk5Ri5dqG7e510dej8RpYNdyws4ckU6
         nqFCXkrzAZJDkRTLVdJUeW7w0WSrXpqK0Hm2rYGbE3WXUg5xLDf7GbAKPhrDeldM6kfC
         7bBQAsbvJW2HuNS01BtGEhrC4wi1nlUwEmF9rQpoLcxJBNRtTHlTIo9i5+bxl4kmccmM
         Rorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787251431; x=1787856231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eokv7VYq8/Jopa4y9Fd2HUxgAgf/fH9R5m6fsZbPKyc=;
        b=YsEz0C+Bp11xwkCi/ubmOOoA8e0RQUdQsHD1xVfSQcZdVMnpHVeUlPlxCreRYy2uZ1
         2i2q8AGh9rMm4lGbsWGBmmGXKalSxFZvrYn7MtG+A0luH9yUqe4LpGOvem0gV57gEUvt
         JUbnXUUwlMzYV/nvdhzjrM8zojO1MUODyGwCxW827JBCeaaK8baFErmv0GfRLW9rRJtB
         qbjoYUhPoU4Arux9fb4BGeig0IIUAqq0SBH0RRedT1bEbNjvyH4F52bfdyTGUFL+xO/w
         3kHfS9h9tNQHDJBxRxh/ULNvI8v5OhaA345fj9CPvV221TByc+MUkK143aDkHe5ST6mh
         mnKw==
X-Gm-Message-State: AOJu0Yw4N0GFgyTQ3tPWgi07lB7IGkRCvBTGUnbKvxkPWHEMhI5O5Vwn
	U7bVUclR0jJYCbW7pb0Km0wz12GxtY4Anqu4aUN9AJgW/1uDWrOTj32hhJyt4W5+J7/e5qQxfpN
	CLx7WgF8LMBfW4dSk3k6+2bXQCPogZ4UtF4Pi
X-Gm-Gg: AR+sD10Nd7J0S3uVJZcp/50qZc8sQ7BE5PuuqVdJ0tqgwWjbXmuV+0miUGtD6uh25qX
	MII+hj/iadFNBWL3YT3fucjqCkfuhSJmuwIe1MvDxXCUMynfa4FCdsFtGT/uTowbXpGwlFFyLxy
	bVdpEOcCkeWi4viGfnvYdFDIO7zu57nudteeeyl8p6aReJGOn6h/RukPHrQpDWFSLHHcGT7UKIT
	8ZHtaXgoPw8rfE9LBjZNnt5AC6+lVRm7MGovCvoCSXlDkrKm4wRyrQ/cYnEleiHJGpu/WGEMpyc
	wsgNvBObPLlukxcbJWjlsnjtsBp8ksA+rcLZ8kfJgvFlykpMYLIDF35iOD0JGbbwsLo4cTIbij8
	CidDYdE4D9FmtFByKRoiOX8B2/4JmxQ==
X-Received: by 2002:a05:600c:8b70:b0:499:593b:a15b with SMTP id
 5b1f17b1804b1-499b82f4a2dmr21862895e9.1.1787251430709; Thu, 20 Aug 2026
 11:43:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819103926.2136712-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819105139.4AB9F1F000E9@smtp.kernel.org> <aoWqqoOpIukOZBFo@shikoro>
In-Reply-To: <aoWqqoOpIukOZBFo@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 19:43:24 +0100
X-Gm-Features: AcwNN1V5YPd0FACE_Z1Y0Z80YTfEbDGtlA7AnJxcCLtu81DRXLIHN4JWJGjLB_c
Message-ID: <CA+V-a8sTK-6Tw36XN1NboyPx9RbP38x_7DrMUL6DiCqi6GxXqg@mail.gmail.com>
Subject: Re: [PATCH v4 08/15] rtc: rzn1: Use pm_runtime_put_sync() in rzn1_rtc_disable_hardware()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, robh@kernel.org, linux-rtc@vger.kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Aug 19, 2026 at 2:07=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > [Severity: Medium]
> > This is a pre-existing issue, but while reviewing this file I noticed a
> > potential race condition in rzn1_rtc_set_alarm() that could lead to
> > spurious hardware interrupts and lockless torn reads of rtc->tm_alarm.
>
> Same issue as before? Just disable the irq before updating the regs?
>
Ack.

Cheers,
Prabhakar
