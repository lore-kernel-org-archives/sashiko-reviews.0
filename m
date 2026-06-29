Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D6D348C44
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 13:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741507; cv=none; b=Q5B7MgaIIsfmLOPIwj4MdDEilkBysLJBSKBqFmetluXR8VBbe6QwcbDxkB1KwMgcHuV125BMkyxqF8x1OBa7bxXJotscUJzj0iVSeslnkoL3aAkWol0rfIzKh+UlvcNRiSFPjn8BIKQUykCp2FJq6yb22j83KDEv9qwyzIZF31Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741507; c=relaxed/simple;
	bh=yOzbqmPiymX68IbIPL916O/Rd6K79n+KEjdHVuEkcE0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qYSh2aLdHv7I19ugq2WCRNuK230ODtCX3TokMcFxhBJvH6jbBVf52wNItmiFn0SP3gdcuJscXhZPJ32uScMn90uGu0BsRu2ZRZpEOw0xpDSH3iql8vsdo0aqfO/TEDS+JSIaQ44o7JdUPpXufEL40q2ao2xmgzqC4tWUWog1i/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QOK3Z+Js; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QOK3Z+Js"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso43108575e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 06:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782741504; x=1783346304; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PATmqIJOT58g+w0bwm0EGEjm0V85SjTo4ZbuYUtUfhE=;
        b=QOK3Z+JsuDmd7OyWwshlrCFWY8mdm9vWWlAddqnRarhCwZFL7fKGg21XbLL6uVdx0M
         Nk7F/7rNYlzjoctrAcXqpv0Yhft3vIM0EqYm84ec0UAe47dK4ef3GU1O0jGxd6mNhZoZ
         E5vbQUZmrej8b73fMZeOZaYPCyMM5QEXGepVhYmn6mSXR5Gth1AlT9jffHZR6Pd2b+zJ
         5ACCggvVgqqqv4c8M5hkLXzoW9n06Fx4/Y3fV4UAp9fZV9AVjKi/gBuwKIvOLDLMvrb3
         OyzeKaIhHthaYwZuNon0DQP4MXRJvpSzDCKIvFnjCiNeA1c2GZh7Rm0XXUHE+s3nUDQ0
         ORFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741504; x=1783346304;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PATmqIJOT58g+w0bwm0EGEjm0V85SjTo4ZbuYUtUfhE=;
        b=jYqcSGe43IqmCqStJAO3CGXre9rH5NZQTgp6diokbmGRGLxbW/vvls/G57TRVpfbkz
         BXu6YyLu6rRCLDvVGwy/dS8Z2D5AIFn+kmZ059i6biuYC0eEN4E1DYle7b2mLDbsmkVl
         eou41Zgty0F9UyJW6zw8qHMOTFxjvJiEGyi3TZxb3mIZj1iEuDx8t7taNQQCv4+EJk/F
         USLG2FIOPxpWS8fgyAlzTDZTlxz/F4UhihWZ7zzkSHbZlAZnTutSl8cnJOdopekmM4li
         jYxMXrnNd8w4rGja4i1WfAghhLj9SrLq2SgfMZQZADP7LqYQqzc+D675OpGhhRHHDpta
         3+XQ==
X-Gm-Message-State: AOJu0Yx5IEqeFKiQz4a6/UUo0lfhPhy1/3og1+EP4Zms/eAH37ew0eWp
	Kh6TXfb2Bntd66Lp0vBYtgo78hOhw+EQSesAzr6mOGPmAKQg2y26SPDH6yPArqSGJtE=
X-Gm-Gg: AfdE7ck1NfozFEXThPmf0uP2Ou9bJ4ODwdtgnA46jkPKNewn9GYg0nbc9KGCgg0oSmx
	i8knt0pjCRiw+3atISWaqE5nX0w5Pz3quSbYwBnPGrQDVwH5/21pUk3IA0zzvALM6v81GUd/Jzs
	xGfbH/5fZaMZt1F8DID71LbuJXad0msyj7ZEd11HnTW0g4gEvx8s+GaCNjE5AA4DubjyO/t1uEJ
	GHZCsHzf2AzJEwIPipYpMh6Tk12yIaf03AktwIKQf2xVS9tthLJHbQvI65uJknreXls9Ljp0W8o
	/yuyKtSMloynPochMbe5CscqyJEQBkVKRADoAg1MZSiCJgm1NZLDsmXkRFKp+wXOjqrSgpEyu0k
	MdB5LyIc5RlmuOY+rf5B7qb6XVmrqIGoRJ4SSO03+CCl7vC035aXMaV1biHxRQmZeHWj81+ToUH
	IK5diudLqyjPY=
X-Received: by 2002:a05:600c:3b85:b0:490:50c5:8153 with SMTP id 5b1f17b1804b1-4926683231fmr259468755e9.2.1782741504468;
        Mon, 29 Jun 2026 06:58:24 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-492690100c7sm351172685e9.12.2026.06.29.06.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:58:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  linux-sunxi@lists.linux.dev,
  robh@kernel.org,  devicetree@vger.kernel.org,  conor+dt@kernel.org
Subject: Re: [PATCH v2 4/6] clk: sunxi-ng: div: add read-only operation support
In-Reply-To: <20260629130342.73C851F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Mon, 29 Jun 2026 13:03:41
	+0000")
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
	<20260629-a733-rtc-v2-4-7b72112784f8@baylibre.com>
	<20260629130342.73C851F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Jun 2026 15:58:22 +0200
Message-ID: <1jcxx9a1oh.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 29 juin 2026 at 13:03, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] `ccu_rodiv_ops` omits the `.determine_rate` callback, which breaks rate rounding, reparenting, and proper rate propagation for clocks using `CLK_SET_RATE_PARENT`.
> --
>
> commit 97a1d0e7adc68eb81524d76b0c667da1b5f1be50
> Author: Jerome Brunet <jbrunet@baylibre.com>
>
> clk: sunxi-ng: div: add read-only operation support
>
> Add support for sunxi-ng read-only dividers to be used by the a733
> oscillator detection logic.
>
>> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
>> index 62d680ccb524b..0e3d9e6e30fb0 100644
>> --- a/drivers/clk/sunxi-ng/ccu_div.c
>> +++ b/drivers/clk/sunxi-ng/ccu_div.c
>> @@ -143,3 +143,14 @@ const struct clk_ops ccu_div_ops = {
>>  	.set_rate	= ccu_div_set_rate,
>>  };
>>  EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
>> +
>> +const struct clk_ops ccu_rodiv_ops = {
>> +	.disable	= ccu_div_disable,
>> +	.enable		= ccu_div_enable,
>> +	.is_enabled	= ccu_div_is_enabled,
>> +
>> +	.get_parent	= ccu_div_get_parent,
>> +
>> +	.recalc_rate	= ccu_div_recalc_rate,
>
> [Severity: Medium]
> Does this struct need a .determine_rate callback to prevent breaking rate
> rounding and parent rate propagation?

I don't think is a problem in the specific context of this series since
not parent on the RO clock may adjust but it is indeed something to fix
in the next revision

>
> If a driver registers a clock using these exported operations and sets the
> CLK_SET_RATE_PARENT flag, the Common Clock Framework's
> clk_core_round_rate_nolock() falls back to a pass-through behavior when
> .determine_rate is missing. This causes it to forward the child's requested
> rate unmodified to the parent, ignoring the divider scaling, and also causes
> mux reparenting to fail.
>
>> +};
>> +EXPORT_SYMBOL_NS_GPL(ccu_rodiv_ops, "SUNXI_CCU");

-- 
Jerome
