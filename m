Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1B7440A28
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 15:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512707; cv=none; b=MaFcGIDLUpU7JU3FQSp6r66yc+PmA1XYVXxlmGDeU/J5+a87/0f6JDPSnq2CYBln7gonoXlKK0EN3jFdY8H7SoLqbPV1lBkoNq3FnJKmLX+xZIcHMiA/uGg5PTnONlpRuN0a4TLZpNve3FKApvRPxpWy5EqiRogvI/CzViffOlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512707; c=relaxed/simple;
	bh=TvPHrb4kWESv6ljQE15XclowJ50QMR0msenBqr0/6dU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ek3AAxHKzN2H8CBoFcwC58Hoq8n3A+7fOezZ9UoTcgiz0vdNNCxtbESspK3tx9nk/+NPgMVBndC3V9x7RNwUgJ/2hUVfJE6K/k5kglACn9lZgzekFLec40lWKi/MJNr8/ETXHCdxKG62cNGNX/HhRrsYWXd2ZKqlkgtIVc9wSjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=N4YrjAIE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="N4YrjAIE"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-472326ca506so836181f8f.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 08:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785512704; x=1786117504; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9rJ5rXiOvpazcDVxYtI/2HpVZTk/sRYzS0zDZsRFZBU=;
        b=N4YrjAIEkzCydvOKPOEmHpOD/XuFqLDehFTSRVgNtQV6y5rvYuVX+jkU5VL73MM0B0
         gMkN4GS1S4LbgToqjHYGoqXTG9kqCf780qGbUAs7KGoprA4GIPt0FP1jtKMVJUxJisU7
         CnhTt77+VwGjO306KE2OuhJusPpwvMLFPG2yH6xWV5hKTiQonobvE/RV9b1wRm1nHzJ3
         sJ4GFtfl3B9+fQEsv5tQjYmJwoOcW3PaCgUtDRMHVsyewCpsa7hknhNYkzhX8fAdOQGB
         p0AMBavpWUT/VIV7vdvBWKW4RBlKT6+w0e6qVM57G+FcXKsXR/ZGf87s/PEqTRgAFHIV
         JXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512704; x=1786117504;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9rJ5rXiOvpazcDVxYtI/2HpVZTk/sRYzS0zDZsRFZBU=;
        b=IXj/tZ/oJ7T5uEQNGSHH9LFzC7rkD2B+ZP87PNFTFSN3SXjnkS3wrX31MNyz/T7j1P
         q/GniS+SdE133QrsUd/IuFRpO9r+ISudkyjXj5oVVqJ07moUCtj6LSwHt20Ppa9t7jfr
         C7lgxciVeE2ypTUXG+6HGebBOH/5eceEUmpJkPIZ+PhWu8fDKwBQf/UuDfu4/lzPQi0l
         C6kuJ8DG6L9K+qxggy75ed4HK3CvZ9VZBDy0GDLt3aFkgL7vTbHZkioU8J2IwcrRsL+/
         6yYCkcCdD8HBgH2xz2/Wv7/pkLfu3q8s17zPSXBGayrPL/DPaCHsy8ime0h83VetIjCx
         9MgQ==
X-Gm-Message-State: AOJu0YxrbVJ2j7egklETv0Tnj3OD9h0yO9tSNTHNsvptYmxNyJHbhkeN
	fQfFV7+ezGCwxAMu1Wv2HN/ZMeMT+IEy+EhGbX5mjGwIbDTxDvCd0/AwoYriLGnbo24=
X-Gm-Gg: AR+sD109p7Ui21Z8ryozQPJ0SdEoXUZNyaBNunjIXY7qHi0lWpNqgWqJBDKf0tCl6u+
	0KOJs1JQ2vrD7ho9b3ccizpy+yHfAzc/9pI0tjZsnyk3UtzOnBWc7tnL7zqo4IW3+IzUPEV4WHn
	HUaSKIbukKi0UYkj31PURhQJ/fTzPuxCgoB1iHq6ZiKMgtT9OkBLNv2eLxfwHc0t8i3/JAI4PNx
	VwtKEtBXUITqqb/IZPnHbctzPW207RvXlFjTxDioYoQ4YJUtOK89hRxhMenBPJL3j67Jfta7eyW
	ftjV0aRuKpF+jF3sYxdnYfhIwcA7aSecZ5kVUoEA71gJU8y0p9kuz1mjjGeRZspAS3sR3XLcW3c
	7azhKJJvzCYOS85g723JKpc807vhWXQ4Z+/dzCiRLdb/Rk/GGtzeZJZnRTeyv+zRanpRbqELHzp
	FLmHsEj+j+tKBFEO5JXRfRKyQNxtLd7Zru4C6OxkDYVAA0y29C7vMdKIgrtCnvxg/UP77j
X-Received: by 2002:a05:6000:2981:10b0:47f:923c:9d92 with SMTP id ffacd0b85a97d-47fd7310ad1mr217098f8f.51.1785512704512;
        Fri, 31 Jul 2026 08:45:04 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd456a6d7sm6390446f8f.19.2026.07.31.08.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:45:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  robh@kernel.org,  conor+dt@kernel.org,
  devicetree@vger.kernel.org
Subject: Re: [PATCH v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
In-Reply-To: <20260731145301.A12671F00A3A@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 31 Jul 2026 14:53:01
	+0000")
References: <20260731-axp318-regulator-v6-0-b4e745552a35@baylibre.com>
	<20260731-axp318-regulator-v6-4-b4e745552a35@baylibre.com>
	<20260731145301.A12671F00A3A@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 31 Jul 2026 17:45:02 +0200
Message-ID: <1j5x1vxiwx.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 31 juil. 2026 at 14:53, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `axp318_cells` array defines the `axp20x-regulator` cell
> with a hard-coded ID of 1 instead of using `PLATFORM_DEVID_AUTO`, violating
> MFD subsystem guidelines.
> --
>
> --- Patch [4]: [PATCH v6 4/5] mfd: axp20x: Add support for AXP318W PMIC ---
> commit a5dbdb5469c59acc76c36e5d6f37cd6f060e0f47
> Author: Andre Przywara <andre.przywara@arm.com>
>
> mfd: axp20x: Add support for AXP318W PMIC
>
> This commit adds support for the AXP318W PMIC to the axp20x MFD core and
> I2C driver. It exposes the device's regulators and interrupts.
>
>> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
>> --- a/drivers/mfd/axp20x.c
>> +++ b/drivers/mfd/axp20x.c
> [ ... ]
>> @@ -1061,6 +1129,10 @@ static const struct mfd_cell axp313a_cells[] = {
>>  	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
>>  };
>>  
>> +static const struct mfd_cell axp318_cells[] = {
>> +	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
>
> [Severity: Medium]
> Does this hard-coded ID of 1 risk sysfs naming collisions?
>
> The MFD subsystem guidelines recommend using PLATFORM_DEVID_AUTO for
> automatic cell indexing. If multiple devices share this explicit ID, it could
> lead to duplicate device names in sysfs (e.g., axp20x-regulator.1) and
> subsequent driver load failures.

Commented multiple time on this. This is not where PLATFORM_DEVID_AUTO
would go. The driver uses PLATFORM_DEVID_NONE for now (well before this
change). Changing this is out of the scope of this patchset.

>
>> +};
>> +
>>  static const struct mfd_cell axp717_cells[] = {
>>  	MFD_CELL_NAME("axp20x-regulator"),
>>  	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),

-- 
Jerome
