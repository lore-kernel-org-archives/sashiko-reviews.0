Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7388851DAEC
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 18:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756073; cv=pass; b=cgVpCRBUiXhqtjTThjQBuZzfylAta0Y2S098q/k2PR1PpIAiEEIb8AvjyCO+wqaMcb9Tncw5CJuMD2s7LHnAuEsm60RSgSY80MDyRvdCcczcUhIwWNZVwsoBwVNvrleIdvu3VvtHb5cGz0MynystyoXzJHUcsiYxo6x2acVjDuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756073; c=relaxed/simple;
	bh=CehHEgeM+pdJ84HcW1hUWFnVx85CKeaL98EzBzD3WlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oun8APakX/E01UtuO8EDB1DvtGt+uRSYYpg4vHuLupJFAxjXyDR20k0YApiu1SvpeIRgqGR8kKVruowYsK+u0fwwZjeeYxfBAvecIMEp4iqOIQCC8Ae00AfMRk3QBfqhWaoCSc/75IGAI1lADZxtHXhXz/bBal4OZab947Tunv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=WIMOboLB; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="WIMOboLB"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d45ae011cso11429777b3.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 11:27:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789756068; cv=none;
        d=google.com; s=arc-20260327;
        b=SLkcgsrvKT7pDxu1SYOJ4pS7oIDYSh95IJnK3iTXSMg+w8WJjuUYFABN9OVlTDa1/V
         grrdRNKlYLpTX5Ouy/d0/y8ZTl0CcboinN9s0lL9D6N0BDBi1t3TjYPmP839nNVnLW4E
         IrYrKU/qGDqwJCniKRbe9bXAxDMgZN6EURTIj3Gip5zhxwvK6xhOX0nzIFpQRVdH7RUV
         XKZLM3nTfLd+kLpyfGpIb11+qqhxrJxe3IzCfVSG0pSoqgxLoDP7Xdl2TRfVRxG7NDqm
         0wB9BbNl4YjVszZeU+T9OroIaZVkiiHP6evvnShThI1sdcHvvEiW3UWGxz1BjoR+f5lR
         1C+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mSi+JtaOU6ls557xXyeB3xrqvaX8RUi/FGWcovRXz3A=;
        fh=rEbUDeSlRDHDClN5FFB/8opoJgSDYGApSTj8TnPxcCE=;
        b=qjnv06WYC0iql4avn3pkqoK6Z1RBBX1YC6ELyjp3VHvtEx5dypXsYUDJus1eGx8m3Z
         UiKlpa+PZv6bqW5+nlHVwq+zL2qT7kHdCbdfwwiMomRcMqCNTMKKi3COyxmNxHdOW+ov
         wzteAf9czo8Dy1RwjQbzYFkYvVa5if8hlbXwsUF92LzLVjTdTm71w+DGO9b7cDU3FoM0
         DA2jDRfFlOUXaxpzL5k1OJ2e1kUkj1lXMZRT5Bxl0m6rKDdemcDv7kp7HaiAWA2V2/HB
         M5rKF1MIEnT3NgiahC+yPnYNQ9DfoRfLSF2NF7KeZsCdQwNKHigyMbKtVsIcOWU91Ke7
         EIHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789756068; x=1790360868; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSi+JtaOU6ls557xXyeB3xrqvaX8RUi/FGWcovRXz3A=;
        b=WIMOboLBw2FbeeAwtAJK0/yeopfWtbYBy9eulcz0t4Le687wmtp579X7CzKekCYiub
         tmrYLKvfAdk++7/Co5wTy6n5rfRf36JBzeomrtpIJQSwNPFCo8RClRn6zcol60CAVPjc
         faBCOXmhSU+VTIGDvqxFaB034MGM6G88YL29fR/UIISzg97hfc7H7RZfDG9H+94qCkar
         A8QhbqaEAh8Mg46z9aYwl//NZmKv6JTmMKKHWohAMT9jfwQ1OwEl8jOheYTLJIuYMXK5
         OLLnx5H/S93u5cLtgo2UyjYPpD65UcTTghIxkNUfLnUMJqNmgUhjldyAxNx/uajDFCFf
         Eafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789756068; x=1790360868;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mSi+JtaOU6ls557xXyeB3xrqvaX8RUi/FGWcovRXz3A=;
        b=D04kmv17dnrPBLTckc/zqXYIgbsI6J/hcLM2szC/EfJeDBa0DcoIbJE6k3bvcLtP6S
         sUQ3R6SNPpv4GxNRn80lrk/H2Muv961rcWQQFrYx1GKqj50F0NxXDkJ45S7JynBXHa6f
         gnQmpCaUo3JID4A0M+wzVEKH72kLbdKPDAwl3XoZx0rsbMJyQATqjuqHexBfR8Hw+7zx
         HvyzCba0S7kTISK0Z1LuLHYsRn8fzjtkT5PwJj8cq62N9JWfrUy29QlomD2u0nKu9c1h
         GGsv0OvBdHFPG/rjek78qcM618iG7yrq10xtueVKkDpCGFhSUjSQ1WidHH+LDUZTLr5k
         hzig==
