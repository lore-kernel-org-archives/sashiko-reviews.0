Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE443DDDC4
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 07:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138838; cv=none; b=oneDtjfN4L6qz1rKZ+4l8HuUXT4TnfYUaZwhUjNpustvjjJsRLsi2g0g+icYVmMqt8loyH6/nAxoYLLQISoB1Ng0A4ZdIKxcGaFk1uWiPG52GTEwyQcRwUpZTYpgtJGT2iK/Mj6wE/mIxTUBFPsWM318AXfRT+N3ZGHmRIVaHkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138838; c=relaxed/simple;
	bh=jZc5EfIVdHQBId5RYiFeAw8/NeXVTNysM3ugtxQA/EM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=KtPOtIdcuCwhpUjf8/bNogmVu0aYJqpsc2QlpopJ+mW3BXl0uM4E5qy5cM85VOqwvwQDi8jbRIrLJuMBhsXQLAb2oxcqG9xqAQXvHgpjiMh0Z9N7F7CXE1iFwe96xykeWdDHjcdEeXyb511e4GW2b+L6fXq0X3RzrB52YXnH5nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OHGywFU6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OHGywFU6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so26949105e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 00:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785138834; x=1785743634; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jZc5EfIVdHQBId5RYiFeAw8/NeXVTNysM3ugtxQA/EM=;
        b=OHGywFU67E3np7rWNifsr1lOPMC612erLMP4cvWuu101VXECgPr3AL9q2a4eBBhrfZ
         0oyrbPHvgH5F/Q7YpIF8MwT19bwqsfcuvC2woHErC8SLrcOa4oPNNDggf916TG8tK0hS
         xkQczj92RqUcoD2OhoMQXZ16696DImkYIHCn7RrwY1LrsQIWdXaijG/FORM+v9eR6M4c
         t2WJfukWVpnfMVcoQDrGcSgxUCLSX2kan1Jayi0+KfFP8sQ1qPMRYTezfqazIDSDkc2k
         RZmjc8tPeEzbsfaB7xbNUlKxoJFu9EVA5v7AexMNp0xpIkyUMeTtp2BnefufsABb/Yom
         UODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138834; x=1785743634;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZc5EfIVdHQBId5RYiFeAw8/NeXVTNysM3ugtxQA/EM=;
        b=GhiFW4pOpVAKkXYhKVtmCVydT+sbAB8bRsMyfVhEmsWqZRMkYgmMnOzidBrILhkP+n
         1+3cuiDEsJmhFq6wj+touepRuUo6i8X8Q7G1qVwi8DEe2H2g+y8nP8DyZFYDQx5VHXYo
         Prnze/aIip8FO8EkKmecNeUlxXB49lLd+ehL+eqqcYb6koEbkSRpipidYPwSrUfl+0p/
         I2nkhr7Kz0uImw7JAAczuu9J9CiWpNsxZHQQZfye6asedhOlbye6GTw5bMci15GT4GiA
         D4ut2nOHCnRhkowsFspPP1IcgRs5oO6l8RHE+lFapK3ypDztV3yzWnXlgGN88DOY0bly
         nhBg==
X-Gm-Message-State: AOJu0YynVJlF300NfYO2vNtVIrsMGiYRc+20gHhZRIuqPkexFWHJGtWp
	QBMmSnyDxoMcGeqkk6EU9z66apg6/gDjP9qN7EsqSZFWbYvLfoxurfBNJ3XoolRNRW6CvtxxaHP
	qUMkWiyGQ/A==
X-Gm-Gg: AR+sD10KKZBxffVE4XDerf5F25U03OIKHAsIzOsMAziqjfWzAwRTeddfn5SDsJMGZFM
	xSTIZNX0i6TgIazxYt8CPqv37qbHZ9x6RnebQgLgO8MK8ngAgAAgOqQzox/Gyyl4L5ErL/VZ0p6
	rBmQ9eUqBE4sfUVIx+QFcXK9bmOo53ceed0uNmagEawoMWG0Tp82TUb069cKVTvohzVqOMM/iUk
	yzRv5H0Bj0fbfntANioAvOZ7Payx7KCGP3fSqNQMqYa0F3CyNlIcCjGRKyJMf0taybtiaKc9yKh
	cxdal9fRMxT/ICAI3A1nnE7t4CgOb2kytTL8jOX+kiNQlFXEYBlMFLNsCA3Cqu7uLfKCu2ukHh6
	9JeG0Z4iZwP/P/uJjRDbfp3wZsLkwV0makq1O599fxpIhZxWeC2EzT0LaY+uhWkM2dPq/f+/Dhb
	nArm0eqn5zJldHEMBm/mubEZ01bglimiOLtoaaY3SCb1wKV6skmzQZpgX8
X-Received: by 2002:a05:600c:a086:b0:495:7a04:b006 with SMTP id 5b1f17b1804b1-496b56e6e44mr97968375e9.8.1785138834002;
        Mon, 27 Jul 2026 00:53:54 -0700 (PDT)
Received: from localhost (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm229193555e9.11.2026.07.27.00.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 00:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 09:53:52 +0200
Message-Id: <DK96WIHYRFSG.1E1TNF8OW6SU0@baylibre.com>
Subject: Re: [PATCH v2 2/2] serial: 8250_mtk: honor DT serial aliases
Cc: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Carlo Caione" <ccaione@baylibre.com>
From: "Carlo Caione" <ccaione@baylibre.com>
X-Mailer: aerc 0.21.0
References: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com> <20260727-ccaione-genio-serial-aliases-v2-2-0f2ae41a8e89@baylibre.com> <20260727075153.4F9111F000E9@smtp.kernel.org>
In-Reply-To: <20260727075153.4F9111F000E9@smtp.kernel.org>

On Mon Jul 27, 2026 at 9:51 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The driver registers the 8250 port before enabling runtime PM, v=
iolating TTY subsystem guidelines and causing circular dependencies during =
probe.
> - [High] An integer overflow in baud rate calculation can cause a divide-=
by-zero kernel panic and incorrect fractional divisor calculations.

[...]
> [Severity: High]
> This is a pre-existing issue, but while looking at mtk8250_probe(), I not=
iced

[...]
> [Severity: High]
> This is another pre-existing issue, but I noticed a potential integer ove=
rflow

This is annoying. I'm NOT fixing pre-existing issue. There will always
be pre-existing issue.

--
Carlo Caione
