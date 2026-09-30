Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCED83E8C64
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 07:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753995; cv=none; b=O94Z+qn8anQ4gZBs74FlZgyC85jxVN+o9gtfKFwMVVGm/9IrYdAc9mMQDI897COzmSbxpoKQ1lj/QYUxxiGiEXKI7IW1f6uDfKaVMg9tYK7n+eycqhbx7I8wNhyCTnSFNpnhZ9EiTkx5cKEawRhL4DE5ym5pcjKcS7A+0HqIky8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753995; c=relaxed/simple;
	bh=eM9YEMN0376wWN1d6mMXq5KIUAZSu7n8NX9ie88Xhyw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EPBWuixtzcgjY0Kw7+i6Ys6OoOJfoGo2P287uwRbkVfOLgWNpdAd16hyjCk1uTvcWDaD698ygrE8EVeGbGagtrf2LWLjbZZbpK5GmjytPkUDRnRKQwOljhZSiVLZNBthborfSCcnYx/JjZUezYF5FXQAFdEE594UGVvyDx91e5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=d8qyr799; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="d8qyr799"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffe817151so20848755e9.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 00:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790753988; x=1791358788; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eM9YEMN0376wWN1d6mMXq5KIUAZSu7n8NX9ie88Xhyw=;
        b=d8qyr799ETDGKuKZ5FGLfMaHXwxGskqZLLHQEca7GFbqTMW1ocntKOBCjMY06cr9Pi
         9a+RCAi13RmKhRhFpvErq8qoH0LTRmzLB60Knd+SMyCM7He9TLS0pfsEtREU5B12u3Hf
         MclriXfW/PlJqWr3oU8dxC4w5GjxmExypEjAznsqdCCp8s0lTj0qnRCKgGiujH66cLkc
         RVrXj8OmdDi3eHRM6b6uEEvnxSn69dYx4GeLZ+AoXwXsnGcrR9qDduRTN5kIumKYC9Sx
         j5igCwfw9D68GCqhSadjmqcxQxF64/2fBFDoLif2xBFn9dwVtYH8fM/oWUoypdk7Lmru
         zjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753989; x=1791358789;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eM9YEMN0376wWN1d6mMXq5KIUAZSu7n8NX9ie88Xhyw=;
        b=giy3a1WDzP+SV8UHpSqSESDXKHfFKb0PQ8VTwy+MKrEQ1SerRdrLgI3132z6t8diTT
         RMYuQNi7ii4OzFnt/zAVKbnas1gXUvLXoUS7rD1ZAGq7vJqKlab34v1JsuxYXO4z8WB2
         n2vV361UjlJwJlm4qivTFX3VzjjSDXQMV/a2j7ccLhZ/5j2aJKfAt0wEUccnUKEb99Dx
         AT6MGg1XpYx2N9BZq5pcByVp67Lb84DKsPBu3aW7ft8kmX+kJtz7FG26opZJgaJbMOZ5
         YcKGqgaKrw6zvinPI8alKDEr9Bxtsgwo+lHR+eRnVbXFc3QxfDWtewwzM8+ODQ6fZqYl
         t6Vg==
X-Gm-Message-State: AFuF++lJ209jd6yOyOn/drcv3SJ53y6nCF7jfYe1RqsqATxSzu0G9bQv
	+jML0AWRs3OLeUEmHdkRZ4a+E1dsfv6ZGJg/9ySjFEC/g3LvoV359rqqvr1GMi+hmQc=
X-Gm-Gg: AYBFou1v/OZRSWIbF2wTPFJk2moBVfvZEZf6rLf/TSll2xXQvnrCuiB2jnvGN404IyF
	lMunJWTftwpCVT4IgCUqaa7DCkmmhv8TIG+StJ2g2glqg+1zBhXrQ6/zyBLOxu10NDxVBskGsh1
	zEtNiRW/uKwPYSueeLuKdbr/IaU7x2pIKqpN3EqX5TS1q5uDDFAzt6xp/8E+JfBrbft139MkvHN
	vrG6c9eSN7N30xigFMwmdiLTxcpYk3gBnxKK4vSCdAVKZJ1ZkiKw07zd0llUIW4kpA4R3m6UvRF
	fmpnNIdYdYeDzF/k0Q3H1bSqe5McZ6Upv7C3OKnBN2F7CQiRc1mds12/6ccNejR4Etxsr/eypEr
	tE0ulCj4yUODd7d4JOW70bq77HBse55ES52Y3pp6rYL2s6ZPUgnEBpTgm8peJE2nWm0NuW5KRtM
	R/aRCgQyLIkX/hpme9ldgsiESmV+J633y9g8Ok6bQH9JaWUm7bXSEBD9TkWbGM9hTNp86gDzvtJ
	xs0RUBP1CNJoVwZjsIIEtI45joJ
X-Received: by 2002:a05:600d:82e5:b0:4a0:61b:ede1 with SMTP id 5b1f17b1804b1-4a01afe1e93mr8170315e9.7.1790753988705;
        Wed, 30 Sep 2026 00:39:48 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02949f3asm1432327f8f.1.2026.09.30.00.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:39:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v5 8/9] clk: nuvoton: ma35d1: get HXT/LXT from DT
In-Reply-To: <871pab6bhn.fsf@bootlin.com>
References: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
 <20260929-perso-ma35d1-upstream-clk-v5-8-68533e935ee4@bootlin.com>
 <20260929145618.187A21F000FF@smtp.kernel.org> <871pab6bhn.fsf@bootlin.com>
Date: Wed, 30 Sep 2026 09:39:47 +0200
Message-ID: <1jzewz2nng.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mar. 29 sept. 2026 at 22:36, Miquel Raynal <miquel.raynal@bootlin.com> w=
rote:

> On 29/09/2026 at 14:56:17 GMT, sashiko-bot@kernel.org wrote:
>
>> Thank you for your contribution! Sashiko AI review found 2 potential iss=
ue(s) to consider:
>> - [High] clk: nuvoton: missing IS_ERR check causes permanent probe
>> deferral
>
> Gasp. Yes that's correct.
>
>> - [Medium] clk: nuvoton: hardcoded parent strings cause orphaned gate
>> clocks
>
> I don't think this one is serious, linkage is reliable because we
> leverage the device tree nodes in the clk_core_get/clk_parse_spec
> path. The fallback is indeed based on string matching, but heh, that's
> because of backward compat, not my call.

If think it is a legit warning.

Here you say that your "hxt_gate" will parent to a clock named "hxt" in
CCF, but you've got not guarantee that will be the name your externally
provided clock.=20

Its fw_name is stable for you but you should make any assumption how
another module will name its clock.

You should use parent_data here with .fw_name that will match the externally
provided clock and .name as a fallback if the clock is actually provided
internally

>
> I will send a v6.
>
> Miqu=C3=A8l

--=20
Jerome
