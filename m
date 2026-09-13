Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0E32D739C
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 21:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334790; cv=none; b=cdt4p9bhejSXCHMOso0LNFlOuwHu4fwDb+s/YxVIlUCOd9wi+osQ6ypPYNK6Eu3Sk8Ps5PiwmGx0x8AdpfsCxMYX3+tkJT5fgDUEsRZNZ3ge8E1QdiDTdb8IGdvnNarDHx8qI9ZTVVzptPo9IBm8RFYGXqg+6ZPlxPsro3fdZQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334790; c=relaxed/simple;
	bh=u6mcKlM2CEVDLAb1ydSNvueMv3v7ctmWVUuvqtxgxxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+uueCmo3taDzJRpEIJzHz4mqS/+uLoPvt+ydqm5D91xKhFR91bTfh7dCtNv6v+sDs0flTxjmBM68pXNVILjCAkNwEwlZ/FvWF4Yt+LzGXp1yNUsLPG1sAduTE7Az7iZhySX0jnUcw8awU89qAnzWJcdZnOCIHDv3acDt9YYZGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zkf6kCj4; arc=none smtp.client-ip=74.125.231.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zkf6kCj4"
Received: by mail-oo2-f0.google.com with SMTP id 006d021491bc7-6a3900cb2b5so1109784eaf.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 14:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789334788; x=1789939588; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CTYCoXrMCbgppF0VvjbFEflD3ptsCGeOgsPUI2PqnU=;
        b=Zkf6kCj4gWldcMhW3XBlsHXMutsEmu/GA3uDolaIvvU6TKzMYWnZ8xLwZwhFC0O9Hv
         xHZZLfPlldtzXyw6VwH/wRgeLZpXfrew5gGzmzufTFnCRQncEJfj/oPkd69GoR5aZ10R
         4LZvEndgz7r9NAs910B5g9vkfJ4LdVJPPOga0pglW8CtxruXVvcMD5NLNgbm/ZSF/Hlb
         Oqeh9CiMi/bDaKB3b7u32zOptiO4jzIkqIQp2r4hgjKCz5B/eny8czQVyiEI+iaKiZR8
         cRRFbi1EWUT6Yk1Bq1cbYY96wpTVlLkL8hz1z/vAprTXDIa7o7t1vWHjJv/9slfmeNh2
         h+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789334788; x=1789939588;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CTYCoXrMCbgppF0VvjbFEflD3ptsCGeOgsPUI2PqnU=;
        b=Usho/OSaMloSztPwJxZTvObFltzggbT94y5/7yYRLU5R7TsTooo8pVVrUk/U7gYcz6
         cu6EV1szPl9ZHXoW8XGlkrwoCIBkRBKXzG6VE11NY2YHj4brhVoIvtCqNImclclqK8HN
         Zd432TTke/y5pwn6ciLS2oaUBKYOTJ2aMBhqLh+GGvGRgU71mg4jcmvjhuuTsotLmTAX
         B5ci/CmnqdlDK9k/LTAbafpJbTaBMYEOCRZHkHrOz23XBCu4dbJlevpJYQXJswx4IdpB
         IVf1GCMwHYGHKhEaXkXaWLrCQw71XJsESxegeFASHP8LZ1x/s+FeQOmzUA4CBYcXH5AL
         XAiA==
X-Gm-Message-State: AFuF++lCG2ZuY99Uf9v77W+jf3I8QnVrSgUtUd0FsoADkBh52UeGdlj+
	1wxH4YGfMqYmtOJLxiPytqJB+mvm6Kpjkor6e1soabXmnfQ5VxEVh89mzCGMAm3nHiE=
X-Gm-Gg: AYBFou1xKSjB0qkAeqovzw5bywZh3jl+80SJ8SCeprsbzbN2aFYvCyHlZ3AOqGpwAo1
	fi/+5gPZm4gn7DceYZuAdSVJm1RFV9CROPr2CS+aui0OP3v1JdeRicC1zZtAh0EaQ9OiSwwZ0Hj
	s131XK3lbW4zX9SxQbZKAZ8ZO6c5IYrCNp/XXcc+xuPYHo3XLnDXnJF7tPZ3A82Vskp/gDUsZPq
	TCXeOMCUwj8ISemoC3CcR5B5PUktz76sfFtdNMx3vYP/QWYiUBDpodmPzcJtARcYs1kc2viUfMO
	IpyfMyZU7xiNGM7JwJobWrgDJ5cRpie0CSM3LpMQCmoQUwHOLsNojApFkAkV9J5VVpR3Hv30UFx
	tXAUuCZTEaIViOCS9mI5JicltPuQUst9SUdiUWjpSt9ZYyplS4PlXhbIWlvI4QlJy07C86BAugH
	0abPKv/EWe0a/ZkG0eEaIhJBK0AenYIZWmqkHHwhhih/oEfrQf6188Q+9cgUfSvszOxULA+a1jT
	InFjOHmVeXo6bGm
X-Received: by 2002:a05:6830:4989:b0:806:ab05:c1dd with SMTP id 46e09a7af769-806ab070e59mr3162930a34.4.1789334788390;
        Sun, 13 Sep 2026 14:26:28 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f670eeccsm9165053a34.21.2026.09.13.14.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 14:26:27 -0700 (PDT)
Message-ID: <e657312e-5e2e-4f57-9718-31f13e622422@gmail.com>
Date: Sun, 13 Sep 2026 16:26:25 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: mt8173-mfgtop: do not use the clk API from
 power_on
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org
References: <20260912-mfgtop-no-clk-api-power-on-v1-1-def157ad1277@gmail.com>
 <20260912184456.1DB0D1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260912184456.1DB0D1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/26 1:44 PM, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Since this raw regmap write in clk_mt8173_mfgtop_power_on() in
> drivers/clk/mediatek/clk-mt8173-mfgtop.c directly asserts the gate in
> hardware, bypassing the Common Clock Framework (CCF) state tracking, the
> clock's enable_count remains 0.
>
> Because the mfg_26m clock is still fully registered via mfg_clks without the
> CLK_IGNORE_UNUSED flag, won't clk_disable_unused() forcibly disable this
> clock during late init?
>
> If a consumer has probed and powered on the domain before or during
> late_initcall_sync, clk_disable_unused() will check the hardware state, see
> that the bit is active while enable_count is 0, and turn it off by writing
> to set_ofs.
>
> This abruptly shuts off the internal power management clock while the genpd
> is still active, potentially leading to hardware hangs and failure of
> subsequent power-off operations.
Yep, that's a real gap. I'll add CLK_IGNORE_UNUSED to the mfg_26m gate. 
Thanks for catching this!
> [Severity: High]
> This raw regmap write in clk_mt8173_mfgtop_power_off() deasserts the gate
> directly, overriding any state assumed by CCF, which is part of the same
> framework bypass issue described above.
This shares the same fix as the first one; once CCF stops touching the 
gate, the raw set/clr writes from the callbacks are the only writers. 
I'll send out a v2.
