Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E4E23C8AE
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 16:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782319734; cv=pass; b=fYBZK0U39EOSYCP39eiUrfsT/yLkfXMGzZKEKrBl7TSQGSvCbomnJctfmFtzVcZo8aXMGnOXmVPU4ueR+lD8ar5/MCL+o8qUADoUvLI5RZTQzrEBIuPUaUU8iCt8NS7QnpUmI6MQMAH0NHXZZgmvqdbub1DhPiRUgA3rGI4ZMJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782319734; c=relaxed/simple;
	bh=tUd9MSOf6Gpfnj/DjRgEetNk24cj0Ww3vsmnBOJTSdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snJMCfpEektA7eAQWYU4UUwMkfOui6EedVsb0Z6gm2TmF1F8dIpI+ohTylAxmPZ3A9/gaksqeDChOtjjrEAxo2z4IKGc2VMklFHe1n9JDvnGxvDtjYUdq5VTZxcDIxEovoNxeslCa9U9Ot3XYZfHJFKYbqc5BSCh9c7QVZ1K2LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C287PPDE; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C287PPDE"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c7f11150cfso3074615ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 09:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782319732; cv=none;
        d=google.com; s=arc-20240605;
        b=XG8x8Eu2xS1cpKvCZ41fSPXDLyrejELoN3zdaolp3K0vVROBBOrnqEjdT6B4x98Cdi
         j3YlQlpUzaENQYSQ/2LTJhUaAWmyZETpxbP9FrxMCZwPtjEJBlOkS2qp4oa9w87N7Pjs
         xpG/gWkNktwG73AM4DRpmJpTsNC6wDXJl5S5S6Dg720XIwDHb6p9fWM+AgOKUkqmKW9z
         tLJN3hGofqke74JMfLN+fxfP/IMDeDyEaKfPPs7GJovo9Be3E1XthyfIlD8Ohe+hgF7L
         N875PCWxuAx+KSaMkhcV5TYS5rZqlr2n7Uzy9GdET2uFZvCJ3dZabLqB5q7/csDgbjzp
         5zNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Eqa0a7zsYCqL0jsMUMAnI+leBn+5NE0HEyi9TIA0TpY=;
        fh=R7ITYP0dP+GTNq1raVt0oZn7mapsqsrv19YFdFDXlX0=;
        b=Nnkw8K8f6Qm1BQChGJooAzuFvJ5EI/REHM+hxRrKZxMciX0+sbhoNN35xDRZWEQYwE
         spHxXHjFwjdxd7Hl//kU4WFZlxc84LojJ9Ep1G/IHnpsrLB7R66drgyjRbSfyhr/p6Xt
         1TFIFrN8BQj94FGS7Nqwou/r8v1HH14JiArBkw5eSgvpU1hMlsA7ZNMGJ81yM6tN7B6Q
         q2Wv7p991uWMP+UYjB3DXuyVHpTTk2BI7zjm9nmd5AstnbTW6RlWa5voFr1cVnVVOmp+
         Y4d7odSKGHloksV3+yBT5U4+kC/SLFZorqpNdJANLAEseY7P1ALTH8k09jS2B1hsrBhF
         xFxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782319732; x=1782924532; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eqa0a7zsYCqL0jsMUMAnI+leBn+5NE0HEyi9TIA0TpY=;
        b=C287PPDEkHIXWE1JYMSIHqap+Xd50u/A+xczTJ+NozIsuAoFhHxXhRBUdKVDyPMeDr
         xeHGL3vyfE3hDVcXm46wUgA8PzEYZMOzwNR95PGQvft5kV2Qox/lYx5paMnhlSmQMULB
         HLbp7gusjAFK97F9GtwhGcAFM78NgRAx9IjpTlW5zclMx1mCwfP8fX2Y5l5j9a0My8pR
         5RpFbVm6gDPEH0x8Lk2ZZqkUmx97qoFc8xpMW7+8fDKVsqBh7L3fTQ6fV4TDOyiUIuJk
         wqYF2ygHWcNs+rsuXRxBaTqtfPrNNFHsMvT+XTbMaItM5OZ9c+qWFDjcBzzr/Q2jo8Ap
         S4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782319732; x=1782924532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eqa0a7zsYCqL0jsMUMAnI+leBn+5NE0HEyi9TIA0TpY=;
        b=PGPd0cOx/LI+tltpiiMAxfXF+kdLKQ0/x+iPJBC0RYFM+royZmvoy9xVm+hsh2Vnpy
         KhQRX/U99omnlfcCrtiUo/UhDj3lHjTD6erxPtQ8evAfYhkwEEqK7S5zLMv0dnSHwlMf
         Fp0VEbXCtzVEP4flOzV7mQPTExkP5mCgAcB+TPDGhRgB9/RbQMzQSYkxb8VQf/9OUqnU
         4qSRtxBeVEuD9/7vVy2TVW9ie973yecDex8+H9XjfCoKCM1yYpX+XM3TQGCQf9y+K3yN
         TQXITfKAlMiAfkuR3g7jS/GEUQ4TNJ8knEl3remdhlJjN28QT9kq1aNcg2VCYyE0ictg
         RTAw==
