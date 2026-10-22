Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653224;
	b=5FyFz4Tat78GJDdL20m29LMYLwkQOPSBGlUt90+VOX7r6zc8WV9yANGjQc2RsfUiMxZs
	 rO8U88gBBKn+mTPsFosGZXVamku6OP4QLy82G+r3KgXTQbCrqJ0V16BYNp2OjTAlnm+Bi
	 CMpWpkmXVZwEfk3aJ9tWwVC5xJ4b0nY8LeH3N8k9VgvbMIjFELeW3i40v9AcinwAF9/AA
	 dfTOv14boexZGXUTlLODhzKfpFMe4tJlJuH1FX70kJBvZ9Jj2ICEu0NVUEZPp8dWTpLYY
	 l2HQU5hraQv0w15aBUoCC/SKAX2UNjfcgk5dvt/8Ebj+WrMmCAW75kx2QVTy4E+u6HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:From:To:Cc:
	 References:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IhTnwyrV+10d78ygQYXl308AUWomjFkKSrLiwOtEx64=;
	b=ehvAHuEFY+BiOk68x8sCXn8avdtQFApC8F85vOSSi9qEwQR0eXwDuK8EHDbtnUFegoV6
	 jOIbYxTIJuPAR/7fqMKV1d7S0WEKLJBMtkOhDnt+e87Unk4SZ0GS/ww1tpqvaHMNOdesU
	 9gpbtgzai6dG4ORB0w8Lm0vHbJFsxeBktB7KQW5FghG2Jnt1d/CMdAehb0PBdiNOqmgCt
	 1dxPlkg4rTIDF4Mn05i91PRBomesn8PbJ8PJnZIXgc5SdzCb6sfyh+xGCzfVjo3yGuIpv
	 mC2h53+M/oUJfFNwn7eLM6IzcwPBsMxJpOZzb8nnZOv2GbGv+orL05EZUeDEdVSJjlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=k+fVTXfj;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1136D606A31B
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 07:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1136D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=k+fVTXfj
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df54150dfso916648f8f.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 00:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792653221; x=1793258021; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IhTnwyrV+10d78ygQYXl308AUWomjFkKSrLiwOtEx64=;
        b=k+fVTXfjl6c+awpEaqvOVjBhgeIC5d7XsImWrgoaWNkWc5I65fVn6sLiP7Jt9z171K
         12uQ6T3U6XIrTfvyg5qslytyqPjfM4z3sbHKi8XcWfJJgR3UWzqQU4l6pq8DTm/qQ8wB
         ECrCAI6AdTp7v/QIslBUhFEhiexvxG2schwPLJIsxRPj9hlgj1ULtDMcGdARmsMZMyQ6
         HPb67ysL2nuTSCToSed18839rDOe3XYE4yal5uAzXxGV+qQUeXZepaTrsRFM3xUa85uU
         GHyrD4z0MNqQELTEvO7wifFJaZZiHNDnS61CJMAIrj+QwMrwzV+My0E0Qw0K3mPasdel
         uUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653221; x=1793258021;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhTnwyrV+10d78ygQYXl308AUWomjFkKSrLiwOtEx64=;
        b=cLNwtBPaArtVLb/f+BPNnmKBxwpLkBVgKniII2NzAliWMkjkhqpXuVgvhEeMBrwfNd
         6DU3Ki7YUOrQd9fLFKNHw+K6q1ClaojsemcrEUcRAR49gl/kJ6q8fZWB+2SiJZlL/R9g
         /Pni+PTQrRK/Ft9jxQXaGLmfmfCW58MLG7C0qJnyWIJr8+m+sS8O1WwVTCaj9kae67B+
         7+/pdhiB051EYEePg1L+Kk3SWC6+GdOrH8LVchmURHN+HuUBwfRVkl8Ym+19GtzT5ldz
         wvJHLTZM00TVjnZR6kqYtz4SG4qcQ2KKUx9+zbAwVD3T9QjadaZHoBLmPRH31l6a26zK
         DnOg==
X-Gm-Message-State: AFq9FYL6HoTz1g2rZjFXLfNp1vwBy3R8buNIsuvP430tOPgFp7rmOOh+
	dHMvI+mt/ighobnDB4rkLVLQZiDRqhSLjN9ZLDDYYlUUYbHhT22MfvBWiwXWa6Svi+uOFJ8kN9k
	Xg6ZZxnE=
X-Gm-Gg: AYBFou0AHZwLGlAoP9y0yNZJTv1iraBrOwBIhXVnQE+GHbz3wNnVtl76FX26xkrBWS+
	0HTcliw1GVhqt+12tPmG3LhxJhrvR61IFff6bbTJH4SO41jFBsSZlSr0M5HHc185edP2vc95cAe
	n6JkkSK8a3zYtJnaMRHglIYiZf/JnOHF9ju0W6GLw8iQR0HcX8t+XbbwXKtnMwE/Fi36Nkd5nrp
	aIFCKsVWUQoAiUWBN0N1LXYmSf6lQ2Z75ER3Fv+c8LtcJnfbRv1zwzPFFa6FsX/O0RzK1hDFTyQ
	eO9NxN6sOIeAIC0jpAN269qAo1APsNIULw94qqo4Jx9xvqJf3YRn+J2asfN8KZ+5FRw5Wr3RBKk
	7LfV6sl+wDSF1XtZ9DwdDvEFSKpUOE+MvIbwAOTjciescpnM82RynzVdR9FIFExcn5Ip+olpH8P
	aKdDQb8WxNzaMe405Oaj/+xkFpUbHMFP4Mu5VMos5rfy5VkKKbGMw+JN3m9gKQXGYo2BcOKBih7
	A96L4/JjVsSyt3Jc02T+fSFz069lyA/Pub1BWmA/IuX6U+JNmaiJMBsOFbF
X-Received: by 2002:adf:efd2:0:b0:48a:efed:ac97 with SMTP id ffacd0b85a97d-48e264f06c6mr6394983f8f.33.1792653221001;
        Thu, 22 Oct 2026 00:13:41 -0700 (PDT)
Received: from [192.168.3.100] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f093asm10940668f8f.4.2026.10.22.00.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:13:40 -0700 (PDT)
Message-ID: <45986fce-98dd-4df2-bcf5-6a0de7e41ca0@baylibre.com>
Date: Thu, 22 Oct 2026 09:13:39 +0200
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] ASoC: meson: add AUDIN driver
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 Jerome Brunet <jbrunet@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-4-4b8cc13a1b22@baylibre.com>
 <sashiko-outbox-176054@kernel.org>
 <257ab6d8-4990-4e58-9eaf-9cac3cb29b01@baylibre.com>
In-Reply-To: <257ab6d8-4990-4e58-9eaf-9cac3cb29b01@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 3:02 PM, Valerio Setti wrote:

> Finally the question. As I said, since the issue described by Sashiko
> seems a bit hard to hit, I think the fix can be postponed to a quick
> follow-up series. However if reviewers deem that it's absolutely mandatory
> to fix the issue before this series lands, I will either prepare a small
> pre-requisite series or add a new commit to this one (I would like to
> know what's the reviewers preference on this case).
> 

Never mind, I decided to follow the correct way and sent a separate 
patch fix for this yesterday night [1] :)
[1] becomes a pre-requisite for this series and, once merged, all 
Sashiko concerns about this series should be resolved.

Sorry for the noise.

[1] 
https://lore.kernel.org/linux-sound/20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com/

-- 
Valerio