X-Gm-Message-State: AFuF++kY6uX9QyPuKgbCUNCRYMQluSlZMRURFx+NG9XHJjgbvWnbcLWa
	wG8rHJy6OwKxnAogu4ZKx8Vdin3jKqV3xtB0xqwCPeE7W/HFsntkxxsV2p/3uNiFP1FNjZgRCZJ
	Eoezfc/TInxVOsUUr616L7cu6nXGZHyXxZ06DqGEvF6aWe7q0fvC0lb8g5gLp
X-Gm-Gg: AYBFou0RwOpCzldBIBPRDzHRn2fdDcxSmqcYaMdfh9LVyes9zKU66yvWvl6ocWyDBYX
	SQX/oIyMd1sXVAa3HTkW/kCZg19gIENzsLZ71QmYnjt6IWRoobz8ps5TkXeQMtQzrHcMXC9vqYf
	0fIa0UBnMS4QbMMGQ01oHk6d6xsRSc50V3vGj9jHqGcrzEklsq40dmPo/p4lo/Efr/gncnQog6q
	KOHIq90eA7osFsDH3Nh6w4WzhuXNsPAc0jWyfqq+22XxlhCe5vdpS3a2glBF3vj/p+p8hvRTr9H
	ggjOfG+ArCtIFoAEmFWtiWEjvAgprUSl3lXryKecZ8uLw/wdD6zPDQcUfb3FfvUo/opMmSwNHy5
	JNWhQavqYXNE1
X-Received: by 2002:a05:690c:f13:b0:89a:63bc:8c3 with SMTP id
 00721157ae682-89a63bc0b51mr1161317b3.77.1789756067983; Fri, 18 Sep 2026
 11:27:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918031326.68542-1-karl@asseily.com> <20260918031326.68542-4-karl@asseily.com>
 <20260918032414.DA9E01F000FF@smtp.kernel.org>
In-Reply-To: <20260918032414.DA9E01F000FF@smtp.kernel.org>
From: Karl Asseily <karl@asseily.com>
Date: Fri, 18 Sep 2026 21:27:36 +0300
X-Gm-Features: AcwNN1UT5LNp3dA_PhMdzD49GGBeCsZBq_3bsdgYVOg6s5JM-3kAuBBBQQ5Lo-k
Message-ID: <CA+gvwbot+W64DPHxgFNM9PfPF7tPVzhOmkLgL5CjdwPPMwSU2g@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M
 codec driver
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Low]
> Can we use named initializers for this array?
>
> The I2C subsystem requires explicitly named initializers for struct
> i2c_device_id arrays to ensure proper device matching.

Not taken, and I do not think the premise holds.  Measured against
broonie/sound for-next: sound/soc/codecs carries 202 i2c_device_id
tables, and 136 of their entries use the plain positional form
{ "name", data }, which is not a named initializer at all.  The bare
{ "name" } this driver uses accounts for 196 more.  Matching does not
read the initializer syntax - i2c_match_id() compares the name string -
so the form has no bearing on device matching.

The other three findings were real and are all fixed in v4, which is on
the list now.  Thank you for them - the FIR-versus-suspend one was a
genuine bug.
