Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4279D47884D
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 13:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714927; cv=none; b=pzPZwNeQhhgz11T/BzGU0OabTik6KmJdk8j1MCyvSpcNYDp0WrBECcrVk+0E2fHfP9z8Rnafev7DuWgWAVfwRXUdY0vIM9SY+xE3FGjC2fWnjVUiYZiPcWGVyYYd2jzR27OsdScROGRccytsz6/pINfxDNtrS567T47pKLSLmdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714927; c=relaxed/simple;
	bh=Ighuvc8zNEvdMdTBj2MgkY+Ru3uT8BFEEQGLZyHwDyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lVipiFjQv0M9K0MVZLSlh8xh6S8jcF6eMAsFLVgGct96DjqJ+qYO97KMm41gF3syEb3tEOrfgl5LWICgpzHl1qN+g7xMM5o1twbpTTM/FlkqyD/LCqjBNa5oDEtka3jlf8h0Kiu29cnRAOQaywvwzZvD+q2PoA1XsME2BTjrOtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bSsFjFRY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bSsFjFRY"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4980dc26022so11104245e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 06:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786714923; x=1787319723; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xhKuc7koDaTER66hHC21DLwLn/weA2lcrprNlj91Qto=;
        b=bSsFjFRY4J3lwo2Jr7zxuMZ2PLVJeiz0OWuV+G9FOeXIoikJyrZFWpLlDHSn9J79Df
         9GwVe/0by6gsT8vquFjDyeMMH9bUQMvj6jMfbeRaqO3P4S6fIC2bqo9EwwkdoEdVRaNe
         5FBEGeeKFQOHYbJrjF5TlzNNk+fakSsjCWKV0fx76PHrveOJo52mw7quD/hPcFa5hgwv
         no19RFGRPjxoK1dTAKpUTGrlle7X/hKM4n9wB/b93vJNXtDXDmi+xoR0ISS5MlCLXQKL
         xDWp72w2C3GF9sLyTRhp/IAZIiRUlnXRY3QwbEYrgy5ssM3800lS3cG8ZyHnmmf0lt/J
         tgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714923; x=1787319723;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xhKuc7koDaTER66hHC21DLwLn/weA2lcrprNlj91Qto=;
        b=ppjFxOq+svdzuTenzBqnfv8vQqSjdNOU1flo4j59aoJyw7TVzy0yuG68+GwlqtqtG0
         RHArahPS0YM8bUht9CYaTbYz8lD2bKlwmPOdL1497TT5koKPipdRzmf0Xbzow/iWZcmB
         nRyJefyryQTgEjjCgBKFUVafgt0s3pbV37BNeTsqtfD3Nj2w1d6uMyvR3S15SgM1U75c
         uBfPhtfgU8lFDHW51fi+I7Nrco+E3Svgcc6V6Uwo/BIn9p5pYTGREJBOwKpbxaSOYBsb
         dGMlTH2/jkdgRsHxWBi8t9R4IWLJOAvu4qCZ8CpbXO1NJq7PtdGhNaWtoM9eKg1AlvPh
         8zmA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/EZCrHpWi5toECX4O8Zh5wrBexaYW2A2KKPFGwddziQoqpbiZkbb1Egty2QHZnb8Py26LlIAA8qzEIdNbFXo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3mlLEfNOO0ssr2Bk+EKdxXPBgbQ037f75L277ljNeLSFNVFqC
	0JMJo3+cTL/dJY/fA75WE6EMZOr8nuYOqwyEY1LJp9zy+dXVbZt8LjyEsWglsuSO2Ns=
X-Gm-Gg: AR+sD13C7jV1JGvMGqnEDhC0F+makhLYIeGenIpfVjkOijoaEleGM7h39zztK1/n4O6
	6z8GAdpPEd0UGs9iHih3Ui393QuWsJmj2i7arnxHwI+l0kRLnSKF22pDLa0XKquK4npeJaqrVBn
	704KKFsC4ex84wherpkzzadwaGd3Ss1OprPGgkHgzJpxmPrL5Wh3wGKceYzqGQrBtGlMfKR+e9J
	2dC3FrtYl2r4Ub2Pg3rhzE1DBIGNGWmK1HBJ+PvFexPNAbL4LJHeKlKnXR/81GzeLH0mSbFXBQh
	uMT0qaIXOq/1hIIoVySJKfoAqOardGAe6lMYo7YlAerksvVjXb0NVynTMBn/Z6n9bfdzl/OyHSx
	uZ0VoGAPowZrVuogFZECWk/pRuh/e+lWf6Q4hylciYfcyREz4IxB4SesEf9owlTvx79oM+n5gfV
	jsVvr37HQMZvqNwIn/0FslqTmrang0soixjahzxlCeuSQf//NBChLsah3DFUTHKAu2DEBSjA==
X-Received: by 2002:a05:600c:810a:b0:495:737a:7afe with SMTP id 5b1f17b1804b1-49987985df1mr76542075e9.15.1786714923535;
        Fri, 14 Aug 2026 06:42:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9886:6a22:ee2a:d5e1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-499899c138dsm32119835e9.8.2026.08.14.06.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:42:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-bot@kernel.org, Mark Brown <broonie@kernel.org>,
 sashiko-reviews@lists.linux.dev, robh@kernel.org, mfd@lists.linux.dev,
 conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
In-Reply-To: <20260813095600.GA1072730@google.com> (Lee Jones's message of
	"Thu, 13 Aug 2026 10:56:00 +0100")
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
	<20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
	<20260812214019.CDF921F000E9@smtp.kernel.org>
	<1jldaafmpd.fsf@starbuckisacylon.baylibre.com>
	<20260813095600.GA1072730@google.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 14 Aug 2026 15:41:59 +0200
Message-ID: <1j33wg6cpk.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On dim. 13 janv. 2008 at 11:56, Lee Jones <lee@kernel.org> wrote:

> On Thu, 13 Aug 2026, Jerome Brunet wrote:
>
>> On sam. 12 janv. 2008 at 23:40, sashiko-bot@kernel.org wrote:
>> 
>> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> > - [High] The corresponding regulator driver lacks support for
>> > `AXP318_ID`, causing the `axp20x-regulator` child device probe to fail.
>> 
>> Funny sashiko did not pick up on this when v6 was first sent. This is an
>> ordering problem. The regulator part should be applied before the mfd
>> one.
>> 
>> I could reorder here but there is not much point since the 2 changes will
>> land in different subsystems but it does bring a valid question:
>> 
>> Lee, Mark, are you OK with picking the patches indended for your
>> subsystem or would you prefer that I split the series, regulator on one
>> side, mfd on the other (with a dep on the regulator one, of course) ?
>
> Does this break existing devices or simply delay support for this new one?

Existing device are fine and untouched.

I've just checked and if someone tried to run without PATCH 5 (regulators),
the main axp driver loads fine but the regulator part gives this

axp20x-regulator axp20x-regulator.0: Unsupported AXP variant: 8

Seems sane enough if the regulator part is not present (and no board
using it has landed yet)

To completly avoid this, the ID would need to be in its own patch,
then the regulators, finally the MFD. It seems like an unecessary churn
but I can do that if you prefer.

-- 
Jerome