X-Gm-Message-State: AOJu0YzToL4a7YvnmDJwosxbsLnOtN+FCExp+dBVtrbnsGw5F8er2HK1
	jquaxEpztY+2G0uSKwH4RHsRIQwbJx4xgQCftym/yMdI91/hasN04YED3cFo2bB4RRwbqGFJWBp
	NXP766IPhMLr6gdTTlEoMXx+PUXHfNG49Gb7yMoRmOg==
X-Gm-Gg: AfdE7cmhh5QrZ5EzYS3pJNnHl+qzarrqw2UI9yxrANkoa1UdVV1JHqeSjsGmV1v2MQz
	rLAYyvnj3wlyuzWR+bzw/rkGVFiLPgmwPWTnw2Gooe184nhsPotMxSC18jo7Rdc+LywVPlfHo0I
	ER0RZuxe4gT7quAlUHEv6dFLy7uiAQ9YE9QELyNLExygb/7Rq/Li67inDRjh9Lws00uJ5XG/ly8
	SiCC2eUJ0kS7YGqDw6vZ3H1h9kK09nPbeQqZXQmiGxWnH3ETkDBOAXAmWz8efZtb4XohJmNbJRs
	Mkf10uhiR/uncoDNo0Z1bLdt364a51XKWgJYR9LEM90/8QkOWOHbYx4C1WBwttn/AGA8t5ssCAJ
	V9+36+bmkhZ1A
X-Received: by 2002:a17:903:1aad:b0:2c1:ef9:4516 with SMTP id
 d9443c01a7336-2c7e15c5297mr43674665ad.35.1782319732029; Wed, 24 Jun 2026
 09:48:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624155421.211626-1-nishidafmly@gmail.com>
 <20260624155421.211626-5-nishidafmly@gmail.com> <20260624160331.9C5F51F000E9@smtp.kernel.org>
In-Reply-To: <20260624160331.9C5F51F000E9@smtp.kernel.org>
From: Hiroshi Nishida <nishidafmly@gmail.com>
Date: Wed, 24 Jun 2026 09:48:41 -0700
X-Gm-Features: AVVi8Cc7jSMc1yHpFFYbnDbaOM6sh9UWwBeIwtrsGUnSAeV1VUeKclqRIYl7iAU
Message-ID: <CAE1ksKRGv8SVTuSh80L5VLs_O-+jhnSvnLi7fkLRT1g-HW3sZg@mail.gmail.com>
Subject: Re: [PATCH 4/5] md: use sector_t for recovery_active in status_resync()
To: sashiko-reviews@lists.linux.dev
Cc: yukuai@fygo.io, linux-raid@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> [Medium] mddev->recovery_active is a standard atomic_t, not "sector-typed=
";
> changing the local to sector_t doesn't prevent narrowing.

You're right -- mddev->recovery_active is an atomic_t and
atomic_read() returns int, so there's nothing wider to narrow; the
int->sector_t conversion just moves to the assignment.
The change is only a type-consistency tidy (the local is used solely
with the sector_t curr_mark_cnt/resync_mark_cnt), not a narrowing fix.
I'll reword the commit message in v2 accordingly and drop the
"sector-typed atomic"/"narrows" wording.


2026=E5=B9=B46=E6=9C=8824=E6=97=A5(=E6=B0=B4) 9:03 <sashiko-bot@kernel.org>=
:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The commit message falsely claims `mddev->recovery_active` is =
a 'sector-typed atomic' and that declaring a local variable as `int` 'needl=
essly narrows it', but the structure field remains a standard 32-bit `atomi=
c_t`.
> --
>
> commit 7ec77a6b233ce4d151f7fc723e5f312b20b4ac92
> Author: Hiroshi Nishida <nishidafmly@gmail.com>
>
> md: use sector_t for recovery_active in status_resync()
>
> This commit changes the local variable recovery_active in status_resync()
> from int to sector_t. The commit message states this is to match the type
> of mddev->recovery_active and avoid needlessly narrowing the value.
>
> > recovery_active holds a sector count read from the sector-typed atomic
> > mddev->recovery_active and is then combined with the sector_t values
> > curr_mark_cnt and resync_mark_cnt. Declaring it as a plain int needless=
ly
> > narrows it and mixes signedness into sector_t arithmetic; declare it
> > sector_t to match.
>
> [Severity: Medium]
> Is this description accurate? Looking at struct mddev in drivers/md/md.h,
> recovery_active is defined as a standard atomic_t:
>
> drivers/md/md.h:struct mddev {
>     ...
>     atomic_t recovery_active;
>     ...
> }
>
> Since atomic_t is a 32-bit signed integer, and atomic_read() returns an i=
nt,
> does changing this local variable to sector_t actually prevent narrowing?=
 The
> implicit cast from int to sector_t will now simply happen at assignment
> rather than during the arithmetic operations.
>
> Could the commit message be updated to reflect that mddev->recovery_activ=
e
> is a standard atomic_t, rather than a "sector-typed atomic"?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624155421.21=
1626-1-nishidafmly@gmail.com?part=3D4



--=20
Hiroshi Nishida
nishidafmly@gmail.com
